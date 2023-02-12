<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL fn 라이브러리</title>
</head>
<body>
	<h2>JSTL fn 라이브러리</h2>
	
	<c:set var="string1" value="No pain. No gain." />
	
	<h3>길이 구하기</h3>
	<h4>길이:${fn:length(string1) }</h4>
	
	<h3>특정 문자열이 존재 여부</h3>
	<h4>No가 존재하는지? ${fn:contains(string1, "No") }</h4>
	<h4>no가 존재하는지? ${fn:contains(string1, "no") }</h4>
	
	<h3>대소문자 구분없이 확인</h3>
	<c:if test="${fn:containsIgnoreCase(string1, 'no') }" >
		<h4>no라는 단어가 존재한다</h4>
	</c:if>
	
	<h3>특정 문자열로 시작, 끝나는지</h3>
	<h4>No로 시작하는지? ${fn:startsWith(string1, "No") }</h4>
	<h4>gain.로 끝나는지? ${fn:endsWith(string1, "gain.") }</h4>
	
	<c:set var="string2" value="I love chicken" />
	
	<h3>문자열 치환</h3>
	<h4>${fn:replace(string2, "chicken", "bread") }</h4>
	<h4>${string2 }</h4>
	
	<h3>문자열 쪼개기</h3>
	<h4>${fn:split(string2, " ")[0] }, ${fn:split(string2, " ")[1] }</h4>
	
	<h3>문자열 자르기</h3>
	<h4>${fn:substring(string2, 2, 6) }</h4>
	
	<c:set var="string3" value="     hello     " />
	<h3>앞뒤 공백 자르기</h3>
	<h4>${string3 }</h4><%--일반태그에서 앞뒤 공백 있어도 안 나옴 --%>
	<pre>${string3 }</pre> <%--pre태그에서 앞뒤 공백 있으면 그대로 보여줌 --%>
	<pre>${fn:trim(string3) }</pre>
	
	
	
</body>
</html>