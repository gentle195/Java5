<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="	sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
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
            <form class="d-flex" method="post" action="/home/search">
                <input class="form-control me-2" type="search" placeholder="Tìm kiếm" aria-label="Search"
                       style="width: 500px;" name="ten">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item">
                    <a class="bi-cart-fill me-1" aria-current="page" href="/home/cart">Cart</a>
                </li>
            </ul>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
            </ul>
        </div>
    </div>
</nav>
<br>
<br>
<br>
<Section class="py-1">
    <div class="pd-wrap">
        <div class="container">
            <form action="/home/addDetail/${chiTiet.id}" method="post" onsubmit="return checkAdd()">
                <div>
                    <h2>Thông tin sản phẩm</h2>
                </div>
                <hr>
                <div class="row">
                    <div class="col-md-3">
                        <div class="item">
                            <img src="https://picsum.photos/200/300"/>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="product-dtl">
                            <div class="product-info">
                                <div class="product-name">Sản phẩm: ${chiTiet.sanPham.ten}</div>
                                <hr>
                            </div>
                            <div>
                                <div class="product-name">Thông tin chi tiết</div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-4">
                                    <label>Màu Sắc : </label>
                                    <p style="color: red">${chiTiet.mauSac.ten}</p>
                                </div>
                                <div class="col-md-4">
                                    <label>Dòng Sản Phẩm : </label>
                                    <p style="color: red">${chiTiet.dongSanPham.ten}</p>
                                </div>
                                <div class="col-md-4">
                                    <label>Hãng : </label>
                                    <p style="color: red">${chiTiet.nhaSanXuat.ten}</p>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-12">
                                    <label>Mô Tả Sản Phẩm : </label>
                                    <br>
                                    <textarea disabled>${chiTiet.moTa}</textarea>
                                </div>
                            </div>
                            <br>
                            <p class="product-count">
                            <div class="row">
                                <div class="col-md-12">
                                    <label>Số lượng : </label>
                                </div>
                                <br>
                                <div style="display: flex" class="col-md-7">
                                    <div id="qtyminus" class="col-md-0"><input type="button" value="-"></div>
                                    <div class="col-md-4"><input type="text" name="soLuong" value="1" id="qty"></div>
                                    <div id="qtyplus" class="col-md-6"><input type="button" value="+"></div>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-12">
                                    <label>Giá Bán :
                                        <div class="product-price-discount"><span
                                                style="text-decoration: black;color: red">${chiTiet.giaBan} Đ</span>
                                        </div>
                                    </label>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-12">
                                    <button type="submit">Thêm Vào Giỏ Hàng</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

        </div>
        <br>
    </div>
    </div>
</Section>
</body>
<footer class="py-1 bg-dark">
    <div class="container-fluid">
        <p class="m-0 text-center text-white">VUONG_PH25621</p>
    </div>
</footer>
<script>
    $("#qtyminus").on("click", function () {
        var now = $("#qty").val();
        if ($.isNumeric(now)) {
            if (parseInt(now) - 1 > 0) {
                now--;
            }
            $("#qty").val(now);
        }
    })
    $("#qtyplus").on("click", function () {
        var now = $("#qty").val();
        if ($.isNumeric(now)) {
            $("#qty").val(parseInt(now) + 1);
        }
    });
    function checkAdd() {
        var cf = confirm("Bạn có chắc chắn muốn thêm sản phẩm vào giỏ hàng không?");
        if (cf == true) {
            return true;
        } else {
            return false;
        }
    }
</script>
</html>