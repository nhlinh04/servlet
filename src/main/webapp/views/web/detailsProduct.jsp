<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 4/4/2024
  Time: 2:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<style>
  .custom-page{
    display: block;
    margin-top: 5px;
  }

  .btn-add-cart {
    width: 300px;
    height: 60px;
    border-radius: 0px;
  }

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
<body>
  <div class="container ">
    <a href="/home" class="btn-home" >< Home</a>
    <div class="row me-5 ">
      <div class="col-6">
        <img src="/assets/img/pr2.jpg" alt="spimg" width="100%">
      </div>
      <div class="col-6 mt-3">

        <div>
            <h3>${sanPham.tenSanPham}</h3>
            <i>${sanPham.maSanPham}</i>
        </div>

          <div >
              <i class="custom-page" style="color: red; font-size: 30px; display: inline-block" id="giaBan"> </i>
              <i style="color: red; font-size: 30px; display: inline-block" > đ</i>
          </div>

          <div>
              <small id="soLuong"> </small>

              <b class="mt-3 custom-page">Màu sắc:</b>
              <c:forEach var="color" items="${listColor}">
                  <input type="radio" name="color" class="form-check-input " id="color" value="${color.id}" onclick="showPrice()" checked>
                          ${color.tenMau} </input>
              </c:forEach>
              <b class="mt-3 custom-page">Kích cỡ:</b>
              <c:forEach var="size" items="${listSize}">
                  <input type="radio" name="size" id="size" class="form-check-input " value="${size.id}" onclick="showPrice()" checked>
                          ${size.maSize} </input>
              </c:forEach>

              <div class="mt-5">
                  <button class="btn btn-outline-danger btn-add-cart " id="liveToastBtn" onclick="addToCart()" >+Thêm vào giỏ hàng</button>

                  <div class="toast-container position-fixed top-0 end-0 p-3" style="z-index: 9999; margin-top: 70px; ">
                      <div id="liveToastPass" class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-bs-delay="3000" style="border-radius: 15px">
                          <div class="toast-body d-flex justify-content-center align-items-center " style="opacity: 1; background-color: #cff5bf; border-radius: 15px">
                              <i style="color: #559155; font-size: 40px;" class="fa-solid fa-circle-check me-5"></i>
                              <p style="font-size: 17px; margin-top: 11px; color: #559155;" >Thêm sản phẩm vào giỏ hàng thành công</p>
                          </div>

                      </div>
                  </div>

                  <div class="toast-container position-fixed top-0 end-0 p-3 " style="z-index: 9999; margin-top: 70px">
                      <div id="liveToastFail" class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-bs-delay="3000" style=" border-radius: 15px">
                          <div class="toast-body d-flex justify-content-center align-items-center " style="opacity: 1; background-color: #f5c5bf; border-radius: 15px">
                              <i style="color: #af5e5e; font-size: 40px;" class="fa-solid fa-exclamation me-5"></i>
                              <p style="font-size: 17px; margin-top: 11px; color: #af5e5e;" >Vui lòng chọn sản phẩm khác</p>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
    </div>
  </div>


  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>

<script>
    var url = new URL(window.location.href);
    var idSize = document.querySelector('input[name="size"]:checked').value;
    var idColor = document.querySelector('input[name="color"]:checked').value;
    var idSP = url.searchParams.get("id");
    var giaBan = 0;
    var soLuongTon = 0;


    var cartItems = JSON.parse(localStorage.getItem("cart")) || [];
    var toastEl = document.getElementById('liveToastPass');


    document.addEventListener("DOMContentLoaded", function() {
        // Lấy thẻ button bằng ID
        var toastBtn = document.getElementById('liveToastBtn');
        // Khi nút được nhấn
        toastBtn.addEventListener('click', function() {
            // Khởi tạo một đối tượng Toast từ Bootstrap
            var toast = new bootstrap.Toast(toastEl);
            // Hiển thị toast
            toast.show();
        });

    });

    // hiển thị giá khi chọn 1 sản phẩm chi tiết theo màu và size
  function showPrice() {
      giaBan = "Hết hàng";
      soLuongTon = 0;
      idSize = document.querySelector('input[name="size"]:checked').value;
      idColor = document.querySelector('input[name="color"]:checked').value;

    <c:forEach var="spct" items="${listSPCT}">
        if(idSize == ${spct.size.id} && idColor == ${spct.mauSac.id}){
          soLuongTon = ${spct.soLuongTon};
          if(soLuongTon > 0){
              giaBan = ${spct.giaBan};
          }
        }
    </c:forEach>

    document.getElementById("giaBan").innerText = giaBan;
    document.getElementById("soLuong").innerText ="Số lượng: " + soLuongTon;
    }

    // add sản phẩm vảo giỏ hàng
    function addToCart(){
        toastEl = document.getElementById('liveToastPass');

        let spct = {
            "idSanPham" : idSP,
            "idMau": idColor,
            "idSize" : idSize,
            "giaBan": giaBan,
            "soLuong": 1
        };

        let indexCart = -1;

        if(isNaN(spct.giaBan) || isNaN(spct.idSanPham)
            || isNaN(spct.idMau)  || isNaN(spct.soLuong)
                || isNaN(spct.idSize) && spct.soLuong <= 0 ){
            toastEl = document.getElementById("liveToastFail");
            return;
        }
        cartItems.forEach((item, index) => {
            if(item.idSanPham === spct.idSanPham &&
                item.idMau === spct.idMau &&
                item.idSize === spct.idSize) {
                console.log()
                indexCart = index;
                return;
            }
        });

        if(indexCart !== -1) {
            cartItems[indexCart].soLuong++;
        } else {
            cartItems.push(spct);
        }
        localStorage.setItem("cart", JSON.stringify(cartItems));
        showCartItems();
    }

    // sự kiện khi load trang web lên thì showPrice được gọi
    document.addEventListener("DOMContentLoaded", function() {
        showPrice();
    });
</script>
</html>
