<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js">
    </script>
    <title>아이디/비밀번호 찾기</title>
    <style>
            .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }

    </style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
	<div class="innerOuter">
        <div align="center">
            <button id="buttonA" class="btn btn-info" onclick="showContent('findID')">아이디 찾기</button>
            <button id="buttonB" class="btn btn-info" onclick="showContent('findPwd')">비밀번호 찾기</button>
        </div>
        <br>
        <hr>
        <br>
        <div id="findID-area" align="center">
            <form id="findID-form" action="findId.me" method="post">
            
            <div style="border: 1px solid white; width: 300px; background-position : center " align="left">
			<!-- Modal body -->
				<h2>아이디 찾기</h2> <br>
				<label for="memberName" class="mr-sm-2">이름 : </label>
				<input type="text" class="form-control mb-2 mr-sm-2" placeholder="아이디" 
				id="memberName" name=memberName value="" required="required"> 
				<label for="memberPhone" class="mr-sm-2">전화번호 : </label>
				<input type="text" class="form-control mb-2 mr-sm-2" placeholder="- 없이 입력바랍니다." 
				id="memberPhone" name=memberPhone value="" required="required">
				<label for="memberEmail" class="mr-sm-2">이메일 : </label>
				<input type="email" class="form-control mb-2 mr-sm-2" placeholder="회원가입시 입력한 이메일 기입" 
				id="memberEmail" name=memberEmail value="" required="required">
					
			</div>

			<!-- Modal footer -->
			<div align="center">
				<br>
				<button type="submit" class="btn btn-primary">아이디 찾기</button>
			</div>
            </form>
        </div>
    
    <div id="findPwd-area"  align="center">
        <form id="findPwd-form" action="findPwd.me" method="post" > <!-- 이 부분은 나중에 post 방식으로 바꿀 것!! -->
             <div style="border: 1px solid white; width: 300px; background-position : center " align="left">
                
                <h2>비밀번호 찾기</h2> <br>
                <label for="memberId" class="mr-sm-2">아이디 : </label>
				<input type="text" class="form-control mb-2 mr-sm-2" placeholder="아이디 " 
				id="memberId" name=memberId value="" required="required"> 
                <label for="memberName" class="mr-sm-2">이름 : </label>
				<input type="text" class="form-control mb-2 mr-sm-2" placeholder="이름" 
				id="memberName" name=memberName value="" required="required"> 
				<label for="memberPhone" class="mr-sm-2">전화번호 : </label>
				<input type="text" class="form-control mb-2 mr-sm-2" placeholder="- 없이 입력바랍니다." 
				id="memberPhone" name=memberPhone value="" required="required">
				<label for="memberEmail" class="mr-sm-2">이메일 : </label>
				<input type="email" class="form-control mb-2 mr-sm-2" placeholder="회원가입시 입력한 이메일 기입" 
				id="memberEmail" name=memberEmail value="" required="required">
				
				
				<div align="center">
				<br>
				<button type="submit" class="btn btn-primary">임시 비밀번호 발급</button>
				</div>
            </div>
            </form>
    </div>
    </div>
    <script>
        window.addEventListener('DOMContentLoaded', function() {
            showContent('findID');
            });
    
            function showContent(content) {
            var findID_area = document.getElementById("findID-area");
            var findPwd_area = document.getElementById("findPwd-area");
    
            // 내용 숨김
            findID_area.style.display = "none";
            findPwd_area.style.display = "none";
    
            // 선택한 내용 보이기
            if (content === "findID") {
                findID_area.style.display = "block";
            } else if (content === "findPwd") {
                findPwd_area.style.display = "block";
            }
            }
    </script>
     <jsp:include page="../common/footer.jsp" />
</body>
</html>