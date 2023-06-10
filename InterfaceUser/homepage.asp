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
		<link type="text/css" rel="stylesheet" href="../Userassets/css/bootstrap.min.css"/>

		<!-- Slick -->
		<link type="text/css" rel="stylesheet" href="../Userassets/css/slick.css"/>
		<link type="text/css" rel="stylesheet" href="../Userassets/css/slick-theme.css"/>

		<!-- nouislider -->
		<link type="text/css" rel="stylesheet" href="../Userassets/css/nouislider.min.css"/>

		<!-- Font Awesome Icon -->
		<link rel="stylesheet" href="../Userassets/css/font-awesome.min.css">

		<!-- Custom stlylesheet -->
		<link type="text/css" rel="stylesheet" href="../Userassets/css/style.css"/>
       
    </head>
	<body>

		<%  
    Dim username
    If Not IsEmpty(Session("username")) Then
        username = Session("username")
       '' Response.Write("Chào mừng, " & username & "!")
    Else
        Response.Redirect("login.asp") ' Chuyển hướng đến trang đăng nhập nếu không có thông tin người dùng trong phiên
    End If
    %>
	
		<!-- HEADER -->
		<header>
			<!-- TOP HEADER -->
			<div id="top-header">
				<div class="container">
					<ul class="header-links pull-left">
						<li><a href="#"><i class="fa fa-phone"></i> +84912 905 950</a></li>
						<li><a href="#"><i class="fa fa-envelope-o"></i> hiepvh8@gmail.com</a></li>
						<li><a href="#"><i class="fa fa-map-marker"></i> 55 Giải Phóng</a></li>
					</ul>
					<ul class="header-links pull-right">
						<!-- <li><a href="#"><i class="fa fa-dollar"></i> USD</a></li> -->
						<li>
							<a href="javascript:void(0);" onclick="loadPage('myaccount.asp')">My Account</a>
							<!-- <a href="myaccount.asp"> Myaccount</a> -->
						</li>
					</ul>
				</div>
			</div>
			<!-- /TOP HEADER -->

			<!-- MAIN HEADER -->
			<div id="header">
				<!-- container -->
				<div class="container">
					<!-- row -->
					<div class="row">
						<!-- LOGO -->
						<div class="col-md-3">
							<div class="header-logo">
								<a href="#" class="logo">
									<img src="./img/logo.png" alt="">
								</a>
							</div>
						</div>
						<!-- /LOGO -->

						<!-- SEARCH BAR -->
						<div class="col-md-6">
							<div class="header-search">
								<form>
									<select class="input-select">
										<option value="0">Thể Loại</option>
										<option value="1">Category 01</option>
										<option value="1">Category 02</option>
									</select>
									<input class="input" placeholder="Search here">
									<button class="search-btn">Tìm Kiếm</button>
								</form>
							</div>
						</div>
						<!-- /SEARCH BAR -->

						<!-- ACCOUNT -->
						<div class="col-md-3 clearfix">
							<div class="header-ctn">
								<!-- Wishlist -->
								<div>
									<a href="#">
										<i class="fa fa-heart-o"></i>
										<span>Your Wishlist</span>
										<div class="qty">2</div>
									</a>
								</div>
								<!-- /Wishlist -->

								<!-- Cart -->
								<div class="dropdown">
									<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
										<i class="fa fa-shopping-cart"></i>
										<span>Your Cart</span>
										<div class="qty">3</div>
									</a>
									<div class="cart-dropdown">
										<div class="cart-list">
											<div class="product-widget">
												<div class="product-img">
													<img src="./img/product01.png" alt="">
												</div>
												<div class="product-body">
													<h3 class="product-name"><a href="#">product name goes here</a></h3>
													<h4 class="product-price"><span class="qty">1x</span>$980.00</h4>
												</div>
												<button class="delete"><i class="fa fa-close"></i></button>
											</div>

											<div class="product-widget">
												<div class="product-img">
													<img src="./img/product02.png" alt="">
												</div>
												<div class="product-body">
													<h3 class="product-name"><a href="#">product name goes here</a></h3>
													<h4 class="product-price"><span class="qty">3x</span>$980.00</h4>
												</div>
												<button class="delete"><i class="fa fa-close"></i></button>
											</div>
										</div>
										<div class="cart-summary">
											<small>3 Item(s) selected</small>
											<h5>SUBTOTAL: $2940.00</h5>
										</div>
										<div class="cart-btns">
											<a href="#">View Cart</a>
											<a href="#">Checkout  <i class="fa fa-arrow-circle-right"></i></a>
										</div>
									</div>
								</div>
								<!-- /Cart -->

								<!-- Menu Toogle -->
								<div class="menu-toggle">
									<a href="#">
										<i class="fa fa-bars"></i>
										<span>Menu</span>
									</a>
								</div>
								<!-- /Menu Toogle -->
							</div>
						</div>
						<!-- /ACCOUNT -->
					</div>
					<!-- row -->
				</div>
				<!-- container -->
			</div>
			<!-- /MAIN HEADER -->
		</header>
		<!-- /HEADER -->

		<!-- NAVIGATION -->
		<nav id="navigation">
			<!-- container -->
			<div class="container">
				<!-- responsive-nav -->
				<div id="responsive-nav">
					<!-- NAV -->
					<ul class="main-nav nav navbar-nav">
						<li class="active"><a href="#">Trang chủ</a></li>
						<li><a href="#">Ưu đãi</a></li>
						<li><a href="#">Máy Tính</a></li>
						<li><a href="#">Điện Thoại</a></li>
						<li><a href="#">Máy Ảnh</a></li>
						<li><a href="#">Phụ Kiện</a></li>
					</ul>
					<!-- /NAV -->
				</div>
				<!-- /responsive-nav -->
			</div>
			<!-- /container -->
		</nav>
		<!-- /NAVIGATION -->

		<!-- SECTION -->
		
		<!-- /SECTION -->

		<!-- SECTION -->
		
		<!-- /SECTION -->
