<%
' Kết nối đến cơ sở dữ liệu và truy vấn thông tin người dùng
Set conn = Server.CreateObject("ADODB.Connection")
connStr = "Provider=SQLOLEDB;Data Source=VUHOANGHIEP;Initial Catalog=WebShopping;User ID=sa;Password=Zmxncbv2002"
conn.Open connStr

Set rs = conn.Execute("SELECT * FROM products")

' Kiểm tra tham số success trong URL để hiển thị thông báo thành công
Dim success
success = Request.QueryString("success")
%>
<html>
    <head>

        </head>
<body>
<div class="row">
    <div class="col-12">
        <div class="page-title-box">
            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Admin</a></li>
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Quản Lý Sản Phẩm</a></li>
                    <li class="breadcrumb-item active">Danh Sách Sản Phẩm</li>
                </ol>
            </div>
            <h4 class="page-title">Danh Sách Sản Phẩm</h4>
        </div>
    </div>
</div> 
<% If success = "1" Then %>
        <div class="success">Thành Công</div>
    <% End If %> 

<button class="add-btn" onclick="addSanpham('')">Add Product</button>

<table class="table table-striped table-centered mb-0">
    <thead>
        <tr>
            <th>productname</th>
            <th>fisrtday</th>
            <th>price</th>
            <th>introduce</th>
            <th>discount</th>
            <th>Action</th>
            
        </tr>
    </thead>
    <% Do Until rs.EOF %>
            <tr>
                <td class="table-user"><%= rs("productname") %></td>
                <td class="table-user"><%= rs("fisrtday") %></td>
                <td class="table-user"><%= rs("price") %></td>
                <td class="table-user"><%= rs("introduce") %></td>
                <td class="table-user"><%= rs("discount") %></td>
                <td class="table-action">
                    <button class="edit-btn" onclick="editSanpham('<%= rs("id") %>')">Edit</button>
                    <button class="delete-btn" onclick="deleteSanpham('<%= rs("id") %>')">Delete</button>
                </td>
            </tr>
            <% rs.MoveNext
        Loop
        rs.Close
        Set rs = Nothing
        conn.Close
        Set conn = Nothing
        %>
</table>

</body>
</html>