<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 30/03/2023
  Time: 5:42 CH
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
<section>
    <div class="container text-center">
        <form:form action="/san-pham/add-san-pham" method="post" modelAttribute="sanPham" onsubmit="return checkAdd()">
            <table class="table table-info table-striped">
                <tr>

                    <th style="text-align: center"><form:label path="ma">Mã Sản Phẩm</form:label></th>
                    <th style="text-align: center"><form:label path="ten">Tên Sản Phẩm</form:label></th>
                </tr>
                <tr>

                    <td style="text-align: center"><form:input path="ma"></form:input></td>
                    <td style="text-align: center"><form:input path="ten"></form:input></td>
                </tr>
                <tr>
                    <td style="text-align: center" colspan="2">
                        <button type="submit" class="btn btn-secondary">Thêm Sản Phẩm</button>
                    </td>
                </tr>
            </table>
        </form:form>
        <hr>
        <br>
        <h6>${thongBao}</h6>
        <br>
        <hr>
        <form action="/san-pham/search-san-pham" method="post">
            <table class="table table-danger table-striped">
                <tr>
                    <th style="text-align: center">Tìm Kiếm Theo Tên: <input type="text" name="tenTk"
                                                                             style="text-align: center ;"
                    ></th>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <button class="btn btn-secondary">Tìm Sản Phẩm</button>
                    </td>
                </tr>
            </table>
        </form>
        <hr>
        <h4 style="text-align: center;">Danh Sách Sản Phẩm</h4>
        <hr>
        <table class="table table-info table-striped">
            <tr>
                <th>Mã Sản Phẩm</th>
                <th>Tên Sản Phẩm</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${list}" var="sanPham">
                <tr>
                    <td>${sanPham.ma}</td>
                    <td>${sanPham.ten}</td>
                    <td>
                        <a href="/san-pham/detail-san-pham/${sanPham.id}" class="btn btn-success "
                           tabindex="-1"
                           role="button"
                           onclick="return checkDetail()">Detail</a>
                        <a href="/san-pham/view-update-san-pham/${sanPham.id}" class="btn btn-success "
                           tabindex="-1"
                           role="button"
                           aria-disabled="true" onclick="return checkViewUpdate()">Update</a>
                        <a href="/san-pham/remove-san-pham/${sanPham.id}" class="btn btn-success "
                           tabindex="-1"
                           role="button"
                           aria-disabled="true" onclick="return checkRemove()">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center pagination-lg">
                <li class="page-item"><a class="page-link" href="/san-pham/hien-thi?pageNum=0">First</a></li>
                <c:forEach begin="1" end="${total}" varStatus="status">
                    <li class="page-item">
                        <a href="${pageContext.request.contextPath}/san-pham/hien-thi?pageNum=${status.index -1}"
                           class="page-link">${status.index}</a>
                    </li>
                </c:forEach>
                <li class="page-item"><a class="page-link" href="/san-pham/hien-thi?pageNum=${total-1}">Last</a></li>
            </ul>
        </nav>

    </div>
</section>
</body>
<footer>
    <div class="py-1 bg-dark container-fluid">
        <p class="m-0 text-center text-white">VUONG_PH25621</p>
    </div>
</footer>
<script src="../js/checkValidate.js"></script>
</html>
