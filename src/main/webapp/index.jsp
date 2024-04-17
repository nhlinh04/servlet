<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Trang chủ</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">


</head>
<style>
  ::-webkit-scrollbar {
    display: none; /* Ẩn thanh cuộn trên Chrome, Safari và Edge */
  }

  html {
    scrollbar-width: none; /* Ẩn thanh cuộn trên Firefox */
  }

</style>
<body >

  <jsp:include page="views/template/header.jsp"></jsp:include>
  <jsp:include page="views/web/${page}"></jsp:include>
  <jsp:include page="views/template/footer.jsp"></jsp:include>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
</html>