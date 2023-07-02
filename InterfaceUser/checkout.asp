<%
	' Kết nối đến cơ sở dữ liệu và truy vấn thông tin người dùng
	Dim conn
	Set conn = Server.CreateObject("ADODB.Connection")
	connStr = "Provider=SQLOLEDB;Data Source=VUHOANGHIEP;Initial Catalog=WebShopping;User ID=sa;Password=Zmxncbv2002"
	conn.Open connStr

	' Lấy giá trị của biến "username" từ session
	
   If Not IsEmpty(Session("username")) Then
        username = Session("username")
	Else
	Response.Redirect("/login.asp") ' Chuyển hướng đến trang đăng nhập nếu không có thông tin người dùng trong phiên
    End If

	Dim SQL
	SQL = "SELECT id, password FROM users WHERE username = '" & username & "';"

	Dim ts
	Set ts = conn.Execute(SQL)

	' Kiểm tra và lấy giá trị id và password
	Dim userID, userPassword
	If Not ts.EOF Then
	    userID = ts("id")
	    userPassword = ts("password")
	End If
    
	' Lấy ngày và giờ hiện tại
    currentDateTime = Now()

query = "SELECT * FROM cart WHERE userid = " & userID
Set rs1 = conn.Execute(query)
Dim cartid
cartid = rs1("id")
Dim PriceShip
PriceShip = rs1("priceship")

Dim temp12
    temp12 = CDbl(PriceShip)

Set rsProductCart = conn.Execute("SELECT * FROM productcart WHERE cartid = " & cartid)

' Kiểm tra tham số success trong URL để hiển thị thông báo thành công
Dim success
success = Request.QueryString("success")

' Tính tổng tiền đơn hàng
	Dim total_Sum
    total_Sum = 0

Do Until rsProductCart.EOF
Dim productId
    productId = rsProductCart("productid")

    Dim rss
    Set rss = conn.Execute("SELECT * FROM products WHERE id = " & productId)
    
    ' Lấy giá sản phẩm từ bảng products
    Dim productPrice
    productPrice = rss("price")
    Dim temp1
    temp1 = CDbl(productPrice)
	
    ' Lấy số lượng từ bảng productcart
    Dim quantity
    quantity = rsProductCart("quantity")
    Dim temp2
    temp2 = CInt(quantity)
	
    ' Tính tổng tiền
    total_Sum = total_Sum + (temp1 * temp2)
    rsProductCart.MoveNext
Loop

Dim Sum 
Sum = total_Sum+temp12
	' Kiểm tra nếu có yêu cầu POST từ form
	If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
    Dim paymentMethod , hoten, email, address, city, country, zipcode, phone, ordernote
	 ' Lấy thông tin từ form
	
	hoten = Request.Form("hoten")
	email = Request.Form("email")
	address = Request.Form("address")
	city = Request.Form("city")
	country = Request.Form("country")
	zipcode = Request.Form("zipcode")
	phone = Request.Form("phone")
	ordernote = Request.Form("ordernote")
    paymentMethod = Request.Form("paymentMethod")

	    ' Kiểm tra xem có nhập đủ thông tin hay không
	    If hoten <> "" And  email <> "" And  address <> "" And  city <> "" And  country <> "" And  zipcode <> "" And phone <> ""  And paymentMethod <> ""   Then
            
			'Lay thông tin từ bảng productcarrt là danh sách các sản phẩm có trong bill'
            
			' Lấy ngày và giờ hiện tại
            Dim currentDate
            currentDate = Date()

            ' Lấy giờ hiện tại
            Dim currentTime
            currentTime = Time()

            ' Chuyển định dạng ngày và giờ thành chuỗi phù hợp với cú pháp SQL
            Dim formattedDateTime
            formattedDateTime = FormatDateTime(currentDate, vbShortDate) & " " & FormatDateTime(currentTime, vbShortTime)
            
			' Chuyển đổi giá trị trạng thái thành kiểu bit
            Dim statusBit
            If paymentMethod = "tienmat" Then
                statusBit = 0
            Else
                 statusBit = 1
            End If
	         '' Thêm thông tin vào bảng 'bill'
                sqlBill = "INSERT INTO bill (userid, datetime, total, status, cartid, totalship,shipbillprice) VALUES (" & userID & ",'" & formattedDateTime & "', " & total_Sum & ", " & statusBit & ", " & cartid & " , " & Sum & ", " & temp12 & ")"
                conn.Execute(sqlBill)
				
	            ' Ctruy vấn xóa bản ghi trong giỏ hàng
				Dim deleteProductCartQuery
                deleteProductCartQuery = "DELETE FROM productcart"
                conn.Execute deleteProductCartQuery
	           
				'Dim sqlUpdate
              ''  sqlUpdate = "UPDATE userdetails SET firstname = N'" & firstname & "', lastname = N'" & lastname & "', address = N'" & address & "', email = '" & email & "', phone = '" & phone & "' WHERE userid = " & userID

	            ' Thực thi câu truy vấn UPDATE
	           '' conn.Execute sqlUpdate

	            ' Chuyển hướng trở lại trang danh sách products với thông báo thành công
	            Response.Redirect "homepage.asp?success=1"
	        
	    Else
	        ' Hiển thị thông báo lỗi nếu thông tin không hợp lệ
	        Response.Write "<div class=""error"">Vui lòng điền đầy đủ thông tin.</div>"
	    End If
	End If

	
