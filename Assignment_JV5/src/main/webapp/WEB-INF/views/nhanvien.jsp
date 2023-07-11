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
        <form:form action="/nhan-vien/add-nhan-vien" method="post" onsubmit="return checkAdd()"
                   modelAttribute="nhanVien">
            <table class="table table-info table-striped">
                <tr>

                    <th style="text-align: center"><form:label path="ma">Mã Nhân Viên</form:label></th>
                    <th style="text-align: center"><form:label path="ho">Họ Nhân Viên</form:label></th>
                    <th style="text-align: center"><form:label path="tenDem">Tên Đệm Nhân Viên</form:label></th>
                    <th style="text-align: center"><form:label path="ten">Tên Nhân Viên</form:label></th>

                </tr>
                <tr>

                    <td style="text-align: center"><form:input path="ma"></form:input></td>
                    <td style="text-align: center"><form:input path="ho"></form:input></td>
                    <td style="text-align: center"><form:input path="tenDem"></form:input></td>
                    <td style="text-align: center"><form:input path="ten"></form:input></td>

                </tr>
                <tr>
                    <th style="text-align: center"><form:label path="ngaySinh">Ngày Sinh(YYYY-MM-DD)</form:label></th>
                    <th style="text-align: center"><form:label path="sdt">Số Điện Thoại</form:label></th>
                    <th style="text-align: center"><form:label path="diaChi">Địa Chỉ</form:label></th>
                    <th style="text-align: center"><form:label path="matKhau">Mật Khẩu</form:label></th>
                </tr>
                <tr>
                    <td style="text-align: center"><form:input path="ngaySinh" type ="date"></form:input></td>
                    <td style="text-align: center"><form:input path="sdt"></form:input></td>
                    <td style="text-align: center"><form:input path="diaChi"></form:input></td>
                    <td style="text-align: center"><form:input path="matKhau"></form:input></td>
                </tr>
                <tr>
                    <th style="text-align: center"><form:label path="gioiTinh">Giới Tính</form:label></th>
                    <th style="text-align: center"><form:label path="cuaHang">Cửa Hàng</form:label></th>
                    <th style="text-align: center"><form:label path="chucVu">Chưc Vụ</form:label></th>
                    <th style="text-align: center"><form:label path="trangThai">Trạng Thái</form:label></th>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <form:radiobutton path="gioiTinh" value="Nam" label="Nam"/>
                        <form:radiobutton path="gioiTinh" value="Nữ" label="Nữ"/>
                    </td>
                    <td style="text-align: center">
                        <form:select path="cuaHang" items="${cuaHang}" itemValue="id"
                                     itemLabel="ten"/>
                    </td>
                    <td style="text-align: center">
                        <form:select path="chucVu" items="${chucVu}" itemValue="id"
                                     itemLabel="ten"/>
                    </td>
                    <td style="text-align: center">
                        <form:radiobutton path="trangThai" value="0" label="Nhân viên cũ"/>
                        <form:radiobutton path="trangThai" value="1" label="Nhân viên mới"/>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td style="text-align: center" colspan="2">
                        <button type="submit" class="btn btn-secondary">Thêm Nhân Viên</button>
                    </td>
                    <td></td>

                </tr>
            </table>
        </form:form>
        <hr>
        <br>
        <h6>${thongBao}</h6>
        <br>
        <hr>
        <form:form action="/nhan-vien/search-nhan-vien" onsubmit="return checkSearch()" modelAttribute="nhanVien"
                   method="post">
            <table class="table table-danger table-striped">
                <tr>
                    <th style="text-align: center">Tìm Kiếm Theo Tên: <input type="text" name="tenTk"
                                                                             style="text-align: center ;">
                    </th>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <button class="btn btn-secondary">Tìm Nhân Viên</button>
                    </td>
                </tr>
            </table>
        </form:form>
        <hr>
        <h4 style="text-align: center;">Danh Sách Nhân Viên</h4>
        <hr>
        <table class="table table-info table-striped" style="text-align: center">
            <tr>
                <th>Mã Nhân Viên</th>
                <th>Họ Tên Nhân Viên</th>
                <th>Giới Tính</th>
                <th>SĐT</th>
                <th>Ngày Sinh</th>
                <th>Địa Chị</th>
                <th>Mật Khẩu</th>
                <th>Chức Vụ</th>
                <th>Cửa Hàng</th>
                <th>Trạng Thái</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${list}" var="nhanVien">
                <tr>
                    <td>${nhanVien.ma}</td>
                    <td>${nhanVien.ho} ${nhanVien.tenDem} ${nhanVien.ten}</td>
                    <td>${nhanVien.gioiTinh}</td>
                    <td>${nhanVien.sdt}</td>
                    <td>${nhanVien.ngaySinh}</td>
                    <td>${nhanVien.diaChi}</td>
                    <td>${nhanVien.matKhau}</td>
                    <td>${nhanVien.chucVu.ten}</td>
                    <td>${nhanVien.cuaHang.ten}</td>
                    <td>
                        <c:if test="${nhanVien.trangThai ==0}">Nhân Viên Cũ</c:if>
                        <c:if test="${nhanVien.trangThai ==1}">Nhân Viên Mới</c:if>
                    </td>
                    <td>
                        <a href="/nhan-vien/detail-nhan-vien/${nhanVien.id}" class="btn btn-success "
                           tabindex="-1"
                           role="button"
                           onclick="return checkDetail()">Detail</a>
                        <a href="/nhan-vien/view-update-nhan-vien/${nhanVien.id}" class="btn btn-success "
                           tabindex="-1"
                           role="button"
                           aria-disabled="true" onclick="return checkViewUpdate()">Update</a>
                        <a href="/nhan-vien/remove-nhan-vien/${nhanVien.id}" class="btn btn-success "
                           tabindex="-1"
                           role="button"
                           aria-disabled="true" onclick="return checkRemove()">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center pagination-lg">
                <li class="page-item"><a class="page-link" href="/nhan-vien/hien-thi?pageNum=0">First</a></li>
                <c:forEach begin="1" end="${total}" varStatus="status">
                    <li class="page-item">
                        <a href="${pageContext.request.contextPath}/nhan-vien/hien-thi?pageNum=${status.index -1}"
                           class="page-link">${status.index}</a>
                    </li>
                </c:forEach>
                <li class="page-item"><a class="page-link" href="/nhan-vien/hien-thi?pageNum=${total-1}">Last</a></li>
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
