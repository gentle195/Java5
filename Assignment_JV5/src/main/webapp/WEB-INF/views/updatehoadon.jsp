<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 04/04/2023
  Time: 3:58 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
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
        <div class=" navbar-collapse">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link" aria-current="page" href="/chi-tiet-sp/hien-thi">Chi Tiết Sản
                    Phẩm</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="/san-pham/hien-thi">Sản
                    Phẩm</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="/chuc-vu/hien-thi">Chức Vụ</a>
                </li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="/cua-hang/hien-thi">Cửa
                    Hàng</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="/dong-san-pham/hien-thi">Dòng
                    Sản Phẩm</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="/khach-hang/hien-thi">Khách
                    Hàng</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="/mau-sac/hien-thi">Màu Sắc</a>
                </li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="/nhan-vien/hien-thi">Nhân
                    Viên</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="/NSX/hien-thi">Nhà
                    Sản Xuất</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="/gio-hang/hien-thi">Giỏ Hàng</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="/gio-hang-chi-tiet/hien-thi">Giỏ Hàng
                    Chi Tiết</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="/hoa-don/hien-thi">Hóa Đơn</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="/hoa-don-chi-tiet/hien-thi">Hóa Đơn
                    Chi Tiết</a></li>
            </ul>
        </div>
    </div>
</nav>
<br>
<br>
<br>
<br>
<br>
<section>
    <form:form action="/hoa-don/update-hoa-don/${hoaDon.id}" method="post" onsubmit="return checkAdd()"
               modelAttribute="hoaDon">
        <div class="container text-center">
            <table class="table table-info table-striped" style="text-align: center">
                <tr>

                    <th colspan="2"><form:label path="khachHang">Tên Khách Hàng</form:label></th>
                    <th colspan="2"><form:label path="nhanVien">Tên Nhân Viên</form:label></th>
                    <th colspan="2"><form:label path="ma">Mã Giỏ Hàng</form:label></th>
                    <th><form:label path="tenNguoiNhan">Tên Người Nhận</form:label></th>
                </tr>
                <tr>

                    <td colspan="2">
                        <form:select path="khachHang" items="${khachHang}" itemLabel="ten"
                                     itemValue="id">${khachHang.ten}</form:select>
                    </td>
                    <td colspan="2">
                        <form:select path="nhanVien" items="${nhanVien}" itemLabel="ten"
                                     itemValue="id">${nhanVien.ten}</form:select>
                    </td>
                    <td colspan="2">
                        <form:input path="ma"></form:input>
                    </td>
                    <td><form:input path="tenNguoiNhan"></form:input></td>
                </tr>
                <tr>
                    <th><form:label path="ngayTao">Ngày Tạo</form:label></th>
                    <th><form:label path="ngayShip">Ngày Ship</form:label></th>
                    <th><form:label path="ngayNhan">Ngày Nhận</form:label></th>
                    <th><form:label path="ngayThanhToan">Ngày Thanh Toán</form:label></th>
                    <th><form:label path="diaChi">Địa Chỉ</form:label></th>
                    <th><form:label path="sdt">Số Điện Thoại</form:label></th>
                    <th><form:label path="tinhTrang">Tình Trạng</form:label></th>
                </tr>
                <tr>
                    <td><form:input path="ngayTao" type ="date"></form:input></td>
                    <td><form:input path="ngayShip" type ="date"></form:input></td>
                    <td><form:input path="ngayNhan" type ="date"></form:input></td>
                    <td><form:input path="ngayThanhToan" type ="date"></form:input></td>
                    <td><form:input path="diaChi"></form:input></td>
                    <td><form:input path="sdt"></form:input></td>
                    <td>
                        <form:radiobutton path="tinhTrang" value="0" label="Chờ Thanh Toán"/>
                        <form:radiobutton path="tinhTrang" value="1" label="Đã Thanh Toán"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="7">
                        <button type="submit" class="btn btn-secondary">Sửa Hóa Đơn</button>
                    </td>
                </tr>
            </table>
        </div>
    </form:form>
</section>
</body>
<footer>
    <div class="py-1 bg-dark container-fluid">
        <p class="m-0 text-center text-white">VUONG_PH25621</p>
    </div>
</footer>
<script src="../js/checkValidate.js"></script>
</html>
