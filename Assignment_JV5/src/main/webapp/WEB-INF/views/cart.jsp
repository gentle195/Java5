<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
            integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
            crossorigin="anonymous"></script>
    <title>Title</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="">PH25621</a>
        <div class=" navbar-collapse">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link" aria-current="page" href="/home/hien-thi">Trang Chủ</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="/home/hien-thi">Sản Phẩm</a></li>
            </ul>
        </div>
    </div>
</nav>
<br>
<br>
<br>
<h4 style="text-align: center;">Thông tin giỏ hàng</h4>
<br>
<form method="post" action="/home/thanh-toan">
    <table class="table table-info table-striped" style="text-align: center">
        <tr>
            <th>Tên Sản Phẩm</th>
            <th>Màu Sắc</th>
            <th>Dòng Sản Phẩm</th>
            <th>Nhà Sản Xuất</th>
            <th>Số Lượng</th>
            <th>Đơn Giá</th>
            <th></th>
        </tr>
        <c:forEach items="${list}" var="gioHangChiTiet">
            <tr>
                <td>${gioHangChiTiet.ten}</td>
                <td>${gioHangChiTiet.mau}</td>
                <td>${gioHangChiTiet.dong}</td>
                <td>${gioHangChiTiet.nsx}</td>
                <td>${gioHangChiTiet.soLuong}</td>
                <td>${gioHangChiTiet.giaBan}</td>
                <td>
                    <a href="/home/delete/${gioHangChiTiet.id}" onclick="return checkDelete()">Xóa sản phẩm</a>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="7">
                <button type="submit">Thanh Toán</button>
            </td>
        </tr>
    </table>
</form>

</body>
<footer>
    <div class="py-1 bg-dark container-fluid">
        <p class="m-0 text-center text-white">VUONG_PH25621</p>
    </div>
</footer>

<script>
    function checkDelete() {
        var cf = confirm("Bạn có chắc chắn muốn xóa sản phẩm khỏi giỏ hàng không?");
        if (cf == true) {
            return true;
        } else {
            return false;
        }
    }
</script>
</html>