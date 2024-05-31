<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Poor+Story&display=swap" rel="stylesheet">
    <style>

        div { box-sizing: border-box; border:2px solid red;}
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
                    <a href="#"><img src="../resources/logo2.png"></a>
                </li>
                <li>
                    <a href="#">플랫폼</a>
                    <ul>
                        <li><a href="#">소개</a></li> <!--아트플랫폼 소개 페이지-->
                        <li><a href="#">공간</a></li> <!--전시장 평면도 기타 등-->
                        <li><a href="#">조직도</a></li> <!--우리팀원 소개페이지-->
                        <li><a href="#">오시는길</a></li> <!--지도API 근처 버스|지하철|주차 안내-->
                    </ul>
                </li>
                <li>
                    <a href="#">전시참가</a>
                    <ul>
                        <li><a href="#">진행중 전시</a></li>
                        <li><a href="#">마감된 전시</a></li>
                        <li><a href="#">작가소개</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">전시대관</a>
                    <ul>
                        <li><a href="#">대관안내</a></li>
                        <li><a href="#">대관신청</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">소식|정보</a>
                    <ul>
                        <li><a href="#">공지사항</a></li>
                        <li><a href="#">게시판</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">게시판</a>
                    <ul>
                        <li><a href="#">공지사항</a></li>
                        <li><a href="#">관림후기</a></li>
                    </ul>
                </li>
            </ul>

            <div id="user-actions">
                <ul>
                    <li>
                        <a href="#" class="login-link"><i class="fas fa-sign-in-alt"></i> 로그인</a> <br>
                        <a href="#" class="signup-link"><i class="fas fa-user-plus"></i> 회원가입</a> <br>
                        <a href="#" class="schedule-link"><i class="far fa-calendar-alt icon"></i>스케줄</a>
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
    </div>
</body>
</html>