''=================================



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
        <style>
			#paymentMethod {
  width: 100%;
  padding: 10px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 4px;
  background-color: #f8f8f8;
}

/* Tùy chỉnh giao diện dropdown */
select option {
  padding: 10px;
  font-size: 16px;
}

			</style>
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
							
							<a href="myaccount.asp"> Myaccount</a>
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
						<li class="active"><a href="homepage.asp"> Trang Chủ</a></li>
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
						<div class="billing-details">
							<div class="section-title">
								<h3 class="title">Nhập Thông Tin Cá Nhân</h3>
							</div>
							<div class="form-group">
								<input class="input" type="text" name="hoten" placeholder="Họ Tên">
							</div>
							<div class="form-group">
								<input class="input" type="email" name="email" placeholder="Email">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="address" placeholder="Address">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="city" placeholder="City">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="country" placeholder="Country">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="zipcode" placeholder="Zip-Code">
							</div>
							<div class="form-group">
								<input class="input" type="phone" name="phone" placeholder="Phone">
							</div>
							
						</div>
						<!-- /Billing Details -->
                        <!-- Order notes -->
						<div class="order-notes">
							<textarea class="input"  name="ordernote" placeholder="Order Notes"></textarea>
						</div>
						<!-- /Order notes -->
					</div>

					
                    <!-- Order Details -->
					<div class="col-md-5 order-details">
						<div class="section-title text-center">
							<h3 class="title">Đơn Hàng</h3>
						</div>
						<div class="order-summary">
							<div class="order-col">
								<div><strong>PRODUCT</strong></div>
								<div><strong>TOTAL</strong></div>
							</div>
							<%
' Kết nối đến cơ sở dữ liệu và truy vấn thông tin người dùng


Set rsr = conn.Execute("SELECT * FROM products")

' Kiểm tra tham số success trong URL để hiển thị thông báo thành công
Dim successe
successe = Request.QueryString("successe")
%>



<% If successe = "1" Then %>
        <div class="successe">Thành Công</div>
    <% End If %> 

    <% Do Until rsr.EOF %>
                            <div class="order-col">
								<div>Tên Sản Phẩm :</div>
								<div><strong><%= rsr("productname") %></strong></div>
							</div>
							<div class="order-col">
								<div>Giá Sản Phẩm :</div>
								<div><strong><%= rsr("price") %></></strong></div>
							</div>
                   
            <%
             rsr.MoveNext
        Loop
        rsr.Close
        Set rsr = Nothing
        %>

							<div class="order-col">
								<div>Shiping</div>
								<div><strong>FREE</strong></div>
							</div>
							<div class="order-col">
								<div><strong>Tiền đơn hàng: </strong></div>
								<div><strong class="order-total">  <%=total_Sum %></strong></div>
							</div>
                            <div class="order-col">
								<div><strong>Tiền Ship: </strong></div>
								<div><strong class="order-total">  <%=rs1("priceship") %></strong></div>
							</div>
							<div class="order-col">
								<div><strong>Tổng Tiền Thanh Toán: </strong></div>
								<div><strong class="order-total">  <%=Sum %></strong></div>
							</div>
						</div>
						<div class="payment-method">
							<div class="form-group">
								<label for="paymentMethod">Phương thức thanh toán:</label>
                            <select id="paymentMethod" name="paymentMethod">
                                 <option value="tienmat">Tiền mặt</option>
                                <option value="thetindung">Thẻ tín dụng</option>
                                <option value="chuyenkhoannganhang">Chuyển khoản ngân hàng</option>
                            </select>
							</div>
						</div>
						
						<input class="primary-btn order-submit" type="submit" value="Thanh Toán">
					</div>
					<!-- /Order Details -->
					<!-- ======================= -->
                     


				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>

		

    </form>

  
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

	






























