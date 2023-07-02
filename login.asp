
<%
 
' Tạo đối tượng kết nối
Dim conn
Set conn = Server.CreateObject("ADODB.Connection")

' Thiết lập thông tin kết nối
Dim connStr
connStr = "Provider=SQLOLEDB;Data Source=VUHOANGHIEP;Initial Catalog=WebShopping;User ID=sa;Password=Zmxncbv2002"

' Mở kết nối
conn.Open connStr

If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
    Dim username, password
    username = Trim(Request.Form("username"))
    password = Trim(Request.Form("password"))
    
    ' Kiểm tra xem người dùng đã nhập tên đăng nhập và mật khẩu hay chưa
    If username = "" Or password = "" Then
        ' Xử lý ngoại lệ khi người dùng nhập thiếu thông tin
        Response.Write "<p style=""color: red;"">Vui lòng nhập đầy đủ tên đăng nhập và mật khẩu.</p>"
    Else
        ' Tạo câu truy vấn SQL để kiểm tra thông tin đăng nhập
        sql = "SELECT * FROM users WHERE username='" & Replace(username, "'", "''") & "' AND password='" & Replace(password, "'", "''") & "'"
        Set rs = conn.Execute(sql)
        
        If Not rs.EOF Then
            ' Đăng nhập thành công
            Session("username") = username
            Session("roles")  =roles
            Dim rolesRS
            rolesRS = rs("roles") 
            If rolesRS = 1 Then
            Response.Redirect("InterfaceUser/homepage.asp") 
            End If
            If rolesRS = 2 Then 
            Response.Redirect("InterfaceAdmin/admin.asp") 
            End If
            If rolesRS = 3 Then 
            Response.Redirect("InterfaceAdmin1/admin1.asp") 
            ' "homepage.asp" ' Chuyển hướng đến trang homepage.asp -->
            End If
        Else
            ' Xử lý ngoại lệ khi tên đăng nhập hoặc mật khẩu không chính xác
            Response.Write "<p style=""color: red;"">Tên đăng nhập hoặc mật khẩu không chính xác.</p>"
        End If
        
        rs.Close
        Set rs = Nothing
    End If
End If

%>


<!DOCTYPE html>
<html>
<head>
  <title>Form Đăng nhập</title>
  <meta charset="UTF-8">
  <!-- Thêm liên kết CSS của Bootstrap -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    body {
      background-color: #f8f9fa;
    }

    .container {
      max-width: 400px;
      margin: 0 auto;
      padding-top: 100px;
    }

    .card {
      border: none;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .card-header {
      background-color: #007bff;
      color: #fff;
      text-align: center;
      padding: 20px;
      border-radius: 5px 5px 0 0;
    }

    .card-body {
      padding: 20px;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      font-weight: bold;
    }

    .form-group input {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .btn-login {
      width: 100%;
      padding: 10px;
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    .btn-login:hover {
      background-color: #0069d9;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="card">
      <div class="card-header">
        <h3>Đăng nhập</h3>
      </div>
      <div class="card-body">
        <form method="post" action="">
          <div class="form-group">
            <label for="username">Tên đăng nhập:</label>
            <input type="text" id="username" name="username" required>
          </div>
          <div class="form-group">
            <label for="password">Mật khẩu:</label>
            <input type="password" id="password" name="password" required>
          </div>
          <button type="submit" class="btn-login">Đăng nhập</button>
        </form>
        <p>Chưa có tài khoản? <a href="register.asp">Đăng ký ngay</a>.</p>
      </div>
    </div>
  </div>

  <!-- Thêm liên kết với các tệp JavaScript của Bootstrap -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>