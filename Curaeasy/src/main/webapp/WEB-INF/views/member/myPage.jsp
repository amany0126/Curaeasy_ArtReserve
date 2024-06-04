<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
	<<!-- h1>마이페이지</h1> -->
	<div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>마이페이지</h2>
            <br>

            <form action="update.me" method="post">
                <div class="form-group">
                    <label for="userId">* 아이디 : </label>
                    <input type="text" class="form-control" id="userId" value="${sessionScope.loginUser.memberId}" name="memberId" readonly> <br>

                    <label for="userName">* 이름 : </label>
                    <input type="text" class="form-control" id="userName" value="${sessionScope.loginUser.memberName}" name="memberName" required> <br>

                    <label for="email"> &nbsp; 이메일 : </label>
                    <input type="text" class="form-control" id="email" value="${sessionScope.loginUser.memberEmail}" name="memberEmail"> <br>

                   <!--  <label for="age"> &nbsp; Age : </label>
                    <input type="number" class="form-control" id="age" value="30" name=""> <br> -->

                    <label for="phone"> &nbsp; 전화번호 : </label>
                    <input type="tel" class="form-control" id="phone" value="${sessionScope.loginUser.memberPhone}" name="memberPhone"> <br>
                    
                     <label for="birthday"> &nbsp; 생년월일 : </label>
                    <input type="date" class="form-control" id="birthday" value="${sessionScope.loginUser.memberBirthday}" name="memberBirthday"> <br>
                    
                    <label for="address"> &nbsp; 주소 : </label>
                    <input type="text" class="form-control" id="address" value="${sessionScope.loginUser.memberAddress}" name="memberAddress"> <br>
                  <!--   
                    <label for=""> &nbsp; Gender : </label> &nbsp;&nbsp;
                    <input type="radio" id="Male" value="M" name="">
                    <label for="Male">남자</label> &nbsp;&nbsp;
                    <input type="radio" id="Female" value="F" name="">
                    <label for="Female">여자</label> &nbsp;&nbsp; -->
                    
                </div> 
                <br>
                <div class="btns" align="center">
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#PwdChange">비밀번호 변경하기</button>
                    <button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteForm">회원탈퇴</button>
                </div>
            </form>
        </div>
        <br><br>
        
    </div>
	<!-- 회원탈퇴 버튼 클릭 시 보여질 Modal -->
    <div class="modal fade" id="PwdChange">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">비밀번호 변경</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <form action="changePwd.me" method="post" id="updatePwd">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div align="center">

                        </div>
                        <br>
                        	<input type="hidden" name="memberId" value="${sessionScope.loginUser.memberId}">
                           
                            <label for="userPwd" class="mr-sm-2">기존비밀번호 : </label>
                            <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter Password" id="userPwd" name="memberPwd"> <br>
							<br>
                            <label for="checkPwd" class="mr-sm-2">기존비밀번호 확인 : </label>
                            <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter Password" id="checkPwd" name="ckPassword"> <br>
							<input type="hidden" id="okPwd1">
                           	<div id="checkResult1" style="font-size: 0.8em ;display: none;" ></div>
							<br>
                            <label for="NewPwd" class="mr-sm-2">새로운 비밀번호 : </label>
                            <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter Password" id="NewPwd" name="NewPwd"> <br>
                    		<input type="hidden" id="okPwd2">
                    		<div id="checkResult2" style="font-size: 0.8em ;display: none;" ></div>
							<br>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button type="submit" class="btn btn-danger" disabled>비밀번호 수정</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
	<script>
		$(function() {
			let $userPwdInput = $("#updatePwd input[id=userPwd]");
			let $checkPwdInput = $("#updatePwd input[id=checkPwd]");
			let $NewPwdInput = $("#updatePwd input[id=NewPwd]");
			
			/* console.log($checkPwdInput)
			console.log($NewPwdInput) */
			$userPwdInput.keyup(userPwd); 
			$checkPwdInput.keyup(checkPwd);
			$NewPwdInput.keyup(newPwd);
		});

		function userPwd() {
			let $userPwdInput = $("#updatePwd input[id=userPwd]");
			let userPwd = $userPwdInput.val();
			let $checkPwdInput = $("#updatePwd input[id=checkPwd]");
			let checkPwd = $checkPwdInput.val();
			let $okPwd1Input = $("#updatePwd input[id=okPwd1]");
			$okPwd1Input = $("#okPwd1").val();
			checkPwd = $checkPwdInput.val();
			
			if(userPwd!= null && userPwd !="" && checkPwd!= null && checkPwd !="" ){
				if(userPwd == checkPwd){
					  $("#checkResult1").text("비밀번호가 일치합니다").show().css("color","green");
		               $("#updatePwd input[id=okPwd1]").val("Y");
				}else{
		               $("#checkResult1").text("비밀번호가 일치하지 않습니다.").show().css("color","red");
		               $("#updatePwd input[id=okPwd1]").val("N");
				}
			}
			newPwd()
			}
		
		
		function checkPwd() {
			let $userPwdInput = $("#updatePwd input[id=userPwd]");
			let userPwd = $userPwdInput.val();
			let $checkPwdInput = $("#updatePwd input[id=checkPwd]");
			let checkPwd = $checkPwdInput.val();
			let $okPwd1Input = $("#updatePwd input[id=okPwd1]");
			$okPwd1Input = $("#okPwd1").val();
			checkPwd = $checkPwdInput.val();
			
			if(checkPwd!= null && checkPwd !="" ){
				if(userPwd == checkPwd){
					  $("#checkResult1").text("비밀번호가 일치합니다").show().css("color","green");
		               $("#updatePwd input[id=okPwd1]").val("Y");
		            
				}else{
		               $("#checkResult1").text("비밀번호가 일치하지 않습니다.").show().css("color","red");
		               $("#updatePwd input[id=okPwd1]").val("N");
				}
		               newPwd()
			}else{
	               $("#checkResult1").hide(); 
	               $("#updatePwd input[id=okPwd1]").val("N");
	               checkdSudmit();
				}
			newPwd()
			}
	
		function newPwd() {
			let $userPwdInput = $("#updatePwd input[id=userPwd]");
			let userPwd = $userPwdInput.val();
			let $NewPwdInput = $("#updatePwd input[id=NewPwd]");
			let NewPwd = $NewPwdInput.val();
			let $okPwd1Input = $("#updatePwd input[id=okPwd1]");
			
			/* console.log(userPwd) */
			
			let regExp4 = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])(?=.\S)[A-Za-z\d!@#$%^&*]{8,15}$/;
			
			if(NewPwd!= null && NewPwd !=""){
				 if(!regExp4.test(NewPwd)) {
					 //console.log($userPwdInput.val())
		               $("#checkResult2").text("유효한 비밀번호가 아닙니다. 다시 입력해주세요.").show().css("color","red");
		               $("#updatePwd input[id=okPwd2]").val("N");
		               valPwd()
				 }else if(regExp4.test(NewPwd) && NewPwd != userPwd){
		               $("#updatePwd input[id=okPwd2]").val("Y");
		               $("#checkResult2").text("사용가능한 비밀번호 입니다").show().css("color","green");
	         	}else if(NewPwd == userPwd){
		               $("#checkResult2").text("새로운 비밀번호는 기존 비밀번호와 일치 할수 없습니다.").show().css("color","red");
		               $("#updatePwd input[id=okPwd2]").val("N");
	         	}
			}else{
		               $("#checkResult2").hide(); 
		               $("#updatePwd input[id=okPwd2]").val("N");
		         }
				checkdSudmit();
			}
			
		function checkdSudmit() {
			let okPwd1 = $("#updatePwd input[id=okPwd1]");
			let okPwd1dval = okPwd1.val();
			let okPwd2 =$("#updatePwd input[id=okPwd2]");
			let okPwd2val =okPwd2.val();
			console.log(okPwd1dval)
			console.log(okPwd2val)
			/* console.log(okid.val());
			console.log(okPwd2.val());
			console.log(okemailval); */
			if(okPwd1dval == "Y" && okPwd2val == "Y"){
				$("#updatePwd button[type=submit]").attr("disabled",false)
			}else{
				$("#updatePwd button[type=submit]").attr("disabled",true)
			}
			
		}
	</script>
	
	
    <!-- 회원탈퇴 버튼 클릭 시 보여질 Modal -->
    <div class="modal fade" id="deleteForm">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">회원탈퇴</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <form action="delete.me" method="post">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div align="center">
			                            탈퇴 후 복구가 불가능합니다. <br>
			                            정말로 탈퇴 하시겠습니까? <br>
                        </div>
                        <br>
                        	<input type="hidden" name="memberId" value="${sessionScope.loginUser.memberId}">
                            <label for="userPwd" class="mr-sm-2">Password : </label>
                            <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter Password" id="userPwd" name="memberPwd"> <br>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button type="submit" class="btn btn-danger">탈퇴하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>