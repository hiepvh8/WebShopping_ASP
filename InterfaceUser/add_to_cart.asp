
<%
' Tạo kết nối đến cơ sở dữ liệu
Dim conn
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=SQLOLEDB;Data Source=VUHOANGHIEP;Initial Catalog=WebShopping;User ID=sa;Password=Zmxncbv2002"

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
' Kiểm tra sự tồn tại của bảng "Cart" cho người dùng
query = "SELECT COUNT(*) FROM cart WHERE userid = " & userID
Set rs = conn.Execute(query)
count = rs.Fields(0).Value
rs.Close

' Lấy thông tin về sản phẩm từ yêu cầu POST
Dim productId
productId = Request.Form("productId")

If count = 0 Then
Response.Write "Xin chào, giỏ hàng chưa tòn tại"
    ' Nếu giỏ hàng chưa tồn tại, tạo một giỏ hàng mới
    Dim insertQuery
    insertQuery = "INSERT INTO cart (userid) VALUES (" & userID & ")"
    conn.Execute insertQuery
        Dim cartidd
        Set rsCartId = conn.Execute("SELECT @@IDENTITY AS NewID")
        If Not rsCartId.EOF Then
            cartid = rsCartId("NewID")
        End If
        rsCartId.Close

     ' Nếu không có bản ghi tương ứng, tạo một bản ghi mới với quantity = 1
    insertQueryCreateQuantity = "INSERT INTO productcart (cartid,productid,quantity) VALUES (" & cartidd & ", " & productId & ", 1)"
    conn.Execute insertQueryCreateQuantity
Else

' Thực hiện truy vấn
Dim rss
Set rss = conn.Execute("SELECT id FROM cart WHERE userid = " & userID)

Dim cartid
' Kiểm tra kết quả truy vấn và lấy ra ID của cart
If Not rss.EOF Then
    cartid = rss("id")
End If
    ' Kiểm tra sự tồn tại của bản ghi trong bảng "ProductCart"
Set rsss = conn.Execute("SELECT * FROM productcart WHERE productid = " & productId & " AND cartid = " & cartid)

If Not rsss.EOF  Then
' Nếu đã có bản ghi tương ứng, tăng biến quantity lên 1
    updateQuery = "UPDATE productcart SET quantity = quantity + 1 WHERE productid = " & productId & " AND cartid = " & cartid
    conn.Execute updateQuery
    
Else
    ' Nếu không có bản ghi tương ứng, tạo một bản ghi mới với quantity = 1
    insertQueryCreateQuantity = "INSERT INTO productcart (cartid,productid,quantity) VALUES (" & cartid & ", " & productId & ", 1)"
    conn.Execute insertQueryCreateQuantity

End If

rsss.Close
End If
' Đóng kết nối đến cơ sở dữ liệu
conn.Close
Set conn = Nothing
%>
