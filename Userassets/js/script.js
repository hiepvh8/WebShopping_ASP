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