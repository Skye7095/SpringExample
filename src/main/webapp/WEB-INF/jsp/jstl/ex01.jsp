<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core 라이브러리</title>
</head>
<body>
	<h2>JSTL Core</h2>
	
	<h3>변수 만들기</h3>
	<c:set var="number1" value="100" />
	<c:set var="number2">200</c:set>
	<b>숫자1: ${number1 }</b><br>
	<b>숫자2: ${number2 }</b>
	
	<h3>변수 출력하기</h3>
	<b>숫자1: <c:out value="100" /></b> <br>
	<b>숫자2: <c:out value="${number2 }" /></b> <br>
	
	<!-- alert가 실행되는 게 아니라 <script>alert('안녕')</script> 그대로 출력하는 것. escapeXml="true" 속성이 숨겨있음-->
	<c:out value="<script>alert('안녕')</script>" />
	<c:out value="<script>alert('안녕')</script>" escapeXml="true"/>
	
	<!-- escapeXml="false"로 바꾸면 alert창이 뜬다. 근데 굳이 이렇게 안 해도 되고
	그냥  <script>alert('안녕')</script>  해도 alert 뜸-->
<%-- <c:out value="<script>alert('안녕')</script>" escapeXml="false"/> --%>	

	<h3>조건문</h3>
	<c:if test="true">
		<h4>조건이 참이다!</h4>
	</c:if>
	<c:if test="false">
		<h4>조건이 거짓이다!</h4>
	</c:if>
	
	<c:if test="${number1 > 50 }">
		<h4>number1이 50보다 크네요!</h4>
	</c:if>
	
	<%-- if(number1 == 100) --%>
	<c:if test="${number1 eq 100 }">
		<h4>number1은 100이다</h4>
	</c:if>
	
	<%-- if(number2 != 100) --%>
	<c:if test="${number2 ne 100 }">
		<h4>number2은 100과 같지 않다</h4>
	</c:if>
	
	<%-- 변수가 없다, 변수가 null이다, 리스트나 맵일 경우 비워져 있다 --%>
	<c:if test="${empty number3 }">
		<h4>number3은 없다</h4>
	</c:if>
	
	<%-- 변수가 있다, 변수가 null이 아니다, 리스트나 맵일 경우 비워져 있지 않다--%>
	<c:if test="${not empty number1 }">
		<h4>number1은 있다</h4>
	</c:if>
	
</body>
</html>