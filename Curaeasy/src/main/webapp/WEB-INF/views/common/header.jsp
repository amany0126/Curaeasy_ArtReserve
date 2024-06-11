<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>header</title>
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!--로그인스타일-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!--폰트-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" >
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Poor+Story&display=swap" rel="stylesheet">
    <style>

        div { box-sizing: border-box;}
        #logo img{ width:100%; height: 100%; margin-left:0px; margin-right: 20px; }
        #header { background-color: #333; }
        #header-1 {
            height:160px;
            width : 1300px;
            display: flex;
            flex-wrap: wrap;
            margin: auto;
            background-color: #333; color: #fff; 
        }
        #navi { 
            padding: 0; 
            margin : 0; 
            list-style-type: none; 
            height: 100%; 
            width: 1000px; 
        }

        #user-actions li { list-style-type : none; }  
        #user-actions { display: flex; align-items: center; }
        .login-link, .signup-link, .schedule-link { color: white; line-height : 40px; text-align: left;}
        #user-actions a:hover { color : white; text-decoration : none;}



        /* navi */
        #navi > li { float: left; width: 15%; height: 80px; line-height: 100px; text-align: center; position: relative; padding:0px; }
        #navi > li a { 
            text-decoration: none; color: #fff; 
            font-size: 20px; font-weight: 900; 
            display: block; 
            margin :0px; padding: 0px;
        }  
        #navi > li:hover > a { background-color: #555; }
        

        /* 상세메뉴바 */
        #navi ul { 
            position: absolute;
            left: 0;
            display: none;
            background-color: #555;
            width: 100%;
            z-index: 1000;
            padding: 0;
            margin: 0;
            list-style-type: none;
        }
        #navi ul li a:hover { background-color: #eee; color: black; font-size: 17px; font-weight: 600; }
        #navi ul li { width: 100%; border-bottom: none; }
        #navi ul li a {
            line-height: 30px;
            font-size: 16px;
            font-weight: normal;
            padding: 10px;
            color: #333;
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        #navi li:hover > ul { display: block; }
        
    </style>
</head>
<body>

    <div id="header">
        <div id="header-1">
            <ul id="navi">
                <li id="logo">
                    <a href="${pageContext.request.contextPath}/"><img src="resources/images/logo2.png"></a>
                </li>
                <li>
                    <a href="intro.do">큐레이지<a>
                    <ul>
                        <li><a href="#">소개</a></li> <!--아트플랫폼 소개 페이지-->
                        <li><a href="#">공간</a></li> <!--전시장 평면도 기타 등-->
                        <li><a href="#">조직도</a></li> <!--우리팀원 소개페이지-->
                        <li><a href="location.do">오시는길</a></li> <!--지도API 근처 버스|지하철|주차 안내-->
                    </ul>
                </li>
                <li>
                    <a href="display.do">전시참가</a>
                    <ul>
                        <li><a href="#">진행중 전시</a></li>
                        <li><a href="#">마감된 전시</a></li>
                        <li><a href="#">작가소개</a></li>
                        <!-- 작가신청 테스트중 -->
                        <c:choose>
		                <c:when test="${empty sessionScope.loginUser}">
		                </c:when>
						<c:otherwise>
		              		<li><a href="enrollForm.at">작가신청</a></li>
						</c:otherwise>
		                </c:choose>
                        
                    </ul>
                </li>
                <li>
                    <a href="rental.do">전시대관</a>
                    <ul>
                        <li><a href="#">대관안내</a></li>
                        <li><a href="#">대관신청</a></li>
                    </ul>
                </li>
                <li>
                    <a href="notice.do">소식 | 정보</a>
                    <ul>
                        <li><a href="#">공지사항</a></li>
                        <li><a href="#">게시판</a></li>
                    </ul>
                </li>
                <li>
                    <a href="review.do">사용자후기</a>
                    <ul>
                        <li><a href="#">공지사항</a></li>
                        <li><a href="#">관림후기</a></li>
                    </ul>
                </li>
            </ul>
		
		
            <div id="user-actions">
                <ul>
                    <li>
                    <br>
                  		<c:choose>
		                <c:when test="${empty sessionScope.loginUser}">
		                <!-- 로그인 전 -->
		               
		                       <!--  <a data-toggle="modal" data-target="#loginModal" class="signup-link"><i class="fas fa-sign-in-alt"></i> 로그인</a> <br> -->
		                        <a href="loginPage.me" class="signup-link"><i  class="fas fa-sign-in-alt"></i> 로그인</a> <br>
		                        <a href="enrollForm.me" class="signup-link"><i class="fas fa-user-plus"></i> 회원가입</a> <br>
		                        <a href="#" class="schedule-link"><i class="far fa-calendar-alt icon"></i> 스케줄</a>
		                </c:when>
						<c:otherwise>
		              		<!-- 로그인 후 -->
		                   <%--  <label class="signup-link">${sessionScope.loginUser.memberName}님 환영합니다</label><!--  &nbsp;&nbsp; --><br> --%>
		                    <a href="myPage.me" class="signup-link"><i class="fas fa-user-plus" ></i>마이페이지</a><br>
		                    <a href="#" class="schedule-link"><i class="far fa-calendar-alt icon"></i>스케줄</a><br>
		                    <a href="logout.me" class="signup-link"><i class="fas fa-sign-in-alt"></i>로그아웃</a><br>
						</c:otherwise>
		                </c:choose>
                    </li>
                </ul>
            </div>
	
            

            <!--
            <ul id="header-2">
                <li >&#128100; 로그인</li>
                <li>회원가입</li>
                <li>3</li>
            </ul>
            -->

            <!--  로그인 후  -->
            <!--
            <div>
                <ul>
                    <li>로그아웃</li>
                    <li>마이페이지</li>
                    
                </ul>
            </div>
            -->
        </div>
    </div><%-- 
    	<div class="modal fade" id="loginModal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Login</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<form action="login.me" method="post">
					<!-- Modal body -->
					<div class="modal-body">
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
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">로그인</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div> --%>
    
</body>
</html>