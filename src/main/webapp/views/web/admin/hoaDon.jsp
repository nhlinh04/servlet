<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 4/8/2024
  Time: 1:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HoaDON</title>
</head>
<body>
      <div class="container " style="height: 500px; overflow-y: auto">
        <h1>Hóa đơn</h1>
        <table class="table table-hover" >
          <tr>
            <th>STT</th>
            <th>ID</th>
            <th>Khách hàng</th>
            <th>Địa chỉ</th>
            <th>Số điện thoại</th>
            <th>Ngày tạo</th>
            <th>Ngày sửa</th>
            <th>Trạng thái</th>
            <th>Action</th>
          </tr>

          <c:forEach items="${listHoaDon}" var="hd" varStatus="status">
            <tr>
              <td>${status.index + 1}</td>
              <td>${hd.id}</td>
              <td>${hd.khachHang.hoTen}</td>
              <td>${hd.diaChi}</td>
              <td>${hd.soDienThoai}</td>
              <td>${hd.ngayTao}</td>
              <td>${hd.ngaySua}</td>
              <td>${hd.trangThai}</td>
              <td>
                <a href="?id=${hd.id}">
                  <button class="btn btn-primary">Details</button></a>
                <a href="?id=${hd.id}">
                  <button class="btn btn-danger">Delete</button></a>
              </td>
            </tr>
          </c:forEach>
        </table>
      </div>

      <h1>Hóa đơn chi tiết</h1>
      <div class="container " style="height: 500px; overflow-y: auto">
        <table class="table table-hover" >
          <tr>
            <th>STT</th>
            <th>ID</th>
            <th>Hóa đơn</th>
            <th>Sản phẩm</th>
            <th>Số lượng</th>
            <th>Giá bán</th>
            <th>Tổng tiền</th>
            <th>Ngày tạo</th>
            <th>Ngày sửa</th>
            <th>Trạng thái</th>
          </tr>

          <c:forEach items="${listHoaDonChiTiet}" var="hdct" varStatus="status">
            <tr>
              <td>${status.index + 1}</td>
              <td>${hdct.id}</td>
              <td>${hdct.hoaDon.id}</td>
              <td>${hdct.sanPhamChiTiet.id}</td>
              <td>${hdct.soLuongMua}</td>
              <td>${hdct.giaBan}</td>
              <td>${hdct.tongTien}</td>
              <td>${hdct.ngaySua}</td>
              <td>${hdct.ngayTao}</td>
              <td>${hdct.trangThai}</td>
              <td></td>
            </tr>
          </c:forEach>
        </table>
      </div>
</body>
</html>
