<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 4/2/2024
  Time: 6:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Footer</title>
</head>
<style>
    .tag-a a{
        text-decoration: none;
        color: black;
    }
    .tag-a{
        padding-top: 140px;
    }
    .footer{
        background-color: #efecec;
        height: 500px;
        margin-top: 250px;
        border-top: 1px solid gray;
    }
</style>
<body>
<footer class="footer text-center  " >
    <div class="container-fluid   ">
        <div class="row tag-a">
            <div class="col-md-4">
                <h5>Liên Hệ</h5>
                <p>Email: linhnhph33830@gmail.com</p>
                <p>Điện thoại: (012) 345-6789</p>
            </div>
            <div class="col-md-4">
                <h5>Thông Tin</h5>
                <ul class="list-unstyled ">
                    <li><a href="#" >Giới Thiệu</a></li>
                    <li><a href="#">Chính Sách Bảo Mật</a></li>
                    <li><a href="#">Điều Khoản Sử Dụng</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h5>Kết Nối</h5>
                <ul class="list-unstyled">
                    <li><a href="#">Facebook</a></li>
                    <li><a href="#">Twitter</a></li>
                    <li><a href="#">Instagram</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="mt-3 " style="padding-top: 180px">
        <p>&copy; 2024 Thời trang của tương lai. Tất cả các quyền được bảo lưu.</p>
    </div>
</footer>
</body>
</html>

