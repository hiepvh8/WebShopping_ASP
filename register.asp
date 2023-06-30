

<%
' Tạo đối tượng kết nối
Dim conn
Set conn = Server.CreateObject("ADODB.Connection")

' Thiết lập thông tin kết nối
Dim connStr
connStr = "Provider=SQLOLEDB;Data Source=VUHOANGHIEP;Initial Catalog=WebShopping;User ID=sa;Password=Zmxncbv2002"

' Mở kết nối
conn.Open connStr

' Kiểm tra nếu có dữ liệu được gửi từ form
If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
    ' Lấy dữ liệu từ form
    Dim username, password, confirmPassword
    username = Request.Form("username")
    password = Request.Form("password")
    confirmPassword = Request.Form("confirm-password")
    
    ' Kiểm tra xem mật khẩu đã được nhập lại đúng chưa
    If password = confirmPassword Then
        ' Thực hiện lưu thông tin tài khoản vào cơ sở dữ liệu hoặc xử lý logic khác ở đây
        
        Dim sqlInsert
        sqlInsert = "INSERT INTO users (username, password, roles) VALUES ('" & username & "', '" & password & "', 1)"
        
        ' Thực thi câu truy vấn INSERT
        conn.Execute sqlInsert

         ' Lấy id tự tăng của sản phẩm vừa thêm
        Dim userid
        Set rsUserId = conn.Execute("SELECT @@IDENTITY AS NewID")
        If Not rsUserId.EOF Then
            userid = rsUserId("NewID")
        End If
        rsUserId.Close
        
        'truy vấn insert userdeital
        Dim sqlInsertUserdetail
        sqlInsertUserdetail = "INSERT INTO userdetails (userid, accumulation) VALUES (" & userid & ",0)"
        ' Thực thi câu truy vấn INSERT vào bảng "userdetails"
        conn.Execute sqlInsertUserdetail
        
        Dim sqlInsertCart
        sqlInsertCart = "INSERT INTO cart (userid, total) VALUES (" & userid & ",0)"
        ' Thực thi câu truy vấn INSERT vào bảng "userdetails"
        conn.Execute sqlInsertCart

    ' Đóng kết nối cơ sở dữ liệu
    conn.Close

        ' Chuyển hướng trở lại trang danh sách tickets với thông báo thành công
        Response.Redirect "login.asp?success=1"

    Else
        ' Hiển thị thông báo lỗi nếu mật khẩu nhập lại không khớp
        Response.Write("<div class=""error"">Bạn đã nhập Sai mật khẩu!.</div>")
    End If   
    
End If
%>



<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng ký tài khoản</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        
        h1 {
            color: #333;
            text-align: center;
        }
        
        form {
            width: 300px;
            margin: 0 auto;
        }
        
        label {
            display: block;
            margin-top: 10px;
            color: #555;
        }
        
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
            margin-top: 5px;
        }
        
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin-top: 10px;
            width: 100%;
            font-size: 16px;
        }
        
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        
        p {
            margin-top: 15px;
            text-align: center;
            color: #555;
        }
        
        a {
            color: #007bff;
            text-decoration: none;
        }
        
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Đăng ký tài khoản</h1>
    <form method="post" action="">
        <label for="username">Tài khoản:</label>
        <input type="text" name="username" required><br>
        
        <label for="password">Mật khẩu:</label>
        <input type="password" name="password" required><br>
        
        <label for="confirm-password">Nhập lại mật khẩu:</label>
        <input type="password" name="confirm-password" required><br>
        
        <input type="submit" value="Đăng ký">
    </form>
    
    <p>Đã có tài khoản? <a href="login.asp">Đăng nhập</a>.</p>
</body>
</html>
