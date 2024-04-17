<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: nguyenvv
  Date: 12/03/2024
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/assets/css/home.css">
</head>
<body>
    <div id="carouselExample" class="carousel slide mb-5">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="/assets/img/slide1.jpg" class="d-block w-100" alt="bn1">
            </div>
            <div class="carousel-item">
                <img src="/assets/img/slide2.jpg" class="d-block w-100" alt="bn2">
            </div>
            <div class="carousel-item">
                <img src="/assets/img/slide3.jpg" class="d-block w-100" alt="bn3">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
            <span class="carousel-control-prev-icon " aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <hr>
    <div class="container mt-5">
        <h2>Sản phẩm bán chạy</h2>
        <div class="row mt-3">
            <c:forEach items="${listSPActive}" var="sp" >
                <div class="col-3">
                    <div class="card border-0" style="width: 18rem; position: relative;">
                        <a href="/product/details?id=${sp.id}">
                            <img src="/assets/img/pr2.jpg" class="card-img-top" alt="prd">
                            <a href="/product/details?id=${sp.id}" >
                                <div class="add-cart-overlay">
                                    <p class=" add-cart-btn">+Add Cart</p>
                                </div>
                            </a>
                        </a>
                        <div class="card-body">
                            <p class="card-title">${sp.tenSanPham}</p>
                            <h6>Price: ${sp.sanPhamChiTiets[0].giaBan} đ</h6>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <div class="container mt-5">
        <img src="/assets/img/baner-product-2.jpg" class="mb-4" alt="bn2" width="100%">
        <h2>Các sản phẩm hot</h2>
        <div class="row mt-3">
            <c:forEach items="${listSPActive}" var="sp" >
                <div class="col-3">
                    <div class="card border-0" style="width: 18rem; position: relative;">
                        <a href="/product/details?id=${sp.id}">
                            <img src="/assets/img/pr3.jpg" class="card-img-top" alt="prd">
                            <a href="/product/details?id=${sp.id}" >
                                <div class="add-cart-overlay">
                                    <p class=" add-cart-btn">+Add Cart</p>
                                </div>
                            </a>
                        </a>
                        <div class="card-body">
                            <p class="card-title">${sp.tenSanPham}</p>
                            <h6>Price: ${sp.sanPhamChiTiets[0].giaBan} đ</h6>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="d-flex justify-content-center mt-5 mb-5">
            <a href="/product" class="align-items-center ">
                <button class="btn btn-outline-danger">Xem tất cả</button></a>
        </div>
        <img src="/assets/img/baner-product-3.jpg" class="" alt="bn2" width="100%">

        <div class="d-flex flex-column align-items-center justify-content-center mt-5 mb-5">
            <div>
                <h1>Thời trang tương lai</h1>
            </div>
            <div>
                <h6>Cùng ZSHOP cập nhật những thông tin mới nhất về thời trang và phong cách sống.</h6>
            </div>
        </div>

    </div>

</body>

</html>
