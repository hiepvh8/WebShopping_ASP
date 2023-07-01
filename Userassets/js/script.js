function loadPage(page) {
    var rightBody = document.getElementById('body-mid');
    rightBody.innerHTML = 'Loading...';

    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            rightBody.innerHTML = xmlhttp.responseText;
        }
    };
    xmlhttp.open('GET', page, true);
    xmlhttp.send();
}

document.addEventListener('DOMContentLoaded', function() {
    // Lấy ngày hiện tại
    var currentDate = new Date();
    var formattedDate = currentDate.toDateString();
    document.getElementById('currentDate').innerText = 'Ngày hiện tại: ' + formattedDate;

    // Xử lý sự kiện submit form
    document.getElementById('paymentForm').addEventListener('submit', function(event) {
        event.preventDefault();

        // Lấy giá trị các trường
        var paymentMethod = document.getElementById('paymentMethod').value;
        var orderTotal = parseFloat(document.getElementById('orderTotal').value);
        var shippingFee = parseFloat(document.getElementById('shippingFee').value);

        // Tính tổng tiền đơn hàng
        var totalAmount = orderTotal + shippingFee;

        // Gửi dữ liệu lên server (CSDL)
        // Thực hiện các bước lưu dữ liệu vào CSDL ở đây

        // Hiển thị thông báo thanh toán thành công
        alert('Thanh toán thành công!\nTổng tiền: ' + totalAmount.toFixed(2) + ' VND');
    });
});
