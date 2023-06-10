<%
' Kết nối đến cơ sở dữ liệu và truy vấn thông tin Ticket
Set conn = Server.CreateObject("ADODB.Connection")
connStr = "Provider=SQLOLEDB;Data Source=VUHOANGHIEP;Initial Catalog=WebShopping;User ID=sa;Password=Zmxncbv2002"
conn.Open connStr

' Lấy giá trị id từ URL
Dim id
id = Request.QueryString("id")

' Kiểm tra nếu không có id, chuyển hướng về trang listTicket.asp
If id = "" Then
Response.Redirect "admin.asp"
End If

' Kiểm tra xem người dùng có tồn tại trong cơ sở dữ liệu hay không
Set rs = conn.Execute("SELECT * FROM products WHERE id = " & id)

' Kiểm tra nếu không tìm thấy người dùng, chuyển hướng về trang listTicket.asp
If rs.EOF Then
Response.Redirect "admin.asp"
End If

' Xóa người dùng từ cơ sở dữ liệu
conn.Execute "DELETE FROM products WHERE id = " & id

rs.Close
conn.Close
Set rs = Nothing
Set conn = Nothing

' Chuyển hướng về trang listTicket.asp và gửi tham số success để hiển thị thông báo xóa thành công
Response.Redirect "admin.asp?success=1"
%>






