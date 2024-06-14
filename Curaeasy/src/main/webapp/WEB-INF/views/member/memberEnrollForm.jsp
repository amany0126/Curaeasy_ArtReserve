<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>curaeasy</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
      /*   .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        } */
        .innerOuter {
            border:0px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
			margin-top: 5px;
        }
    </style>
</head>
</head>
<body>
<jsp:include page="../common/header.jsp" />
    <!-- 회원가입 -->
    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>회원가입</h2>
            <br>

            <form action="insert.me" method="post" id="enrollForm">
                <div class="form-group">
                    <label for="userId">* 아이디 : </label>
                    <input type="text" class="form-control" id="userId" placeholder="영문소문자, 숫자 포함  5~15 글자 " name="memberId" required> <br>
					<input type="hidden" id="okid">
					<div id="checkResult1" style="font-size: 0.8em ;display: none;" ></div>
                    <label for="userPwd">* 비밀번호 : </label>
                    <input type="password" class="form-control" id="userPwd" placeholder="*영문, 숫자, 특수문자(!,@,#,$,%,^,&,*) 포함 8~15글자" name="memberPwd" required> <br>
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

                    <label for="email"> &nbsp;* 이메일 : </label> 
                    <div>
                    <input type="email" class="form-control" id="email" placeholder="이메일 주소를 입력해주세요" name="memberEmail" style="display:inline; width: 49.7vw;">
					<button type="button" onclick="certEmail();" id="cert" class="btn btn-light" style="display: inline; width: 9vw; border-color: black; border: 1px solid black; margin-bottom: 5px;" disabled>이메일 인증</button>
					<div id="emailDuplicates" style="display: none;"></div>
					</div>
					<div id="emailcheck" style="display: none;">
					인증번호 :  <br>
					<input type="text" id="certNo"  class="form-control" style="display:inline; width: 15vw;" >
					<button type="button" id="reCert" onclick="reCertMail();" disabled class="btn btn-light" style="display: inline; width: 150px; border-color: black;">인증번호 재인증</button>
					<button type="button" id="validate" onclick="validateMail();" disabled class="btn btn-light" style="display: inline; width: 130px; border-color: black;">인증번호 인증</button>
					<p id="checkTime"></p>
					
					</div>
					<div id="emailOk"  style="display: none;">인증완료되었습니다! <br></div>
					<br>
					<label for="phone"> &nbsp;* 전화번호 : </label>
                    <input type="text" class="form-control" id="phone" placeholder="휴대폰 번호 입력(- 없이)" name="memberPhone" required> <br>		

                    <label for="birthday"> &nbsp;* 생년월일 : </label>
                    <input type="date" class="form-control" id="birthday" placeholder="생년월일을 입력해주세요" name="memberBirthday" required> <br>

                    
                    <label for="post-btn"> &nbsp;* 주소 : </label> <br>
                    <input type="hidden" id="sample6_postcode" name="deliveryZipcode" class="form-control" placeholder="&nbsp;&nbsp;우편번호" readonly required style="width: 21vw; display: inline;">
					<input type="text" id="address1" name="address1" class="form-control" placeholder="&nbsp;&nbsp;주소" readonly required style="width: 49.7vw;  display: inline;">
					<input type="button" id="post-btn" class="btn  btn-light" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="width:9vw; border: 1px solid black; margin-bottom: 5px" ><br>
					<input type="text" id="address2" name="address2" class="form-control" placeholder="상세주소" required>
					<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
                   <!--  <input type="text" class="form-control" id="address" placeholder="실거주지를 입력해주세요" name="memberAddress" required> <br> -->
                    
       
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
				let $userIdInput = $("#enrollForm input[id=userId]");
				let $userPwdInput = $("#enrollForm input[id=userPwd]");
				let $checkPwdInput = $("#enrollForm input[id=checkPwd]");
				let $checkEmailInput = $("#enrollForm input[id=email]");
				$userIdInput.keyup(checkId); 
				$userPwdInput.keyup(ckeckPwd); // 1차
				$checkPwdInput.keyup(valPwd); // 중복
				$checkEmailInput.keyup(checkEmail); // 중복
			});
			function checkId() {
				const $idInput = $("#enrollForm input[id=userId]")
					// console.log($idInput.val());
					// > 사용자가 실시간으로 입력한 아이디값을 중복체크 시 요청값으로 넘김
					// 우선 , 아이디값이 최소 5글자 이상으로 입력되었을 때에만
					// ajax 를 요청해서 중복체크 하기!!
					// (유료 DB 제품은 실행하는 쿼리문의 갯수가 몇개냐에 따라 요금제가 지정됨)
						let checkId =  $idInput.val();
						console.log(checkId);
					if(checkId.length >=5 ){
						// 5글자 이상일때
						// ajxa 로 아이디 중복확인 요청보내기
						let regExp =/^[a-z0-9]{5,15}$/;
						$.ajax({
							url : "idCheck.me",
							type : "get",
							data : {
								checkId : $idInput.val()
							},
							success : function(result) {
								if(result == "NNNNN" && regExp.test(checkId)){
								$("#enrollForm input[id=okid]").val("N");
								$("#checkResult1").text("이미 사용중이거나 탈퇴한 회원의 아이디 입니다. 다시 입력해주세요").show().css("color","red");
								checkdSudmit();
								}else if(result == "NNNNY" && regExp.test(checkId)){
								$("#enrollForm input[id=okid]").val("Y");
								$("#checkResult1").text("사용 가능한 아이디입니다").show().css("color","green");
								checkdSudmit();
								}else if(result == "NNNNY" &&!regExp.test(checkId)){
								$("#enrollForm input[id=okid]").val("N");
								$("#checkResult1").text("유효한 아이디가 아닙니다. 다시 입력해주세요.").show().css("color","red");
								checkdSudmit();
								}
								
							},
							error : function() {
								console.log("ajax 통신 실패");
							}
						
							});
						
					}else {
						// 5글자 미만일 때
						$("#checkResult1").hide(); 
						$("#enrollForm input[id=okid]").val("N");
						$("#enrollForm button[type=submit]").attr("disabled",true)
					}
				}
			
		</script>
		
		<script>
		function ckeckPwd() {
			
			
			let $userPwdInput = $("#enrollForm input[id=userPwd]");
			let userPwd = $userPwdInput.val();
			let $checkPwdInput = $("#enrollForm input[id=checkPwd]");
			let checkPwd = $checkPwdInput.val();
			let $okPwd1Input = $("#enrollForm input[id=okPwd1]");
			
			let regExp4 = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])(?=.\S)[A-Za-z\d!@#$%^&*]{8,15}$/;
			
			
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
			
			let regExp4 = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])(?=.\S)[A-Za-z\d!@#$%^&*]{8,15}$/;
			
			$okPwd1Input = $("#okPwd1").val();
			checkPwd = $checkPwdInput.val();
			if(checkPwd!= null && checkPwd !="" ){
			if($okPwd1Input == "Y" ){
				 if(!regExp4.test(checkPwd) && userPwd != checkPwd) {
		               $("#checkResult3").text("비밀번호가 일치하지 않습니다.").show().css("color","red");
		               $("#enrollForm input[id=okPwd2]").val("N");
		               checkdSudmit();
		               ckeckPwd()
		         }else if(regExp4.test(checkPwd)&& userPwd == checkPwd){
		               $("#checkResult3").text("비밀번호가 일치합니다").show().css("color","green");
		               $("#enrollForm input[id=okPwd2]").val("Y");
		               checkdSudmit();
		               ckeckPwd()
		         }else if(checkPwd == ""){
		               $("#checkResult3").hide(); 
		               $("#enrollForm input[id=okPwd2]").val("N");
		               checkdSudmit();
		               ckeckPwd()
		         }
			}else{
               $("#checkResult3").text("먼저 입력하신 비밀번호와 일치하지 않습니다.").show().css("color","red");
               $("#enrollForm input[id=okPwd2]").val("N");
               checkdSudmit();
			}
			}else{
	               $("#checkResult3").hide(); 
	               $("#enrollForm input[id=okPwd2]").val("N");
	               checkdSudmit();
				}
			}
		
		function checkEmail() {
			let $checkEmailInput = $("#enrollForm input[id=email]");
			let userEmail = $checkEmailInput.val();
			/* console.log(userEmail) */
			const pattern = /^[a-z0-9]+@[a-z]+\.[a-z]{2,3}/;
			if(checkPwd!= null && checkPwd !="" && pattern.test(userEmail)){
					$.ajax({
						url : "emailDl.me",
						type : "post",
						data : {email : $("#email").val() },
						success : function(result) {
							if(result == "NNNNN"){
								
								$("#emailDuplicates").text("이미 사용중이거나 탈퇴한 회원의 이메일입니다. 다시 입력해주세요").show().css("color","red");
								$("#cert").attr("disabled",true);
								}else if(result == "NNNNY"){
								
								$("#emailDuplicates").text("사용 가능한 이메일입니다").show().css("color","green");
								$("#cert").attr("disabled",false);
								}
						},
						error : function() {
							console.log("인증번호 발급용 ajax 통신 실패!");
						}
						
					});					
				}else{
				$("#cert").attr("disabled",true);
				$("#emailDuplicates").hide(); 
				
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
							// alert(result);
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
							// alert(result);
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
		
		
		var time = 0;
		var min = 0;
		 var sec = 0;
		 var runCount;
		
		function fncCountDown() {
			time = 60;
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
			$("#cert").attr("disabled",false);
			checkdSudmit();
		}
		  function CountDown0() {  
				
				clearInterval(runCount); 
				$("#checkNo").attr("readonly",true);
				$("#validate").attr("disabled",true);
				$("#reCert").attr("disabled",true);
				$("#checkTime").text("");
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
						}else {
							// alert(result);
							// 인증번호 대조 성공 후 인증 관련 요소 비활성화
							$("#checkNo").attr("readonly",true);
							$("#checkNo").attr("disabled",true);
							$("#validate").attr("disabled",true);
							$("#reCert").attr("disabled",true);
							$("#cert").attr("disabled",true);
							alert("인증에 성공하셨습니다.");
							$("#enrollForm input[id=okemail]").val("Y");
							$("#emailOk").show()
							$("#checkTime").hide(); 
							CountDown0()
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
		</script>
	<script>
			// 다음 주소 api
			    function sample6_execDaumPostcode() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                var addr = ''; // 주소 변수
			                var extraAddr = ''; // 참고항목 변수
			
			                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                    addr = data.roadAddress;
			                } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                    addr = data.jibunAddress;
			                }
			
			                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			                if(data.userSelectedType === 'R'){
			                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                        extraAddr += data.bname;
			                    }
			                    // 건물명이 있고, 공동주택일 경우 추가한다.
			                    if(data.buildingName !== '' && data.apartment === 'Y'){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                    if(extraAddr !== ''){
			                        extraAddr = ' (' + extraAddr + ')';
			                    }
			                    // 조합된 참고항목을 해당 필드에 넣는다.
			                    document.getElementById("sample6_extraAddress").value = extraAddr;
			                
			                } else {
			                    document.getElementById("sample6_extraAddress").value = '';
			                }
			
			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                document.getElementById('sample6_postcode').value = data.zonecode;
			                document.getElementById("address1").value = addr;
			                // 커서를 상세주소 필드로 이동한다.
			                document.getElementById("address2").focus();
			            }
			        }).open();
			    }
			</script>
    </div>

    <!-- 푸터바 -->
<jsp:include page="../common/footer.jsp" />
</body>
</html>