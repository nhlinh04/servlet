<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 4/2/2024
  Time: 6:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Header</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/assets/css/header.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light ">
    <div class="container">
        <a class="navbar-brand" href="/home">
            <img src="/assets/img/logo.jpg" alt="logo">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/home">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/product">Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/about">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>

            </ul>
        </div>
        <form class="form-inline my-2 my-lg-0 search-form" action="#" method="get">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>

        <div type="button" class="ms-5 " style="margin-top: 10px;">
                <i class="fa-solid fa-cart-shopping" style="font-size: 25px; color: black " data-bs-toggle="modal" id="btn-cart" data-bs-target="#exampleModal"></i>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade " id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"  >
        <div class="modal-dialog" style="margin-right: 5px; margin-top: 10px">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Cart Shopping</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <%--                    giỏ hàng--%>
                        <div class="container-fluid ">
                            <div class="container mt-5">
                                <div id="cart-items" style="height: 400px; overflow-y: auto">
                                    <!-- Danh sách sản phẩm trong giỏ hàng sẽ được hiển thị ở đây -->
                                </div>
                            </div>

                            <div class="row container btn-pay" >
                                <div class="col" >

                                </div>
                            </div>
                        </div>

                </div>
                <div class="modal-footer">
                    <h6 class=" fw-bold m-3 text-break" style="margin-left: 10px; " id="totalMoney">Tổng: 0 đ </h6>
                    <button onclick="loadPay()" id="btnToastPay" class="btn btn-outline-danger fw-bold"
                       style="margin: auto; text-decoration: none; width: 80%; height: 50px; border-radius: 0; " >
                        Thanh toán
                    </button>
                </div>
            </div>
        </div>
    </div>
    <%--Toast thông báo--%>
    <div class="toast-container position-fixed top-0 end-0 p-3 " style="z-index: 9999; margin-top: 70px">
        <div id="toast-pay" class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-bs-delay="3000" style=" border-radius: 15px">
            <div class="toast-body d-flex justify-content-center align-items-center " style="opacity: 1; background-color: #f5c5bf; border-radius: 15px">
                <i style="color: #af5e5e; font-size: 40px;" class="fa-solid fa-exclamation me-5"></i>
                <p style="font-size: 17px; margin-top: 11px; color: #af5e5e;" >Vui lòng chọn sản phẩm trước khi thanh toán</p>
            </div>
        </div>
    </div>
</nav>


<%--<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>--%>
</body>
<script>
    var cartItems = JSON.parse(localStorage.getItem("cart")) || [];
    var cartContainer = document.getElementById("cart-items")
    var totalMoney = 0;
    var toast2 = document.querySelector('#toast-pay');


    // Function để hiển thị danh sách sản phẩm trong giỏ hàng
    function showCartItems() {
        cartItems = JSON.parse(localStorage.getItem("cart")) || [];
        cartContainer.innerHTML = "";
        totalMoney = 0;
        cartItems.forEach(function(item, index) {
            var productHTML =`<div class="row product-container d-flex  align-items-center mb-3 border boder-1" >
                                        <div class="col-3 ">
                                            <img src="/assets/img/pr3.jpg" alt="sp" class="product-image mb-2 mt-2" style="width: 70px">
                                        </div>
                                        <div class="col-5 product-info">
                                            <div class="product-name text-break">`+item.idSanPham+`</div>
                                            <div class="product-price text-break">`+item.giaBan+` đ</div>
                                            <div class="product-name text-break">`+item.idMau+`</div>
                                            <div class="product-name text-break">`+item.idSize+`</div>
                                        </div>

                                        <div class="col-2 d-flex justify-content-center align-content-center " style=" height: 40px">
                                            <button class=" quantity-btn btn btn-outline-secondary btn-quantity" onclick="decreaseQuantity(`+index+`)" > - </button>
                                            <p style="padding: 0 5px ">`+item.soLuong+`</p>
                                            <button class="quantity-btn btn btn-outline-secondary btn-quantity" onclick="increaseQuantity(`+index+`)" > + </button>
                                        </div>

                                        <div class="col-2 text-end" >
                                            <div class="remove-btn btn mb-5 ms-4 " style="padding-bottom: 50px; font-size: 15px; color: #9f1616" onclick="removeFromCart(`+index+`)" >X</div>
                                        </div>
                                    </div>`;

            cartContainer.innerHTML += productHTML;
            totalMoney += (item.giaBan * item.soLuong);
        });
        document.getElementById("totalMoney").innerText = "Tổng: "+ totalMoney + " đ";
    }

    function removeFromCart(index) {
        cartItems.splice(index, 1);
        console.log(cartItems)
        localStorage.setItem("cart", JSON.stringify(cartItems));
        showCartItems();
    }

    // Tăng số lượng sản phẩm
    function increaseQuantity(index) {
        cartItems[index].soLuong++;
        localStorage.setItem("cart", JSON.stringify(cartItems));
        showCartItems();
    }

    // Giảm số lượng sản phẩm
    function decreaseQuantity(index) {
        if (cartItems[index].soLuong > 1) {
            cartItems[index].soLuong--;
            localStorage.setItem("cart", JSON.stringify(cartItems));
            showCartItems();
        }
    }

    // Hiển thị danh sách sản phẩm khi trang được load
    window.onload = function() {
        showCartItems();
    };


    function loadPay(){
        cartItems = JSON.parse(localStorage.getItem("cart")) || [];
        if(cartItems.length <=0){
            var toast = new bootstrap.Toast(toast2);
            toast.show();
        } else {
            window.location.href = '/product/pay';
        }
    }


</script>
</html>




