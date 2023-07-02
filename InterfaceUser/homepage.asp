
<%@ Language="VBScript" CodePage=65001 %>

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
    .product-name {
        font-family: "Arial", sans-serif;
        /* Thay đổi font chữ tại đây */
    }
	


</style>





<script>
function deleteProduct(productId) {
  var xhr = new XMLHttpRequest();
  xhr.open("POST", "delete_product.asp", true);
  xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  xhr.onreadystatechange = function() {
    if (xhr.readyState === 4) {
      if (xhr.status === 200) {
        // Xử lý thành công
        console.log("Xóa sản phẩm thành công");
        showMessage("Xóa sản phẩm thành công");
        // Thực hiện các hành động khác (cập nhật giao diện, v.v.)
		window.location.reload();
      } else {
        // Xử lý lỗi
        console.error("Lỗi khi xóa sản phẩm");
        showMessage("Lỗi khi xóa sản phẩm");
      }
    }
  };
  xhr.send("productId=" + productId);
}

function showMessage(message) {
  var alertBox = document.createElement("div");
  alertBox.style.position = "fixed";
  alertBox.style.top = "10px";
  alertBox.style.right = "10px";
  alertBox.style.padding = "10px";
  alertBox.style.background = "lightgray";
  alertBox.style.border = "1px solid gray";
  alertBox.style.borderRadius = "5px";
  alertBox.textContent = message;
  document.body.appendChild(alertBox);

  setTimeout(function() {
    alertBox.parentNode.removeChild(alertBox);
  }, 3000); // Thời gian hiển thị thông báo (3 giây)
}

</script>

<style>
  .notification {
    position: fixed;
    top: 10px;
    right: 10px;
    padding: 10px;
    background-color: #f8f8f8;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    color: #333;
    font-family: Arial, sans-serif;
  }

  .notification.success {
    background-color: #dff0d8;
    border-color: #d6e9c6;
    color: #3c763d;
  }

  .notification.error {
    background-color: #f2dede;
    border-color: #ebccd1;
    color: #a94442;
  }
</style>

<script>
  function addToCart(productId) {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        var message = "Sản phẩm đã được thêm vào giỏ hàng.";
        showMessageAndClose(message, "success");
        // Tiếp tục thực hiện các tác vụ khác sau khi thông báo được đóng
        // ...
		window.location.reload();
      }
    };
    xmlhttp.open("POST", "add_to_cart.asp", true);
    xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xmlhttp.send("productId=" + productId);
  }

  function showMessageAndClose(message, type) {
    var alertTimeout = 3000; // Thời gian hiển thị thông báo (3 giây)
    var notification = document.createElement("div");
    notification.classList.add("notification");

    if (type === "success") {
      notification.classList.add("success");
    } else if (type === "error") {
      notification.classList.add("error");
    }

    notification.textContent = message;
    document.body.appendChild(notification);

    setTimeout(function() {
      notification.parentNode.removeChild(notification);
    }, alertTimeout);
  }
</script>




</body>
</html>

    </head>
	<body>

		<%  
    Dim username
    If Not IsEmpty(Session("username")) Then
        username = Session("username")
       '' Response.Write("Chào mừng, " & username & "!")
    Else
        Response.Redirect("/login.asp") ' Chuyển hướng đến trang đăng nhập nếu không có thông tin người dùng trong phiên
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
											

<%
' Kết nối đến cơ sở dữ liệu và truy vấn thông tin người dùng
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

query = "SELECT * FROM cart WHERE userid = " & userID
Set rs1 = conn.Execute(query)
Dim cartid
cartid = rs1("id")
rs1.Close

Set rs = conn.Execute("SELECT * FROM productcart WHERE cartid = " & cartid)

' Kiểm tra tham số success trong URL để hiển thị thông báo thành công
Dim success
success = Request.QueryString("success")

' Tạo biến để tính tổng tiền
Dim totalAmount
totalAmount = 0
%>

<% If success = "1" Then %>
    <div class="success">Thành Công</div>
<% End If %> 

<% 
Do Until rs.EOF
    Dim productId
    productId = rs("productid")

    Dim rss
    Set rss = conn.Execute("SELECT * FROM products WHERE id = " & productId)

    ' Lấy giá sản phẩm từ bảng products
    Dim productPrice
    productPrice = rss("price")
    Dim temp1
    temp1 = CDbl(productPrice)
	
    ' Lấy số lượng từ bảng productcart
    Dim quantity
    quantity = rs("quantity")
    Dim temp2
    temp2 = CInt(quantity)
	
    ' Tính tổng tiền
    totalAmount = totalAmount + (temp1 * temp2)
%>
    <div class="product-widget">
        <div class="product-img">
            <img src="./img/product02.png" alt="">
        </div>
        <div class="product-body">
            <h3 class="product-name"><a href="#"><%= rss("productname") %></a></h3>
            <h4 class="product-price"><span class="qty"><%= rs("quantity") %></span><%= rss("productname") %></h4>
        </div>
        <button class="delete" onclick="deleteProduct(<%= productId %>)"><i class="fa fa-close"></i></button>
    </div>

