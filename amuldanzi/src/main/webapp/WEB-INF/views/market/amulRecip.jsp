<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <title>주문 정보 입력</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
  <div class="container">
    <h2 class="my-3">주문 정보 입력</h2>
    <form id="orderForm" action="/order" method="post">
      <fieldset class="my-3">
        <legend>주문자 정보:</legend>
        이름: <input type="text" class="form-control" name="ordererName" required><br>
        연락처: <input type="text" class="form-control" name="ordererPhone" required><br>
        이메일: <input type="email" class="form-control" name="ordererEmail" required><br>
      </fieldset>
      <fieldset class="my-3">
        <legend>배송지 정보:</legend>
        수령인 이름: <input type="text" class="form-control" name="recipientName" required><br>
        수령인 연락처: <input type="text" class="form-control" name="recipientPhone" required><br>
        배송 주소: <input type="text" class="form-control" name="deliveryAddress" required><br>
        배송 메모: <textarea class="form-control" name="deliveryMemo"></textarea><br>
      </fieldset>
      <button type="submit" class="btn btn-primary">결제하기</button>
    </form>
  </div>
  <script>
    $("#orderForm").on("submit", function() {
      if (!this.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
      }
      this.classList.add('was-validated');
    });
  </script>
</body>
</html>
