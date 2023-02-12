<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL fmt 라이브러리</title>
</head>
<body>
	<h2>JSTL 포맷 라이브러리</h2>
	
	<c:set var="number" value="12345678" />
	<h3>숫자 출력</h3>
	<h4><fmt:formatNumber value="${number }" /></h4>
	
	<h3>percent</h3>
	<h4><fmt:formatNumber value="0.35" type="percent" /></h4>
	<h4><fmt:formatNumber value="1" type="percent" /></h4>
	<h4><fmt:formatNumber value="${3/5 }" type="percent" /></h4>
	
	<h3>currency</h3>
	<%-- 컴퓨터 지역설정에 따라서 기본적으로 진행됨. 다른 나라 통화로 표시하고 싶으면 currencySymbol 속성 추가하면 됨 --%>
	<h4><fmt:formatNumber value="${number }" type="currency" /></h4>
	<h4><fmt:formatNumber value="${number }" type="currency" currencySymbol="$" /></h4>	
	
	<%-- 해당 통화를 변수에 넣고 싶으면 var추가하면 됨 --%>
	<fmt:formatNumber value="${number }" type="currency" currencySymbol="$" var="dollar"/>
	<h4>${dollar }</h4>
	
	<h3>숫자 소수점 패턴</h3>
	<%-- 보통 #으로 자릿수를 표시하는데 0으로도 가능. 0으로 진해하면 해당 자릿수가 비어있으면 0으로 표현 --%>
	<c:set var="pi" value="3.1415926535" />
	<h4>${pi }</h4>
	<h4><fmt:formatNumber value="${pi }" pattern="#.##" /></h4>
	<h4><fmt:formatNumber value="${pi }" pattern="0.00" /></h4>
	<h4><fmt:formatNumber value="${pi }" pattern="0.00000000000000" /></h4>
	<h4><fmt:formatNumber value="${pi }" pattern="#.##############" /></h4>
	
	<hr>
	
	<h3>날짜 포맷</h3>
	<h4>${now }</h4>
	<h4><fmt:formatDate value="${now }" pattern="yyyy년 MM월 dd일"/></h4>
	
	<h3>문자열을 Date 객체로 변환</h3>
	<h4>${dateString }</h4>
	<h4><fmt:parseDate value="${dateString }" pattern="yyyy/MM/dd HH:mm:ss" var="date"/></h4>
	<h4>${date }</h4>
</body>
</html>