<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Include Flatpickr CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>수시대관신청</title>
    <style>
        .form-container {
            border: 1px solid lightgray;
            width: 80%;
            margin: auto;
            padding: 2rem;
            background-color: white;
        }
        .form-group {
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
        }
        .form-group label {
            font-weight: bold;
            width: 20%;
            margin-right: 1rem;
        }
        .form-group1 {
            margin-bottom: 1.5rem;
            align-items: center;
            display: inline;
        }
        .form-group1 label {
            display: inline;
            font-weight: bold;
            width: 20%;
            margin-right: 1rem;
        }
        .form-group input,
        .form-group textarea,
        .form-group select {
            /* flex: 1; */
            padding: 0.5rem;
            border: 1px solid #CED4DA;
            border-radius: 0.25rem;
        }
        .form-header {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 1.5rem;
        }
        .form-section-title {
            font-weight: bold;
            margin-bottom: 1rem;
            border-bottom: 2px solid #000;
            padding-bottom: 0.5rem;
        }
        .form-inline .form-group {
            margin-right: 1rem;
        }
        .form-footer {
            text-align: right;
        }
        .form-footer1 {
            text-align: center;
        }
        .consent-section {
            border-top: 2px solid #000;
            margin-top: 2rem;
            padding-top: 1rem;
        }
        .btn-secondary {
            margin-right: 1rem;
        }
        .table-bordered th, .table-bordered td {
            border: 1px solid #DEE2E6;
        }
        .half-width {
            width: calc(50% - 0.5rem);
        }
        .address-group {
            display: flex;
            gap: 1rem;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<br><br>
<div class="">
    <div class="form-container">
        <h2 class="form-header">수시대관신청</h2>
        <p>큐레이지 수시대관신청</p>
        <form action="applyRrental.re" method="post" enctype="multipart/form-data">
            <div class="form-section">
                <div class="form-section-title">
                    <div align="left" style="display: inline;">
                        신청자 정보
                    </div>
                    <div style="display: inline;  float : right;">
                        <input type="checkbox" name="LoadInformation" id="LoadInformation" onclick='getCheckboxValue(event);' >
                        <label for="LoadInformation">내정보 불러오기</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="applicantName">이름 :</label>
                    <input type="text" id="memberName" name="memberName" required class="form-control">
                </div>
                <div class="form-group">
                        <label>연락처 :</label>
                        <input type="text" id="memberPhone" name="memberPhone" required class="form-control">
                </div>
                <div class="form-group">
                    <label for="email">이메일:</label>
                    <input type="email" id="memberEmail" name="memberEmail" required class="form-control">
                </div>
                <div class="form-group">
                    <label for="post-btn">주소:</label>
                 
                    	<input type="hidden" id="sample6_postcode" name="deliveryZipcode" placeholder="&nbsp;&nbsp;우편번호" readonly required >
	                    <input type="text" id="memberAddress1" name="memberAddress1" placeholder="&nbsp;&nbsp;주소" readonly required style=" width:66vw; display: inline;" class="form-control">
						<input type="button" id="post-btn" class="btn btn-light" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="width:10vw; margin-left:1px; border: 1px solid black;" >
                </div>
                <div class="form-group">
                    <label for="addressDetail">상세주소 입력</label>
                    <input type="text" id="memberAddress2" name="memberAddress2" class="form-control" placeholder="상세주소" required  >
					<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
                </div>
                <div class="form-group">
                    <label for="birthOrRegNo">생년월일 <!--(또는 사업자등록번호)-->:</label>
                    <input type="date" id="memberBirthday" name="memberBirthday" required class="form-control">
                </div>
            </div>
            <div class="form-section">
                <div class="form-section-title">대관장소 및 기간</div>
                    <div class="form-group">
                        <label for="galleryNo1">대관장소:</label>
                        <input type="text" id="galleryNo1" name="galleryNo1" value="" disabled required class="form-control">
                        <input type="hidden" id="galleryNo" name="galleryNo" value="${requestScope.rn.galleryNo}"  required>
                        <!-- <input type="text" id="otherVenue" name="otherVenue" placeholder="기타인 경우 반드시 적어야 합니다" style="margin-top: 0.5rem;"> -->
                    </div>
               		<div class="form-group">
                        <label for="rentalContent">대관 사유 :</label>
                        <input type="text" id="rentalContent" name="rentalContent" class="form-control"value=""  required>
                    </div>
                    <div class="form-group">
                        <label for="StartDate">시작일:</label>
                        <input type="date" id="StartDate" name="StartDate" class="form-control"value="${requestScope.rn.rentalStartDate}" disabled required>
                        <input type=date id="rentalStartDate" name="rentalStartDate" class="form-control"value="${requestScope.rn.rentalStartDate}"   style="display: none">
                    </div>
                    <div class="form-group">
                        <label for="EndDate">종료일:</label>
                        <input type="date" id="EndDate" name="EndDate" class="form-control" required>
                        <input type="date" id="rentalEndDate" name="rentalEndDate" class="form-control"  value="" style="display: none">
                    </div>

                <div class="form-group">
                	<label for="usedOk">이용가능 여부:</label>
                	<input type="text" id="rental-day" name="rental-day" value="" disabled readonly required style=" width:61vw; background-color: white; border:none" class="form-control">
                    <button type="button" id="usedOk" class="btn btn-secondary" onclick="checkAvailability();" style="width:15vw; margin-left:5px; margin-right:0px; border: 1px solid black; ">대관 가능 여부 확인</button>
                </div>
            </div>
            <div class="consent-section">
                <div class="form-section-title">개인정보 수집 및 활용 동의</div>
                <table class="table table-bordered">
                    <tr>
                        <th>이용 수집 목적</th>
                        <td>개인정보의 수집 및 이용목적: 대관신청 및 부가가치세법 32조에 따른 세금계산서 발행</td>
                    </tr>
                    <tr>
                        <th>수집항목</th>
                        <td>수집되는 개인정보 항목: 이름, 생년월일, 주소, 연락처, 이메일</td>
                    </tr>
                    <tr>
                        <th>보유 및 이용기간</th>
                        <td>개인정보의 보유 및 이용기간: 5년</td>
                    </tr>
                    <tr>
                        <th>개인정보 제공 및 수집 동의 거부권리</th>
                        <td>동의를 거부할 권리 및 동의 거부에 따른 불이익: 귀하는 본 안내에 따른 개인정보 수집에 대해 거부할 권리가 있습니다. 본 개인정보 수집에 대해 거부할 경우 대관이 용이하지 않을 수 있습니다.</td>
                    </tr>
                </table>
                <br>
                <div class="form-group1">
                    <label>큐레이지 대관 공모사업에 따라 개인정보 수집 및 활용에 동의합니까?</label>
                    <div align="center">
                        <br><br>
                        <label class="radio-inline">
                            <input type="radio" name="consent" value="yes" onclick='submet()'> 동의합니다
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="consent" value="no"  onclick='submet()' checked> 동의하지 않습니다
                        </label>
                    </div>
                </div>
            </div>
            <br>
            <div class="form-footer1" align="center">
                <button type="button" class="btn btn-secondary">취소</button>
                <button type="submit" id="result" class="btn btn-primary" disabled>신청</button>
            </div>
        </form>
    </div>
</div>
<br><br>
<jsp:include page="../common/footer.jsp" />
<!-- Include Flatpickr JS -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script>

    // Initialize Flatpickr on date input fields
    $(function (){
    	if ('${requestScope.rn.galleryNo}' == 1) { 
    		 $(".form-group input[id=galleryNo]").val(1)
    		 $(".form-group input[id=galleryNo1]").val("제 1 전시관");
    	}
        else if ('${requestScope.rn.galleryNo}' == 2) {  
        	 $(".form-group input[id=galleryNo]").val(2)
    		 $(".form-group input[id=galleryNo1]").val("제 2 전시관");
        }
        else if ('${requestScope.rn.galleryNo}' == 3) {  
        	 $(".form-group input[id=galleryNo]").val(3)
    		 $(".form-group input[id=galleryNo1]").val("제 3 전시관");
        }
        else if ('${requestScope.rn.galleryNo}' == 4) {  
        	 $(".form-group input[id=galleryNo]").val(4)
    		 $(".form-group input[id=galleryNo1]").val("제 4 전시관");
        }
        else if ('${requestScope.rn.galleryNo}' == 5) {  
        	 
        	 $(".form-gro input[id=galleryNo]").val(5)
    		 $(".form-group input[id=galleryNo1]").val("제 5 전시관");
        }
        else if ( '${requestScope.rn.galleryNo}' == 6) { 
        	 $(".form-gro input[id=galleryNo]").val(6)
    		 $(".form-group input[id=galleryNo1]").val("제 6 전시관");
        }
      
	});
    flatpickr(".datepicker", {
        dateFormat: "Y-m-d"
    });
    function checkAvailability() {
        
    	if($(".form-group input[id=EndDate]").val()== ""){
    		$(".form-group input[id=rental-day]").val("대관 종료일을 선택해 주세요").css("color","red");
    	}
    	else{
    		insertDayTrueCheck()
    	}
    };
    function insertDayTrueCheck() {
    	
    	if($(".form-group input[id=EndDate]").val() < $(".form-group input[id=StartDate]").val() ){
    		$(".form-group input[id=rental-day]").val("대관 종료일이 시작일 보다 빠르거나 같을수 없습니다 .").css("color","red");
    	}else{

    		$.ajax({
				url : "dayCheck.re",
				type : "get",
				data : {
					disNo : '${requestScope.rn.galleryNo}',
					endDay : $(".form-group input[id=EndDate]").val(),
					staDay : $(".form-group input[id=StartDate]").val()
				},
				success : function(result) {
					if(result == "NNNNN"){
						$(".form-group input[id=rental-day]").val("해당 일정을 선택 할 수없습니다 .").css("color","red");
					}else if(result == "NNNNY" ){
						$(".form-group input[id=rental-day]").val("이용가능한 일정입니다 .").css("color","green");
						$(".form-group input[id=rentalEndDate]").val($(".form-group input[id=EndDate]").val());
						$(".form-group input[id=EndDate]").attr("disabled",true)
						$("#usedOk").attr("disabled",true);
						
					}
					submet()
				},error : function() {console.log("ajax 통신 실패");}
			
				});

    	}
	}
    
    
    
    
	function submet()  {
		
		console.log("123132")
		console.log( $('input[name=consent]:checked').val())
		console.log($(".form-group input[id=rental-day]").val())
		
		if( $('input[name=consent]:checked').val()==="yes" && $(".form-group input[id=rental-day]").val()=== "이용가능한 일정입니다 ."){
			$("#result").attr("disabled",false);
		}else {
			$("#result").attr("disabled",true)
		}
		
		
		}
    
    
    function getCheckboxValue(event)  {
    	  if(event.target.checked)  {
    		  let memberAddress1 = '${sessionScope.loginUser.memberAddress}';
    		  let memberAddress2 = memberAddress1.split('/', 2);
    		  
    		  $(".form-group input[id=memberName]").val('${sessionScope.loginUser.memberName}').attr("disabled",true)
    		  $(".form-group input[id=memberPhone]").val('${sessionScope.loginUser.memberPhone}').attr("disabled",true)
    		  $(".form-group input[id=memberEmail]").val('${sessionScope.loginUser.memberEmail}').attr("disabled",true)
    		  $(".form-group input[id=memberBirthday]").val('${sessionScope.loginUser.memberBirthday}').attr("disabled",true)
    		  $(".form-group input[id=memberAddress1]").val(memberAddress1.split('/', 1)).attr("disabled",true)
    		  $(".form-group input[id=memberAddress2]").val(memberAddress2[1].split(',', 1)).attr("disabled",true)
    		  $("#post-btn").attr("disabled",true);
    	  }else {
    		  $(".form-group input[id=memberName]").val("").attr("disabled",false)
    		  $(".form-group input[id=memberPhone]").val("").attr("disabled",false)
    		  $(".form-group input[id=memberEmail]").val("").attr("disabled",false)
    		  $(".form-group input[id=memberBirthday]").val("").attr("disabled",false)
    		  $(".form-group input[id=memberAddress1]").val("").attr("disabled",false)
    		  $(".form-group input[id=memberAddress2]").val("").attr("disabled",false)
    		  $("#post-btn").attr("disabled",false);
    	  }
    	};
	
    	
    	
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
                document.getElementById("memberAddress1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("memberAddress2").focus();
            }
        }).open();
	}
	</script>
</body>
</html>