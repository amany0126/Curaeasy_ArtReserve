<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    <!-- 온라인 방식 -->

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
    
<!--     <div align="center">
        <button id="buttonA" class="btn btn-secondary btn-lg" onclick="showContent('login')">로그인</button>
        <button id="buttonB" class="btn btn-secondary btn-lg" onclick="showContent('membership')">회원가입</button>
    </div> -->
    <div class="content">
        <br><br>
        <div class="innerOuter"> 
    <div id="login-area" align="center">
        <h2>로그인</h2>   
        <form action="login.me" method="post">
            <div style="border: 1px solid white; width: 300px; background-position : center " align="left">
               
					<!-- Modal body -->
			
						<label for="userId" class="mr-sm-2">ID : </label>
						<!--  
                        	EL 구문을 통해 쿠키값을 손쉽게 얻어올 수 있다
                        	[ 표현법 ]
                        	cookie.키값.value
                        -->
						<input type="text" class="form-control mb-2 mr-sm-2"
							placeholder="Enter ID" id="userId" name=memberId
							value="${cookie.saveId.value}" required="required"> <br>
						<label for="userPwd" class="mr-sm-2">Password : </label> <input
							type="password" class="form-control mb-2 mr-sm-2"
							placeholder="Enter Password" id="userPwd" name="memberPwd"
							required="required"> <br>
						<c:choose>
							<c:when test="${not empty cookie.saveId}">
								<!-- 만약 saveId 라는 쿠키가 있다면 : 체크박스가 체크 되겠끔  -->
								<input type="checkbox" id="saveId" name="saveId" value="y"
									checked>
								<label for="saveId">아이디 저장</label>
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="saveId" name="saveId" value="y">
								<label for="saveId">아이디 저장</label>
							</c:otherwise>
						</c:choose>
					</div>

					<!-- Modal footer -->
					<div align="center">
						<button type="submit" class="btn btn-primary" >로그인</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div>
					<br>
					<div align="center">
						<!-- <a href="비밀번호찾기.html" class="signup-link" style="color: black;">비밀번호 찾기&nbsp;</a>  | -->
                        <a href="findIdPwd.me"  class="signup-link" style="color: black;">&nbsp;아이디 찾기&nbsp; | &nbsp;비밀번호 찾기&nbsp;</a> 
					</div>

        </form>
	</div>
