<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 4/7/2024
  Time: 4:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        .btn-home {
            display: block;
            text-decoration: none;
            color:black;
            font-weight: bold;
            margin-top: 15px;
            margin-bottom: 15px;
        }
        .btn-home:hover{
            color: #fc6464;
        }
    </style>
</head>
<body>

<div class="mt-5 ">
    <div class="container ">
        <a href="/product" class="btn-home" >< Tiếp tục mua sắm</a>
        <h3 >Thông tin giao hàng</h3>
        <form action="#" id="form" >
            <div class="row gx-5" style="margin: auto; " >
                <div class="col-6 mt-5 p-5 border border-1" style="box-shadow: 0px 5px 10px 2px rgba(0, 0, 0, 0.2);">
                    <div class="mb-3">
                        <label class="form-label fs-6 fw-bold">Khách hàng</label>
                        <input class="form-control " type="text" name="nameCustomer" id="nameCustomer" placeholder="Nguyen van a" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fs-6 fw-bold">Số điện thoại</label>
                        <input class="form-control " type="text" name="numberPhone" id="numberPhone" placeholder="0999999999" pattern="[0-9]{10,11}" title="Số điện thoại không hợp lệ" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fs-6 fw-bold">Địa chỉ</label>
                        <input class="form-control " type="text" name="address" id="address" placeholder="số nhà, thôn, xã, phường, thành phố" required>
                    </div>
             </div>

            <div class="container col-6 mt-5 border border-1 p-5" style="width: 400px; box-shadow: 0px 5px 10px 2px rgba(0, 0, 0, 0.2);">
                <h5>Giá trị đơn hàng: </h5>
                <p class="fs-5 text-break" id="money-order">12333 đ</p>
                <hr>
                <h5>Giảm giá: </h5>
                <p class="fs-5 text-break" id="discount">0%</p>
                <hr>
                <h5>Tổng thanh toán: </h5>
                <p class="fs-5 text-break" id="total-money"> 2333 đ</p>
            </div>
    </div>
            <div class=" row mt-3 ">
                <button class="btn btn-danger" style="margin-top: 100px; border-radius: 0; height: 70px">Thanh toán</button>
            </div>
    </form>
    </div>
</div>
    <jsp:include page="/views/template/footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/assets/js/pay.js"></script>

</body>


</html>