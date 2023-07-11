<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
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
    <link href="css/styles.css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/stylepdt.css">
    <script src="js/script.js"></script>
    <script src="js/ass.js"></script>
</head>

<body>
<!-- Navigation-->
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
                <!-- <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">Mặt hàng</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Nến Thơm</a></li>
                        <li><a class="dropdown-item" href="#!">Phụ Kiện</a></li>
                    </ul>
                </li> -->


            </ul>
        </div>
    </div>
</nav>
<br>
<br>
<br>
<section>
    <div class="container text-center">
        <div class="product-info-tabs">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab"
                       aria-controls="description" aria-selected="true">
                        <h5>SẢN PHẨM NỔI BẬT</h5>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " id="review-tab" data-toggle="tab" href="#review" role="tab"
                       aria-controls="review" aria-selected="false">
                        <h5>SẢN PHẨM MỚI</h5>
                    </a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="description" role="tabpanel"
                     aria-labelledby="description-tab">
                    <div class="row row-cols-md-4 row-cols-xl-3 justify-content-center">
                        <c:forEach items="${list}" var="chiTiet">
                            <div class="col mb-5">
                                <div class="box">
                                    <div class="card h-100">
                                        <img class="card-img-top" src="https://picsum.photos/200/300" alt="..."/>
                                        <div class="card-body p-4" style="background-color: antiquewhite;">
                                            <div class="text-center">
                                                <h5>${chiTiet.sanPham.ten}</h5>
                                                    ${chiTiet.giaBan}Đ
                                                <br>
                                                <div>
                                                    <a class="btn btn-outline-dark mt-auto"
                                                       style="border: 1px solid #000; width: 40%; float: left;"
                                                       href="/home/detail/${chiTiet.id}" onclick="return checkDetail()"><i
                                                            class="bi bi-eye"></i></a>
                                                    </a>
                                                    <a class="btn btn-outline-dark mt-auto"
                                                       href="/home/add?id=${chiTiet.id}"
                                                       style="border: 1px solid #000; width: 40%;  float: right;" onclick="return checkAdd()"><i
                                                            class="bi bi-cart-fill"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center pagination-lg">
                            <li class="page-item"><a class="page-link" href="/home/hien-thi?pageNum=0">First</a></li>
                            <c:forEach begin="1" end="${total}" varStatus="status">
                                <li class="page-item">
                                    <a href="/home/hien-thi?pageNum=${status.index -1}"
                                       class="page-link">${status.index}</a>
                                </li>
                            </c:forEach>
                            <li class="page-item"><a class="page-link" href="/home/hien-thi?pageNum=${total-1}">Last</a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
                    <div class="row row-cols-md-4 row-cols-xl-3 justify-content-center">
                        <c:forEach items="${list}" var="chiTiet">
                            <div class="col mb-5">
                                <div class="box">
                                    <div class="card h-100">
                                        <img class="card-img-top" src="https://picsum.photos/200/300" alt="..."/>
                                        <div class="card-body p-4" style="background-color: antiquewhite;">
                                            <div class="text-center">
                                                <h5>${chiTiet.sanPham.ten}</h5>
                                                    ${chiTiet.giaBan}Đ
                                                <br>
                                                <div>
                                                    <a class="btn btn-outline-dark mt-auto"
                                                       style="border: 1px solid #000; width: 40%; float: left;"
                                                       href="/home/detail/${chiTiet.id}" onclick="return checkDetail()"><i
                                                            class="bi bi-eye"></i></a>
                                                    </a>
                                                    <a class="btn btn-outline-dark mt-auto"
                                                       href="/home/add?id=${chiTiet.id}"
                                                       style="border: 1px solid #000; width: 40%;  float: right;" onclick="return checkAdd()"><i
                                                            class="bi bi-cart-fill"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center pagination-lg">
                            <li class="page-item"><a class="page-link" href="/home/hien-thi?pageNum=0">First</a></li>
                            <c:forEach begin="1" end="${total}" varStatus="status">
                                <li class="page-item">
                                    <a href="/home/hien-thi?pageNum=${status.index -1}"
                                       class="page-link">${status.index}</a>
                                </li>
                            </c:forEach>
                            <li class="page-item"><a class="page-link" href="/home/hien-thi?pageNum=${total-1}">Last</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<footer>
    <div class="py-1 bg-dark container-fluid">
        <p class="m-0 text-center text-white">VUONG_PH25621</p>
    </div>
</footer>

<script>
    function checkAdd() {
        var cf = confirm("Bạn có chắc chắn muốn thêm sản phẩm vào giỏ hàng không?");
        if (cf == true) {
            return true;
        } else {
            return false;
        }
    }
    function checkDetail() {
        var cf = confirm("Bạn có chắc chắn muốn sang trang detail sản phẩm không?");
        if (cf == true) {
            return true;
        } else {
            return false;
        }
    }
</script>
</html>