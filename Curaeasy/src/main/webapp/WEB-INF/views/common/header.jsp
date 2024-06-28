<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>curaeasy</title>
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- 부트스트랩 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
    <!--로그인스타일-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

	
	<!-- alertify 연동 구문 -->
	<!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/alertify.min.js"></script>
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/semantic.min.css"/>

    <style>

        div { box-sizing: border-box;}
        #logo img{ width: 200px; height: 200px; margin-left:0px; margin-right: 0px; }
        #logo a:hover { background-color: transparent !important; }
        #header { 
            background-color: #333; box-shadow: 20px 10px 15px 10px lightgray; 
        }
        #header-1 {
            height:160px;
            width : 100%;
            display: flex;
            flex-wrap: wrap;
            margin: auto;
            background-color: #333; color: #fff; 
            box-shadow: 0 0 15px #333;
        }
        #navi { 
            padding: 0; 
            margin : 0 auto; 
            list-style-type: none; 
            height: 100%; 
            width: 1300px; 
            justify-content: center;
            flex-grow: 1;
        }

        #user-actions li { list-style-type : none; margin-left: 150px;}  
        #user-actions { display: flex; align-items: center; }
        .login-link, .signup-link, .schedule-link { color: white; line-height : 40px; text-align: left;}
        #user-actions a:hover { color : white; text-decoration : none;}



        /* navi */
        #navi > li { float: left; width: 15%; height: 80px; line-height: 100px; text-align: center; position: relative; padding:0px; }
        #navi > li a { 
            background-color: transparent !important;
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
        #navi{margin:auto;}
        #navi ul li a:hover { background-color: #eee; color: black; font-size: 17px; font-weight: 600; }
        #navi ul li { width: 100%; border-bottom: none; }
        #navi ul li a {
            line-height: 30px;
            font-size: 18px;
            font-weight: normal;
            padding: 10px;
            color: white;
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        #navi li:hover > ul { display: block; }
        

        .signup-link { margin-left: 30px;}
    </style>
</head>
<body>
<!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/666f82ec9a809f19fb3e7b65/1i0hperq6';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->

	<c:if test="${not empty sessionScope.alertMsg}">
			<script>
				alert("${sessionScope.alertMsg}");
			</script>
			<c:remove var="alertMsg" scope="session" />
		</c:if>
        <div id="header-1">
            <ul id="navi">
                <li id="logo">
                    <a href="${pageContext.request.contextPath}/"><img src="resources/images/logo.png"></a>
                </li>
                <li>
                    <a href="about.do">큐레이지</a>
                    <ul>
                        <li><a href="about.do">소개</a></li> <!--아트플랫폼 소개 페이지-->
                        <li><a href="organization.do">조직도</a></li> <!--우리팀원 소개페이지-->
                        <li><a href="location.do">오시는길</a></li> <!--지도API 근처 버스|지하철|주차 안내-->
                    </ul>
                </li>
				<li>
				    <a href="onDisplay.do">전시참가</a>
				    <ul>
				        <li><a href="onDisplay.do">진행중 전시</a></li>
				        <li><a href="offDisplay.do">마감된 전시</a></li>
				        <li><a href="introduce.do">작가소개</a></li>
				    </ul>
				</li>
                <li>
                    <a href="rental.do">전시대관</a>
                    <ul>
                        <li><a href="rentalInfo.do">대관안내</a></li>
                        <li><a href="rental.do">대관신청</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">게시판 | 관람후기</a>
                    <ul>
                        <li><a href="notice.do">공지사항</a></li>
                        <li><a href="review.do">관람후기</a></li>
                    </ul>
                </li>


                <div id="user-actions">
                <li>
                    <br>
                  		<c:choose>
		                <c:when test="${empty sessionScope.loginUser}">
		                <!-- 로그인 전 -->
		               
		                       <!--  <a data-toggle="modal" data-target="#loginModal" class="signup-link"><i class="fas fa-sign-in-alt"></i> 로그인</a> <br> -->
		                        <a href="loginPage.me" class="signup-link"><i  class="fas fa-sign-in-alt"></i> 로그인</a> <br>
		                        <a href="enrollForm.me" class="signup-link"><i class="fas fa-user-plus"></i> 회원가입</a> <br>
		                        <a href="displayCalander.do" class="signup-link"><i class="far fa-calendar-alt icon"></i> 스케줄</a>
		                </c:when>
						<c:otherwise>
		              		<!-- 로그인 후 -->
		                   <%--  <label class="signup-link">${sessionScope.loginUser.memberName}님 환영합니다</label><!--  &nbsp;&nbsp; --><br> --%>
		                    <a href="myPage.me" class="signup-link"><i class="fas fa-user-plus" ></i>마이페이지</a><br>
		                    <a href="displayCalander.do" class="signup-link"><i class="far fa-calendar-alt icon"></i>스케줄</a><br>
		                    <a href="logout.me" class="signup-link"><i class="fas fa-sign-in-alt"></i>로그아웃</a><br>
						</c:otherwise>
		                </c:choose>
                    </li>
                </div>
            </ul>



	
        </div>
    </div>
    
</body>
</html>