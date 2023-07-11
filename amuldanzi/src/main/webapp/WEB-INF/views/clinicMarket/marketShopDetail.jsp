<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓정보 상세보기</title>
</head>
<body>
    <div style="width: 200px; height: 200px; background-color: white; border: 2px solid black; display: flex; align-items: center; justify-content: center; margin-top: 500px;">
        <span>마켓명 : ${market.marketName}</span>
        <br>
        <span>전화번호 : ${market.marketTel}</span>
        <br>
        <span>주소 : ${market.marketAddr}</span>
        <br>
        <span>영업시간 : ${market.marketTime}</span>
    </div>
<jsp:include page="../main/header.jsp"></jsp:include>
</body>
</html>