</div>
</div>
<!-- <div id="join-membership">
    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>회원가입</h2>
            <br>
        <form action="insert.me" method="post" id="enrollForm" onsubmit="return validate();" > 이 부분은 나중에 post 방식으로 바꿀 것!!

                    <div class="form-group">
                        <label for="userId">* 아이디 : </label>
                        <input type="text" class="form-control" id="userId" placeholder="사용하실 아이디를 입력하세요" name="memberId" required> <br>
                        <input type="hidden" id="okid">
                        <div id="checkResult1" style="font-size: 0.8em ;display: none;" >
                        </div>
                        <br>
                        <label for="userPwd">* 비밀번호 : </label>
                        <input type="password" class="form-control" id="userPwd" placeholder="*영문, 숫자, 특수문자(@,#,$,%,^,&,*) 포함 8~15글자" name="memberPwd" required> <br>
                        <input type="hidden" id="okPwd1">
                        <div id="checkResult2" style="font-size: 0.8em ;display: none;" >
                        </div>
                        <label for="checkPwd">* 비밀번호 확인 : </label>
                        <input type="password" class="form-control" id="checkPwd" placeholder="입력하신 비밀번호를 한번더 입력해주세요" required> <br>
                        <input type="hidden" id="okPwd2">
                        <div id="checkResult3" style="font-size: 0.8em ;display: none;" >
                        </div>
                        
                        
                        <label for="userName">* 이름 : </label>
                        <input type="text" class="form-control" id="userName" placeholder="이름을 입력해주세요" name="memberName" required> <br>
                        <input type="hidden" id="okemail">
    
                        <label for="email"> &nbsp; 이메일 : </label> <br>
                        <div>
                        <input type="text" class="form-control" id="email" placeholder="이메일 주소를 입력해주세요" name="memberEmail" style="display:inline; width: 37vw;">
                        <button type="button" onclick="certEmail();" id="cert" class="btn btn-light" style="display: inline; width: 120px; border-color: black;">이메일 인증</button>
                        </div>
                        <br><br>
                        
                        <div id="emailcheck" style="display: none;">
                        인증번호 :  <br>
                        <input type="text" id="certNo"  class="form-control" style="display:inline; width: 15vw;" >
                        <button type="button" id="reCert" onclick="reCertMail();" disabled class="btn btn-light" style="display: inline; width: 150px; border-color: black;">인증번호 재인증</button>
                        <button type="button" id="validate" onclick="validateMail();" disabled class="btn btn-light" style="display: inline; width: 130px; border-color: black;">인증번호 인증</button>
                        <p id="checkTime"></p>
                        <br><br>
                        </div>
                        <div id="emailOk"  style="display: none;">인증완료되었습니다! <br></div>
                        
                        <label for="phone"> &nbsp; 전화번호 : </label>
                        <input type="text" class="form-control" id="phone" placeholder="휴대폰 번호 입력(- 없이)" name="memberPhone"> <br>		
    
                        <label for="birthday"> &nbsp; 생년월일 : </label>
                        <input type="date" class="form-control" id="birthday" placeholder="생년월일을 입력해주세요" name="memberBirthday"> <br>
    
                        
                        <label for="address"> &nbsp; 주소 : </label>
                        <input type="text" class="form-control" id="address" placeholder="실거주지를 입력해주세요" name="memberAddress"> <br>
                        
           
                    </div> 
                    <br>
                    <div class="btns" align="center">
                        <button type="submit" class="btn btn-primary" disabled="disabled" >회원가입</button>
                        <button type="reset" class="btn btn-danger">초기화</button>
                    </div>
                </form>
            </div>  
        </div>
    </div> -->
