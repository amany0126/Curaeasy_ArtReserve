<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <style>
        .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
    </style>
</head>
</head>
<body>
    
    <!-- 메뉴바 -->

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>회원가입</h2>
            <br>

            <form action="insert.me" method="post" id="enrollForm">
                <div class="form-group">
                    <label for="userId">* 아이디 : </label>
                    <input type="text" class="form-control" id="userId" placeholder="사용하실 아이디를 입력하세요" name="userId" required> <br>
					<div id="checkResult" style="font-size: 0.8em ;display: none;" ></div>
					<br>
                    <label for="userPwd">* 비밀번호 : </label>
                    <input type="password" class="form-control" id="userPwd" placeholder="영어와 숫자로 10자 이내로 압력해주세요" name="userPwd" required> <br>

                    <label for="checkPwd">* 비밀번호 확인 : </label>
                    <input type="password" class="form-control" id="checkPwd" placeholder="입력하신 비밀번호를 한번더 입력해주세요" required> <br>

                    <label for="userName">* 이름 : </label>
                    <input type="text" class="form-control" id="userName" placeholder="이름을 입력해주세요" name="userName" required> <br>

                    <label for="email"> &nbsp; 이메일 : </label>
                    <input type="text" class="form-control" id="email" placeholder="인증용 이메일 주소를 입력해주세요" name="email"> <br>
					<button onclick="cert();" id="cert">이메일 인증</button>
					<br><br>
					인증번호 : <input type="text" id="checkNo" disabled >
					<button id="validate" onclick="validate();" disabled>인증번호 인증</button>
								
					<br>
                    <label for="birthday"> &nbsp; 생년월일 : </label>
                    <input type="number" class="form-control" id="birthday" placeholder="생년월일을 입력해주세요" name="birthday"> <br>

                    
                    <label for="address"> &nbsp; Address : </label>
                    <input type="text" class="form-control" id="address" placeholder="Please Enter Address" name="address"> <br>
                    
       
                </div> 
                <br>
                <div class="btns" align="center">
                    <button type="submit" class="btn btn-primary" disabled="disabled" >회원가입</button>
                    <button type="reset" class="btn btn-danger">초기화</button>
                </div>
            </form>
        </div>
        <br><br>
		<script>
			$(function() {
				// 아이디를 입력하는 input 요소 객체 변수에 담아두기
				const $idInput = $("#enrollForm input[name=userId]")
				// 아이디를 입력할때마다 실시간으로 아이디 중복 체크
				// "keyup" 이벤트 활용
				$idInput.keyup(function() {
					// console.log($idInput.val());
					// > 사용자가 실시간으로 입력한 아이디값을 중복체크 시 요청값으로 넘김
					// 우선 , 아이디값이 최소 5글자 이상으로 입력되었을 때에만
					// ajax 를 요청해서 중복체크 하기!!
					// (유료 DB 제품은 실행하는 쿼리문의 갯수가 몇개냐에 따라 요금제가 지정됨)
					if($idInput.val().length >=5 ){
						// 5글자 이상일때
						// ajxa 로 아이디 중복확인 요청보내기
						$.ajax({
							url : "idCheck.me",
							type : "get",
							data : {
								checkId : $idInput.val()
							},
							success : function(result) {
								if(result == "NNNNN"){
								$("#checkResult").text("이미 사용중이거나 탈퇴한 회원의 아이디 입니다. 다시 입력해주세요").show().css("color","red");
								$("#enrollForm button[type=submit]").attr("disabled",true)
								}else{
								$("#checkResult").text("사용 가능한 아이디입니다").show().css("color","green");
								$("#enrollForm button[type=submit]").attr("disabled",false)
								}
							},
							error : function() {
								console.log("ajax 통신 실패");
							}
						
							});
						
					}else {
						// 5글자 미만일 때
						$("#checkResult").hide(); 
						$("#enrollForm button[type=submit]").attr("disabled",true)
					}
				});
			});
		</script>
    </div>

    <!-- 푸터바 -->

</body>
</html>