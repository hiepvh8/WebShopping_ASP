<%
' Kết nối đến cơ sở dữ liệu và truy vấn thông tin người dùng
Set conn = Server.CreateObject("ADODB.Connection")
connStr = "Provider=SQLOLEDB;Data Source=VUHOANGHIEP;Initial Catalog=WebShopping;User ID=sa;Password=Zmxncbv2002"
conn.Open connStr

' Kiểm tra nếu có yêu cầu POST từ form
If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
    ' Lấy thông tin từ form
    Dim id, productname, fisrtday, price, introduce, discount

    id = Request.Form("id")
    productname = Request.Form("productname")
    fisrtday = Request.Form("fisrtday")
    price = Request.Form("price")
    introduce = Request.Form("introduce")
    discount = Request.Form("discount")
    
    ' Kiểm tra xem có nhập đủ thông tin hay không
    If productname <> "" And fisrtday <> "" And price <> "" And introduce <> "" And discount <> "" Then
        ' Câu truy vấn UPDATE dữ liệu vào bảng products
        Dim sqlUpdate
        sqlUpdate = "UPDATE products SET productname = '" & productname & "', fisrtday = '" & fisrtday & "', price = " & price & ", introduce = '" & introduce & "', discount = " & discount & " WHERE id = " & id
        
        ' Thực thi câu truy vấn UPDATE
        conn.Execute sqlUpdate
        
        ' Chuyển hướng trở lại trang danh sách products với thông báo thành công
        Response.Redirect "admin.asp?success=1"
    Else
        ' Hiển thị thông báo lỗi nếu thông tin không hợp lệ
        Response.Write "<div class=""error"">Vui lòng điền đầy đủ thông tin.</div>"
    End If
End If

' Kiểm tra nếu có yêu cầu GET và có tham số id
If Request.ServerVariables("REQUEST_METHOD") = "GET" And Request.QueryString("id") <> "" Then
    ' Lấy thông tin về product từ cơ sở dữ liệu dựa trên id
    Dim productID, productRS
    productID = Request.QueryString("id")
    Set productRS = conn.Execute("SELECT * FROM products WHERE id = " & productID)
    
    ' Kiểm tra nếu product tồn tại
    If Not productRS.EOF Then
        ' Lấy thông tin từ recordset
        Dim productProductname, productFisrtday, productPrice, productIntroduce, productDiscount
        
        productProductname = productRS("productname")
        productFisrtday = FormatDateTime(productRS("fisrtday"), 2)
        productPrice = productRS("price")
        productIntroduce = productRS("introduce")
        productDiscount = productRS("discount")
    Else
        ' Hiển thị thông báo lỗi nếu product không tồn tại
        Response.Write "<div class=""error"">Product không tồn tại.</div>"
    End If
    
    ' Đóng recordset
    productRS.Close
    Set productRS = Nothing
End If

' Đóng kết nối đến cơ sở dữ liệu
conn.Close
Set conn = Nothing
%>

<html>
<head>
    <title>Edit Products</title>
    <meta charset="utf-8">
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        h1 {
            position: relative;
            color: #333;
        }

        h2 {
            color: #666;
        }

        form {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"],
        input[type="number"] {
            padding: 5px;
            width: 200px;
        }

        input[type="submit"] {
            padding: 5px 10px;
            background-color: #333;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #555;
        }

        .success {
            color: green;
            margin-bottom: 10px;
        }

        .error {
            color: red;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <h1>Edit Products</h1>
    <form method="post" action="">
        <input type="hidden" name="id" value="<%= productID %>">

        <label for="productname">Productname:</label>
        <input type="text" id="productname" name="productname" value="<%= productProductname %>" required>

        <label for="fisrtday">Fisrtday:</label>
        <input type="date" id="fisrtday" name="fisrtday" value="<%= productFisrtday %>" required>

        <label for="price">Price:</label>
        <input type="text" id="price" name="price" value="<%= productPrice %>" required>

        <label for="introduce">Introduce:</label>
        <input type="text" id="introduce" name="introduce" value="<%= productIntroduce %>" required>

        <label for="discount">Discount:</label>
        <input type="text" id="discount" name="discount" value="<%= productDiscount %>" required>

        <input type="submit" value="Lưu">
    </form>
</body>
</html>


   