<!-- <script>
    window.addEventListener('DOMContentLoaded', function() {
        showContent('login');
        });

        function showContent(content) {
        var login_area = document.getElementById("login-area");
        var join_membership = document.getElementById("join-membership");

        // 내용 숨김
        login_area.style.display = "none";
        join_membership.style.display = "none";

        // 선택한 내용 보이기
        if (content === "login") {
            login_area.style.display = "block";
        } else if (content === "membership") {
            join_membership.style.display = "block";
        }
        }
    </script> -->
    <!-- <script>
        $(function() {
            // 아이디를 입력하는 input 요소 객체 변수에 담아두기
            const $idInput = $("#enrollForm input[id=userId]")
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
                            $("#enrollForm input[id=okid]").val("N");
                            $("#checkResult1").text("이미 사용중이거나 탈퇴한 회원의 아이디 입니다. 다시 입력해주세요").show().css("color","red");
                            checkdSudmit();
                            }else{
                            $("#enrollForm input[id=okid]").val("Y");
                            $("#checkResult1").text("사용 가능한 아이디입니다").show().css("color","green");
                            checkdSudmit();
                            }
                        },
                        error : function() {
                            console.log("ajax 통신 실패");
                        }
                    
                        });
                    
                }else {
                    // 5글자 미만일 때
                    $("#checkResult").hide(); 
                    $("#enrollForm input[id=okid]").val("N");
                    $("#enrollForm button[type=submit]").attr("disabled",true)
                }
            });
        });
        
        $(function() {
            let $userPwdInput = $("#enrollForm input[id=userPwd]");
            let $checkPwdInput = $("#enrollForm input[id=checkPwd]");
            $userPwdInput.keyup(ckeckPwd);
            $checkPwdInput.keyup(valPwd);
        });
    </script>
    
    <script>
    function ckeckPwd() {
        
        
        let $userPwdInput = $("#enrollForm input[id=userPwd]");
        let userPwd = $userPwdInput.val();
        let $checkPwdInput = $("#enrollForm input[id=checkPwd]");
        let checkPwd = $checkPwdInput.val();
        let $okPwd1Input = $("#enrollForm input[id=okPwd1]");
        
        let regExp4 = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@#$%^&*])(?=.\S)[A-Za-z\d@#$%^&*]{8,15}$/;
        
        
        userPwd = $userPwdInput.val();
        
        if(userPwd!= null && userPwd !=""){
             if(!regExp4.test(userPwd)) {
                 //console.log($userPwdInput.val())
                   $("#checkResult2").text("유효한 비밀번호가 아닙니다. 다시 입력해주세요.").show().css("color","red");
                   $("#enrollForm input[id=okPwd1]").val("N");
                   checkdSudmit();
                   valPwd()
             }else if(regExp4.test(userPwd)){
                   $("#enrollForm input[id=okPwd1]").val("Y");
                   $("#checkResult2").text("사용가능한 비밀번호 입니다").show().css("color","green");
                   checkdSudmit();
                   valPwd()
                  
         }
        }else{
                   $("#checkResult2").hide(); 
                   $("#enrollForm input[id=okPwd1]").val("N");
                   checkdSudmit();
                   valPwd()
             }
             ;
        
    }
    
    function valPwd() {
        
        
        let $userPwdInput = $("#enrollForm input[id=userPwd]");
        let userPwd = $userPwdInput.val();
        let $checkPwdInput = $("#enrollForm input[id=checkPwd]");
        let checkPwd = $checkPwdInput.val();
        let $okPwd1Input = $("#enrollForm input[id=okPwd1]");
        
        let regExp4 = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@#$%^&*])(?=.\S)[A-Za-z\d@#$%^&*]{8,15}$/;
        
        $okPwd1Input = $("#okPwd1").val();
        checkPwd = $checkPwdInput.val();
        if(checkPwd!= null && checkPwd !="" ){
        if($okPwd1Input == "Y"){
             if(!regExp4.test(checkPwd)) {
                   $("#checkResult3").text("비밀번호가 일치하지 않습니다.").show().css("color","red");
                   $("#enrollForm input[id=okPwd2]").val("N");
                   checkdSudmit();
             }else if(regExp4.test(checkPwd)){
                   $("#checkResult3").text("비밀번호가 일치합니다").show().css("color","green");
                   $("#enrollForm input[id=okPwd2]").val("Y");
                   checkdSudmit();
                   
             }else{
                   $("#checkResult3").hide(); 
                   $("#enrollForm input[id=okPwd2]").val("N");
                   checkdSudmit();
                   
             }
        }else{
           $("#checkResult3").text("먼저 입력하신 비밀번호가 유효한 비밀번호가 아닙니다.").show().css("color","red");
           $("#enrollForm input[id=okPwd2]").val("N");
           checkdSudmit();
        }
        }else{
               $("#checkResult3").hide(); 
               $("#enrollForm input[id=okPwd2]").val("N");
               checkdSudmit();
            }
        }
    
    function certEmail() {
        // ajax 요청 보내기 
        // console.log("certEmail");
        $.ajax({
            url : "cert.do",
            type : "post",
            data : {
                email : $("#email").val() 
                    },
                    success : function(result) {
                        alert(result);
                        // 인증번호 발급 후 인증 관련 요소 활성화
                        $("#checkNo").attr("disabled",true);
                        $("#validate").attr("disabled",false);
                        $("#reCert").attr("disabled",false);
                        // 이메일 인증번호 보내가 관련 요소들 비활성화
                        $("#email").attr("readonly",true);
                        $("#cert").attr("disabled",true);
                        alert("1분 이내로 인증 부탁드립니다.");
                        $("#emailcheck").show()
                        fncCountDown();
                    },
                    error : function() {
                        console.log("인증번호 발급용 ajax 통신 실패!");
                    }
            
        });
        
    }
    function reCertMail() {
        /* console.log("reCertMail"); */
        // ajax 요청 보내기 
        $.ajax({
            url : "reCert.do",
            type : "post",
            data : {
                email : $("#email").val() 
                    },
                    success : function(result) {
                        alert(result);
                        // 인증번호 발급 후 인증 관련 요소 활성화
                        $("#checkNo").attr("disabled",false);
                        $("#validate").attr("disabled",false);
                        $("#reCert").attr("disabled",false);
                        // 이메일 인증번호 보내가 관련 요소들 비활성화
                        $("#email").attr("readonly",true);
                        $("#cert").attr("disabled",true);
                        alert("1분 이내로 인증 부탁드립니다.");
                        $("#emailcheck").show()
                        fncCountDown();
                    },
                    error : function() {
                        console.log("인증번호 발급용 ajax 통신 실패!");
                    }
            
        });
        
    }
    
    
    
    
    var time = 60;
    var min = 0;
     var sec = 0;
     var runCount;
    function fncCountDown() {
          if ( time > 0 ) {
               runCount = setInterval(startCountDown,1000);
          }
    }
     function startCountDown() {
    
         min = Math.floor(time/60);
         sec = time%60;
         $("#checkTime").text("인증시간 : " + min + " : " + sec);
        if ( parseInt(time) == 0 ) {  
              stopCountDown();  
        }else{   
        time--;  
        }
     }
      function stopCountDown() {  
        
        clearInterval(runCount); 
        $("#checkNo").attr("readonly",true);
        $("#validate").attr("disabled",true);
        $("#reCert").attr("disabled",true);
        $("#checkTime").text("인증시간 : 인증시간이 만료되었습니다. 재인증 부탁드립니다");
        checkdSudmit();
    }
    </script>
    <script>
    
    function validateMail() {
        /* console.log("validateMail"); */
        // ajax 요청 보내기 
        $.ajax({
            url : "validate.do",
            type : "post",
            data : {
                    email : $("#email").val() ,
                    certNo : $("#certNo").val() 
                },
                success : function(result) {
                    // 인증 실패시
                    // 다시 이메일 인증 번호를 받을 수 있게끔 이메일 관련 요소들 활성화
                    if(result == "인증실패"){
                        alert("인증번호 재입력 또는 인증번호 재발급 부탁드립니다.");
                         checkdSudmit();
                    }else{
                        alert(result);
                        // 인증번호 대조 성공 후 인증 관련 요소 비활성화
                        $("#checkNo").attr("readonly",true);
                        $("#validate").attr("disabled",true);
                        $("#reCert").attr("disabled",true);
                        alert("인증에 성공하셨습니다.");
                        $("#enrollForm input[id=okemail]").val("Y");
                        $("#emailOk").show()
                        clearInterval(runCount); 
                        checkdSudmit();
                    }
                },
                error : function() {
                    console.log("인증번호 대조용 ajax 통신 실패!");
                }
        });		
    };
    function checkdSudmit() {
        let okid = $("#enrollForm input[id=okid]");
        let okidval = okid.val();
        let okPwd2 =$("#enrollForm input[id=okPwd2]");
        let okPwd2val =okPwd2.val();
        let okemail =$("#enrollForm input[id=okemail]");
        let okemailval =okemail.val();
        /* console.log(okid.val());
        console.log(okPwd2.val());
        console.log(okemailval); */
        if(okidval == "Y" && okPwd2val == "Y" && okemailval =="Y" ){
            $("#enrollForm button[type=submit]").attr("disabled",false)
        }else{
            $("#enrollForm button[type=submit]").attr("disabled",true)
        }
    }
    </script> -->
       <jsp:include page="../common/footer.jsp" />
</body>
</html>