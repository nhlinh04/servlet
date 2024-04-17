<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 4/3/2024
  Time: 10:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/assets/css/product.css">
</head>
<body>
    <img src="/assets/img/baner-product.jpg" alt="banner-product0" width="100%">

    <div class="container m-5 p-4 d-flex justify-content-center align-items-center" >
        <a href="#"><button class="btn-filter btn "><h4>Tất cả</h4></button></a>
        <a href="#"><button class="btn-filter btn "><h4>Người lớn</h4></button></a>
        <a href="#"><button class="btn-filter btn "><h4>Trẻ em</h4></button></a>
        <a href="#"><button class="btn-filter btn " style="margin-right: 0"><h4>Dân chơi</h4></button></a>
    </div>
<%--    in ra sản phẩm--%>

    <div class="container">
        <div class="row">
            <c:forEach items="${currentPageProducts}" var="sp" >
                <div class="col-3">
                    <div class="card border-0" style="width: 18rem; position: relative;">
                        <a href="/product/details?id=${sp.id}">
                            <img src="/assets/img/pr1.jpg" class="card-img-top" alt="prd">
                            <a href="/product/details?id=${sp.id}" >
                                <div class="add-cart-overlay">
                                    <p class=" add-cart-btn">+Add Cart</p>
                                </div>
                            </a>
                        </a>
                        <div class="card-body">
                            <p class="card-title">${sp.tenSanPham}</p>
                            <h6>${sp.sanPhamChiTiets[0].giaBan} đ</h6>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
<%--    phan trang--%>
    <div class="container mt-4">
        <div class="row">
            <div class="col-12 d-flex justify-content-center">
                <c:if test="${pageNumber > 1}">
                    <a href="/product?page=${pageNumber - 1}" class="btn-page"><<</a>
                </c:if>

                <span class="btn-page-number">${pageNumber}</span>

                <c:if test="${pageNumber < totalPages}">
                    <a href="/product?page=${pageNumber + 1}" class="btn-page">>></a>
                </c:if>
            </div>
        </div>
    </div>
</body>
</html>