<% 
    rss.Close
    rs.MoveNext
Loop

rs.Close
Set rs = Nothing
conn.Close
Set conn = Nothing
%>

<div class="cart-summary">
    <small></small>
    <h5>Tổng Tiền: <%= totalAmount %></h5>
</div>
<div class="cart-btns">
    <a href="#">View Cart</a>
	<a href="checkout.asp"> Thanh Toán<i class="fa fa-arrow-circle-right"></i></a>
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
						<li><a href="uudai.asp"> Ưu Đãi</a></li>
						<li><a href="maytinh.asp"> Máy Tính</a></li>
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




   <!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- shop -->
					<div class="col-md-4 col-xs-6">
						<div class="shop">
							<div class="shop-img">
								<img src="../Userassets/img/shop01.png" alt="">
							</div>
							<div class="shop-body">
								<h3>Laptop<br>Collection</h3>
								<a href="#" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
					</div>
					<!-- /shop -->

					<!-- shop -->
					<div class="col-md-4 col-xs-6">
						<div class="shop">
							<div class="shop-img">
								<img src="../Userassets/img/shop02.png" alt="">
							</div>
							<div class="shop-body">
								<h3>Accessories<br>Collection</h3>
								<a href="#" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
					</div>
					<!-- /shop -->

					<!-- shop -->
					<div class="col-md-4 col-xs-6">
						<div class="shop">
							<div class="shop-img">
								<img src="../Userassets/img/shop03.png" alt="">
							</div>
							<div class="shop-body">
								<h3>Cameras<br>Collection</h3>
								<a href="#" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
					</div>
					<!-- /shop -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<!-- section title -->
					<div class="col-md-12">
						<div class="section-title">
							<h3 class="title">New Products</h3>
							<div class="section-nav">
								<ul class="section-tab-nav tab-nav">
									<li class="active"><a data-toggle="tab" href="#tab1">Laptops</a></li>
									<li><a data-toggle="tab" href="#tab1">Smartphones</a></li>
									<li><a data-toggle="tab" href="#tab1">Cameras</a></li>
									<li><a data-toggle="tab" href="#tab1">Accessories</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /section title -->

                <!-- Products tab & slick -->
					<div class="col-md-12">
						<div class="row">
							<div class="products-tabs">
								<!-- tab -->
								<div id="tab1" class="tab-pane active">
									<div class="products-slick" data-nav="#slick-nav-1">
<%
' Kết nối tới cơ sở dữ liệu
Dim conn
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=SQLOLEDB;Data Source=VUHOANGHIEP;Initial Catalog=WebShopping;User ID=sa;Password=Zmxncbv2002"

' Truy vấn lấy danh sách sản phẩm
Dim rsx
Set rsx = conn.Execute("SELECT * FROM products")

' Duyệt qua từng sản phẩm và hiển thị

    
%>
<% Do Until rsx.EOF

Dim tempId
tempId =  rsx("id") 
TempRealId = CInt(tempId)
Response.Write TempRealId
%>
            

										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="../Userassets/img/canon-eos-r5-1.jpg" alt="">
											</div>
											<div class="product-body">
												<p class="product-category">Category</p>
												<h3 class="product-name"><a href="#"><%= rsx("productname") %></a></h3>
												<h4 class="product-price"><%= rsx("price") %> <del class="product-old-price"><%= rsx("price") %></del></h4>
												<div class="product-rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
												<div class="product-btns">
													<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
													<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
													<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
												</div>
											</div>
											<div class="add-to-cart">
												<button type="button" onclick="addToCart(<%= TempRealId %>)" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
											</div>
										</div>
										<!-- /product -->

									
            <%
             rsx.MoveNext
        Loop
        rsx.Close
        Set rsx = Nothing
        conn.Close
        Set conn = Nothing
        %>
                            </div>
									<div id="slick-nav-1" class="products-slick-nav"></div>
								</div>
								<!-- /tab -->
							</div>
						</div>
					</div>
					<!-- Products tab & slick -->


					
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

		<!-- HOT DEAL SECTION -->
		<div id="hot-deal" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<div class="hot-deal">
							<ul class="hot-deal-countdown">
								<li>
									<div>
										<h3>02</h3>
										<span>Days</span>
									</div>
								</li>
								<li>
									<div>
										<h3>10</h3>
										<span>Hours</span>
									</div>
								</li>
								<li>
									<div>
										<h3>34</h3>
										<span>Mins</span>
									</div>
								</li>
								<li>
									<div>
										<h3>60</h3>
										<span>Secs</span>
									</div>
								</li>
							</ul>
							<h2 class="text-uppercase">hot deal this week</h2>
							<p>New Collection Up to 50% OFF</p>
							<a class="primary-btn cta-btn" href="#">Shop now</a>
						</div>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /HOT DEAL SECTION -->
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

	