<div id ="body-mid">

	</div>
		<!-- HOT DEAL SECTION -->
		
		<!-- /SECTION -->

		<!-- SECTION -->
		
		<!-- /SECTION -->

		<!-- NEWSLETTER -->
		<div id="newsletter" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<div class="newsletter">
							<p>Theo dõi để : <strong>Nhận thông báo ưu đãi! </strong></p>
							<form>
								<input class="input" type="email" placeholder="Nhập email">
								<button class="newsletter-btn"><i class="fa fa-envelope"></i> Đăng Ký</button>
							</form>
							<ul class="newsletter-follow">
								<li>
									<a href="#"><i class="fa fa-facebook"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-twitter"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-instagram"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-pinterest"></i></a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /NEWSLETTER -->

		<!-- FOOTER -->
		<footer id="footer">
			<!-- top footer -->
			<div class="section">
				<!-- container -->
				<div class="container">
					<!-- row -->
					<div class="row">
						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">About Us</h3>
								
								<ul class="footer-links">
									<li><a href="#"><i class="fa fa-map-marker"></i>55 Giải Phóng</a></li>
									<li><a href="#"><i class="fa fa-phone"></i>+84912 905 950</a></li>
									<li><a href="#"><i class="fa fa-envelope-o"></i>hiepvh8@gmail.com</a></li>
								</ul>
							</div>
						</div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Categories</h3>
								<ul class="footer-links">
									<li><a href="#">Ưu Đãi</a></li>
									<li><a href="#">Máy Tính</a></li>
									<li><a href="#">Điện Thoại</a></li>
									<li><a href="#">Máy Ảnh</a></li>
									<li><a href="#">Phụ Kiện</a></li>
								</ul>
							</div>
						</div>

						<div class="clearfix visible-xs"></div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Thông Tin</h3>
								<ul class="footer-links">
									<li><a href="#">Người Dùng</a></li>
									<li><a href="#">Hà Nội</a></li>
									<li><a href="#">Đơn Trả</a></li>
								</ul>
							</div>
						</div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Dịch vụ</h3>
								<ul class="footer-links">
									<li><a href="javascript:void(0);" onclick="loadPage('myaccount.asp')">My Account</a></li>
									<li><a href="#">Xem Giỏ Hàng</a></li>
									<li><a href="#">Hỗ Trợ</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /row -->
				</div>
				<!-- /container -->
			</div>
			<!-- /top footer -->

			<!-- bottom footer -->
			<div id="bottom-footer" class="section">
				<div class="container">
					<!-- row -->
					<div class="row">
						<div class="col-md-12 text-center">
							<ul class="footer-payments">
								<li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
								<li><a href="#"><i class="fa fa-credit-card"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
							</ul>
							<span class="copyright">
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</span>
						</div>
					</div>
						<!-- /row -->
				</div>
				<!-- /container -->
			</div>
			<!-- /bottom footer -->
		</footer>
		<!-- /FOOTER -->

		<!-- jQuery Plugins -->
		<script src="../Userassets/js/jquery.min.js"></script>
		<script src="../Userassets/js/bootstrap.min.js"></script>
		<script src="../Userassets/js/slick.min.js"></script>
		<script src="../Userassets/js/nouislider.min.js"></script>
		<script src="../Userassets/js/jquery.zoom.min.js"></script>
		<script src="../Userassets/js/main.js"></script>
		<script src="../Userassets/js/script.js"></script>

	</body>
