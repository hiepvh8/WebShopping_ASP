<%
' Kết nối đến cơ sở dữ liệu và truy vấn xóa sản phẩm
Set conn = Server.CreateObject("ADODB.Connection")
connStr = "Provider=SQLOLEDB;Data Source=VUHOANGHIEP;Initial Catalog=WebShopping;User ID=sa;Password=Zmxncbv2002"
conn.Open connStr

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

' Thực hiện truy vấn
Dim rss
Set rss = conn.Execute("SELECT id FROM cart WHERE userid = " & userID)

Dim cartid
' Kiểm tra kết quả truy vấn và lấy ra ID của cart
If Not rss.EOF Then
    cartid = rss("id")
End If
' Nhận giá trị productId từ yêu cầu POST
productId = Request.Form("productId")

' Xử lý xóa sản phẩm ở đây (ví dụ: xóa sản phẩm trong cơ sở dữ liệu)
' Kiểm tra số lượng sản phẩm trong giỏ hàng (trong bảng productcart) có lớn hơn 1 hay không
query = "SELECT quantity FROM productcart WHERE productid = " & productId & " AND cartid = " & cartid
Set rs = conn.Execute(query)
Dim temp
If Not rs.EOF Then
    If Not IsNull(rs("quantity")) Then
        quantity = rs("quantity")
        temp = CInt(quantity)
        
        If temp = 1 Then
            ' Nếu quantity = 1, xóa bản ghi trong bảng productcart
            conn.Execute("DELETE FROM productcart WHERE productid = " & productId & " AND cartid = " & cartid)
        Else
            ' Nếu quantity > 1, giảm quantity đi 1
            conn.Execute("UPDATE productcart SET quantity = quantity - 1 WHERE productid = " & productId & " AND cartid = " & cartid)
        End If
    Else
    Response.Write(quantity)
        ' Thực hiện xử lý khi giá trị quantity là NULL
        ' ...
    End If
End If



' Kiểm tra thành công và trả về status 200
Response.Status = "200 OK"
Response.Write "Xóa sản phẩm thành công"

' Đóng kết nối đến cơ sở dữ liệu
conn.Close
Set conn = Nothing
%>
