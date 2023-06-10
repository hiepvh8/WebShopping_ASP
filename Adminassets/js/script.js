
function loadPage(page) {
    var rightBody = document.getElementById('right-body');
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

// quanlysanpham
function addSanpham(id) {
    window.location.href = "InterfaceAdmin/addsanpham.asp?id=" + id;
}
function editSanpham(id) {
    window.location.href = "InterfaceAdmin/editsanpham.asp?id=" + id;
}

function deleteSanpham(id) {
    window.location.href = "InterfaceAdmin/deletesanpham.asp?id=" + id;
}
