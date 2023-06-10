
<%
' Kết nối đến cơ sở dữ liệu và truy vấn thông tin người dùng
Set conn = Server.CreateObject("ADODB.Connection")
connStr = "Provider=SQLOLEDB;Data Source=VUHOANGHIEP;Initial Catalog=WebShopping;User ID=sa;Password=Zmxncbv2002"
conn.Open connStr

   If Not IsEmpty(Session("username")) Then
        username = Session("username")
    End If

	Dim strSQL
	strSQL = "SELECT id FROM users WHERE username = '" & username & "';"

	Dim rs
	Set rs = conn.Execute(strSQL)

	' Kiểm tra và lấy giá trị id và password
	Dim userID
	If Not rs.EOF Then
	    userID = rs("id")
	    
	End If

'' Mã asp hien thi userdetail 
    Set rs = conn.Execute("SELECT * FROM userdetails WHERE userid = "& userID)

' Kiểm tra tham số success trong URL để hiển thị thông báo thành công
Dim accumulationRank
	If Not rs.EOF Then
	    accumulationRank = rs("accumulation")
	    
	End If
    Dim temp

    If accumulationRank >= 0 And accumulationRank < 1000 Then
    temp = "Đồng"
    ElseIf accumulationRank >= 1000 And accumulationRank < 3000 Then
    temp = "Bạc"
    ElseIf accumulationRank >= 3000 And accumulationRank < 10000 Then
    temp = "Vàng"
    Else
    temp = "Kim Cương"
    End If
%>
<!DOCTYPE html>
<html lang="en">
<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>Electro - HTML Ecommerce Template</title>

 		<!-- Google font -->
 		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

 		<!-- Bootstrap -->
 		<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

 		<!-- Slick -->
 		<link type="text/css" rel="stylesheet" href="css/slick.css"/>
 		<link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

 		<!-- nouislider -->
 		<link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

 		<!-- Font Awesome Icon -->
 		<link rel="stylesheet" href="css/font-awesome.min.css">

 		<!-- Custom stlylesheet -->
 		<link type="text/css" rel="stylesheet" href="css/style.css"/>

		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

</head>
	
<body>
	<form method="post" action="">
		<!-- HEADER -->	
		<!-- BREADCRUMB -->
		<div id="breadcrumb" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<h3 class="breadcrumb-header">Cập nhật thông tin người dùng</h3>
						
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /BREADCRUMB -->

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<div class="col-md-7">
						<!-- Billing Details -->
                        <!-- ======================= -->
                        
						<!-- ======================= -->
                        
						<div class="billing-details">
							<div class="form-group">
								<input class="input" type="text" id="firstname" name="firstname" placeholder="First Name" required>
							</div>
							<div class="form-group">
								<input class="input" type="text" id="lastname" name="lastname" placeholder="Last Name" required>
							</div>
							<div class="form-group">
								<input class="input" type="text" id="address" name="address" placeholder="Address" required>
							</div>
							<div class="form-group">
								<input class="input" type="email" id="email" name="email" placeholder="Email" required>
							</div>
							<div class="form-group">
								<input class="input" type="text" id="phone" name="phone" placeholder="Phone" required>
							</div>
							
							<div class="form-group">
								<div class="input-checkbox">
									<input type="checkbox" id="create-account">
									<label for="create-account">
										<span></span>
										Cập nhật thông tin?
									</label>
									<div class="caption">
										<p>Vui lòng nhập mật khẩu để thực hiện update.</p>
										<input class="input" type="password" id="password" name="password" placeholder="Enter Your Password" required>
									</div>
								</div>
							</div>
							<!-- ================================ -->
							<!-- <a href="#" class="primary-btn order-submit">Cập Nhật</a> -->
							
						</div>
						
						<!-- /Billing Details -->

					</div>

					<!-- Order Details -->
					<div class="col-md-5 order-details">
						<div class="section-title text-center">
							<h3 class="title">Thông Tin Người Dùng</h3>
						</div>
						
						<div class="order-summary">
							<!-- <div class="order-col">
								<div><strong>PRODUCT</strong></div>
								<div><strong>TOTAL</strong></div>
							</div> -->
							<div class="order-products">
								<div class="order-col">
									<div>Firstname:</div>
									<div><%= rs("firstname") %></div>
								</div>
								<div class="order-col">
									<div>Lastname:</div>
									<div><%= rs("lastname") %></div>
								</div>
								<div class="order-col">
									<div>Address:</div>
									<div><%= rs("address") %></div>
								</div>
								<div class="order-col">
									<div>Email:</div>
									<div><%= rs("email") %></div>
								</div>
								<div class="order-col">
									<div>Phone:</div>
									<div><%= rs("phone") %></div>
								</div>
								<div class="order-col">
									<div>Accumulation:</div>
									<div><%= rs("accumulation") %></div>
								</div>
							</div>
							<div class="order-col">
								<div>Rank:</div>
								<div><strong>
                                    <%
									
                                        Response.Write "" & temp
                                    %>
								</strong></div>
							</div>
						</div>
		                
						<!-- =============== -->
						<a href="/login.asp" class="primary-btn order-submit"></i> Đăng Xuất</a>
						
					</div>
					
					<!-- /Order Details -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
        <!-- jQuery Plugins -->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/slick.min.js"></script>
		<script src="js/nouislider.min.js"></script>
		<script src="js/jquery.zoom.min.js"></script>
		<script src="js/main.js"></script>

		<input class="primary-btn order-submit" type="submit" value="Cập Nhật">

    </form>

	
	<!-- Rest of your HTML content -->
</body>
</html>	


<!-- ======================== -->
