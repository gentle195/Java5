<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 06/04/2023
  Time: 1:39 CH
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
    <form:form action="/chi-tiet-sp/update-chi-tiet-sp/${chiTiet.id}" method="post" onsubmit="return checkAdd()"
               modelAttribute="chiTiet">
        <div class="container text-center">
            <table class="table table-info table-striped" style="text-align: center">
                <tr>

                    <th colspan="2"><form:label path="sanPham">Tên Sản Phẩm</form:label></th>
                    <th colspan="2"><form:label path="nhaSanXuat">Tên Nhà Sản Xuất</form:label></th>
                    <th colspan="2"><form:label path="mauSac">Tên Màu Sắc</form:label></th>
                </tr>
                <tr>

                    <td colspan="2">
                        <form:select path="sanPham" items="${sanPham}" itemLabel="ten" itemValue="id"/>
                    </td>
                    <td colspan="2">
                        <form:select path="nhaSanXuat" items="${nhaSanXuat}" itemLabel="ten" itemValue="id"/>
                    </td>
                    <td colspan="2">
                        <form:select path="mauSac" items="${mauSac}" itemValue="id" itemLabel="ten"/>
                    </td>
                </tr>
                <tr>
                    <th><form:label path="dongSanPham">Tên Dòng Sản Phẩm</form:label></th>
                    <th><form:label path="namBaoHanh">Năm Bảo Hàng</form:label></th>
                    <th><form:label path="moTa">Mô tả</form:label></th>
                    <th><form:label path="soLuongTon">Số Lượng Tồn Kho</form:label></th>
                    <th><form:label path="giaNhap">Giá Nhập</form:label></th>
                    <th><form:label path="giaBan">Giá Bán</form:label></th>
                </tr>
                <tr>
                    <td>
                        <form:select path="dongSanPham" items="${dongSanPham}" itemValue="id" itemLabel="ten"/>
                    </td>
                    <td><form:input path="namBaoHanh"></form:input></td>
                    <td><form:input path="moTa"></form:input></td>
                    <td><form:input path="soLuongTon"></form:input></td>
                    <td><form:input path="giaNhap"></form:input></td>
                    <td><form:input path="giaBan"></form:input></td>
                </tr>
                <tr>
                    <td colspan="6">
                        <button type="submit" class="btn btn-secondary">Sửa Sản Phẩm</button>
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