</html>
<!-- ============================================================ -->
<!-- Mã asp update userdetail -->
<%
	' Kết nối đến cơ sở dữ liệu và truy vấn thông tin người dùng
	Dim conn
	Set conn = Server.CreateObject("ADODB.Connection")
	connStr = "Provider=SQLOLEDB;Data Source=VUHOANGHIEP;Initial Catalog=WebShopping;User ID=sa;Password=Zmxncbv2002"
	conn.Open connStr

	' Lấy giá trị của biến "username" từ session
	
	Dim strSQL
	strSQL = "SELECT id, password FROM users WHERE username = '" & username & "';"

	Dim rs
	Set rs = conn.Execute(strSQL)

	' Kiểm tra và lấy giá trị id và password
	Dim userID, userPassword
	If Not rs.EOF Then
	    userID = rs("id")
	    userPassword = rs("password")
	End If

	' Kiểm tra nếu có yêu cầu POST từ form
	If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
	    ' Lấy thông tin từ form
	    Dim firstname, lastname, address, email, phone, password

	    firstname = Request.Form("firstname")
	    lastname = Request.Form("lastname")
	    address = Request.Form("address")
	    email = Request.Form("email")
	    phone = Request.Form("phone")
	    password = Request.Form("password")
	    ' Kiểm tra xem có nhập đủ thông tin hay không
	    If firstname <> "" And lastname <> "" And address <> "" And email <> "" And phone <> "" And password <> "" Then
	        If password = userPassword Then
	            ' Câu truy vấn UPDATE dữ liệu vào bảng userdetails
	           
				Dim sqlUpdate
                sqlUpdate = "UPDATE userdetails SET firstname = N'" & firstname & "', lastname = N'" & lastname & "', address = N'" & address & "', email = '" & email & "', phone = '" & phone & "' WHERE userid = " & userID

	            ' Thực thi câu truy vấn UPDATE
	            conn.Execute sqlUpdate

	            ' Chuyển hướng trở lại trang danh sách products với thông báo thành công
	            Response.Redirect "homepage.asp?success=1"
	        Else
	            Response.Write "<div class=""error"">Bạn đã nhập Sai mật khẩu!.</div>"
	        End If
	    Else
	        ' Hiển thị thông báo lỗi nếu thông tin không hợp lệ
	        Response.Write "<div class=""error"">Vui lòng điền đầy đủ thông tin.</div>"
	    End If
	End If

	
	' Đóng kết nối đến cơ sở dữ liệu
	conn.Close
	Set conn = Nothing
	%>
	