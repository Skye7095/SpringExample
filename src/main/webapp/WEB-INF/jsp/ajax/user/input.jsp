<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax user 입력 페이지</title>

<script
  src="https://code.jquery.com/jquery-3.6.3.js"
  integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
  crossorigin="anonymous"></script>
  
</head>
<body>
	
	
	<!--  <form method="get" action="/ajax/user/add" id="saveForm">  -->
		<label>이름</label><input type="text" name="name" id="nameInput"><br>
		<label>생년월일</label><input type="text" name="yyyymmdd" id="yyyymmddInput"><br>
		<label>이메일</label><input type="text" name="email" id="emailInput">
		<button type="button" id="duplicateBtn">중복확인</button><br>
		<button type="submit" id="saveBtn">저장</button>
	<!--  </form>  -->
	
	<script>
		$(document).ready(function(){
			
			var isChecked = false;
			
			$("#duplicateBtn").on("click", function(){
				let email = $("#emailInput").val();
				
				if(email == ""){
					alert("이메일을 입력하세요");
					return;
				}
				
				
				
				$.ajax({
					type:"get"
					, url:"/ajax/user/is_duplicate"
					, data:{"email":email}
					, success:function(data){
						
						// 중복체크 여부 상태 저장
						isChecked = true;
						
						if(data.is_duplicate){
							alert("중복된 이메일입니다");
						}else{
							alert("사용 가능한 이메일입니다");
						}
					}
					, error:function(){
						alert("이메일 중복여부 확인 불가!");
					}
				});
			});
			
			$("#saveBtn").on("click", function(){
				let name = $("#nameInput").val();
				let yyyymmdd = $("#yyyymmddInput").val();
				let email = $("#emailInput").val();
				
				if(name == ""){
					alert("이름을 입력하세요");
					return;
				}
				if(yyyymmdd == ""){
					alert("생년월일을 입력하세요");
					return;
				}
				if(email == ""){
					alert("이메일을 입력하세요");
					return;
				}
				if(!isChecked){
					// 체크하지 않은 상태
					alert("중복여부 체크를 해주세요");
					return;
				}
				
				$.ajax({
					// request 옵션들
					type:"get"
					, url:"/ajax/user/add"
					, data:{"name":name, "yyyymmdd":yyyymmdd, "email":email}
					// response 옵션
					, success:function(data){
						// {"result":"succes"}{"result":"fail"}
						if(data.result == "success"){
							// 리스트 페이로 이동
							location.href="/ajax/user/list";
						}else{
							alert("저장 실패");
						}
					}
					, error:function(){
						alert("저장 에러!")
					}
				});
			});
			
			/*
			$("#saveForm").on("submit", function(){
				let name = $("#nameInput").val();
			
				if(name == ""){
					alert("이름을 입력하세요");
					return false;
				}
			});
			*/
			
		});
		
	
	</script>
	
</body>
</html>