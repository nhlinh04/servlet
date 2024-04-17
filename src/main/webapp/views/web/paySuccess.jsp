<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 4/8/2024
  Time: 9:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment Successful</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f0f0;
        }

        .container {
            margin-top: 100px;
        }

        .card {
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #007bff;
            color: #fff;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h1 class="text-center">Payment Successful!</h1>
                </div>
                <div class="card-body text-center">
                    <p>Hóa đơn của bạn đã được hệ thống tiếp nhận và đang tiến hành xử lý.</p>
                    <a href="/product" class="btn btn-primary">Tiếp tục mua sắn</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
