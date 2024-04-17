<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 4/8/2024
  Time: 11:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Trang Chủ - Web Thời Trang</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>


  <!-- Banner -->
  <section id="banner" class="py-5 text-white text-center bg-dark">
    <div class="container">
      <h1 class="display-4">Thời Trang Mới Nhất</h1>
      <p class="lead">Khám phá bộ sưu tập mới nhất của chúng tôi</p>
      <a href="/product" class="btn btn-primary btn-lg">Xem Ngay</a>
    </div>
  </section>

  <!-- About Us Section -->
  <section id="about" class="py-5">
    <div class="container">
      <div class="row">
        <div class="col-lg-6">
          <h2>Về Chúng Tôi</h2>
          <p>Web Thời Trang là nơi bạn có thể tìm thấy những sản phẩm thời trang chất lượng từ các nhãn hiệu nổi tiếng.</p>
        </div>
        <div class="col-lg-6">
          <img src="/assets/img/baner-product-3.jpg" alt="About Us" class="img-fluid">
        </div>
      </div>
    </div>
  </section>

  <!-- Featured Collection Section -->
  <section id="featured-collection" class="py-5 bg-light">
    <div class="container">
      <h2 class="text-center mb-4">Bộ Sưu Tập Nổi Bật</h2>
      <div class="row">
        <div class="col-md-4">
          <div class="card">
            <img src="/assets/img/pr1.jpg" alt="Product 1" class="card-img-top">
            <div class="card-body">
              <h5 class="card-title">Sản Phẩm 1</h5>
              <p class="card-text">Mô tả sản phẩm 1</p>
              <a href="/product/details?id=1" class="btn btn-primary">Xem chi tiết</a>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card">
            <img src="/assets/img/pr2.jpg" alt="Product 2" class="card-img-top">
            <div class="card-body">
              <h5 class="card-title">Sản Phẩm 2</h5>
              <p class="card-text">Mô tả sản phẩm 2</p>
              <a href="/product/details?id=2" class="btn btn-primary">Xem chi tiết</a>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card">
            <img src="/assets/img/pr3.jpg" alt="Product 3" class="card-img-top">
            <div class="card-body">
              <h5 class="card-title">Sản Phẩm 3</h5>
              <p class="card-text">Mô tả sản phẩm 3</p>
              <a href="/product/details?id=3" class="btn btn-primary">Xem chi tiết</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Contact Section -->
  <section id="contact" class="py-5">
    <div class="container">
      <h2 class="text-center mb-4">Liên Hệ</h2>
      <div class="row">
        <div class="col-md-6">
          <form>
            <div class="form-group">
              <label for="name">Họ và Tên</label>
              <input type="text" class="form-control" id="name" placeholder="Nhập họ và tên">
            </div>
            <div class="form-group">
              <label for="email">Email</label>
              <input type="email" class="form-control" id="email" placeholder="Nhập email">
            </div>
            <div class="form-group">
              <label for="message">Nội dung tin nhắn</label>
              <textarea class="form-control" id="message" rows="3" placeholder="Nhập nội dung tin nhắn"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Gửi</button>
          </form>
        </div>
        <div class="col-md-6 " style="margin-top: 33px">
          <div class="card text-center">
            <div class="card-body">
              <h5 class="card-title">Thông tin liên hệ</h5>
              <p class="card-text">Địa chỉ: 34 Mỹ Đình - Nam Từ Liêm - Hà Nội</p>
              <p class="card-text">Số điện thoại: +84 37-938-6285</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>


