<%
' Kết nối đến cơ sở dữ liệu và truy vấn thông tin người dùng
Set conn = Server.CreateObject("ADODB.Connection")
connStr = "Provider=SQLOLEDB;Data Source=VUHOANGHIEP;Initial Catalog=WebShopping;User ID=sa;Password=Zmxncbv2002"
conn.Open connStr

' Kiểm tra nếu có yêu cầu POST từ form
If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
    ' Lấy thông tin từ form
    Dim  productname, fisrtday, price, introduce, discount

    productname = Request.Form("productname")
    fisrtday = Request.Form("fisrtday")
    price = Request.Form("price")
    introduce = Request.Form("introduce")
    discount = Request.Form("discount")
    
    ' Kiểm tra xem có nhập đủ thông tin hay không
    If productname <> "" And fisrtday <> "" And price <> "" And introduce <> "" And discount <> "" Then
        ' Câu truy vấn INSERT dữ liệu vào bảng tickets
        Dim sqlInsert
        sqlInsert = "INSERT INTO products (productname, fisrtday, price, introduce, discount) VALUES ('" & productname & "', '" & fisrtday & "', " & price & ", '" & introduce & "', " & discount & ")"
        
        ' Thực thi câu truy vấn INSERT
        conn.Execute sqlInsert
        
        ' Chuyển hướng trở lại trang danh sách tickets với thông báo thành công
        Response.Redirect "admin.asp?success=1"
    Else
        ' Hiển thị thông báo lỗi nếu thông tin không hợp lệ
        Response.Write "<div class=""error"">Vui lòng điền đầy đủ thông tin.</div>"
    End If
End If

conn.Close
Set conn = Nothing
%>

<html>
<head>
    <title>Add Product</title>
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
    <h1>Add Product</h1>
    
    <form method="post" action="">
        <label for="productname">Productname:</label>
        <input type="text" id="productname" name="productname"  required>

        <label for="fisrtday">Fisrtday:</label>
        <input type="date" id="fisrtday" name="fisrtday"  required>

        <label for="price">Price:</label>
        <input type="text" id="price" name="price"  required>

        <label for="introduce">Introduce:</label>
        <input type="text" id="introduce" name="introduce"  required>

        <label for="discount">Discount:</label>
        <input type="text" id="discount" name="discount"  required>

        <input type="submit" value="Lưu">
    </form>
</body>
</html>

