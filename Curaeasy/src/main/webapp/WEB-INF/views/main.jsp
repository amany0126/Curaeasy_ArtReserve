<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Art Hall Website</title>
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

        /*div { box-sizing: border-box; border:2px solid red;}*/
        /* 폰트스타일 */
        * { 
            font-family: "IBM Plex Sans KR", sans-serif;
            font-weight: 400;
            font-style: normal;
        }

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
        #content-area {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            max-width: 1300px;
            height : 500px;
            margin: auto;
            
        }
        #content-area3 {border:1px solid black; height:100%; width: 20%; }




        /* 로그인 */
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

        
        /* ======================== footer style */        
        .footer { background-color: #333; color: #fff; padding: 40px 20px; }
        .footer-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            max-width: 1300px;
            margin: auto;
        }
        .footer-column {
            flex: 1;
            min-width: 350px;
            margin: 10px 20px;
        }
        .footer-column li { list-style: none; text-align: left;}
        .footer-column ul li { margin-bottom: 10px; }

        /* sns 로고 */
        .sns-icons { display: flex; gap: 30x; }
        .sns-icons a {
            margin:10px;
            color: white;
            font-size: 1.7em;
            transition: color 1s ease;
        }
        .social-icons a:hover { color: white; }
        .footer-bottom {
            margin-top: 20px;
            border-top: 1px solid #444;
            padding-top: 20px;
            text-align: center;
        }

        /* footer 슬라이더 모션 */
        .slider {
            position: relative;
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            overflow: hidden;
        }
        .slides { display: flex; transition: transform 0.5s ease-in-out; }
        .slides img {
            width: 100%;
            flex-shrink: 0;
            height: 400px;
            object-fit: cover;
            border-radius: 30px;
        }
        .prev, .next {
            position: absolute;
            top: 50%;
            transform: translateY(-30%);
            background-color: black;
            color: white;
            border: none;
            padding: 5px;
            cursor: pointer;
        }
        /* footer 슬라이더 양쪽 화살표 */
        .prev { left: 10px; } .next { right: 10px; }

        .Writer{
            width: 300px;
            height : 30px;
            padding: 10px;
            line-height: 30px;
            border-radius: 10px;
            cursor: pointer;
        }
        .Introduce{
            width: 300px;
            height: 100px;
            border: 1px solid lightgray;
            margin-top: 5px;
            border-radius: 10px;
            padding: 10px;
            display: none;
        }


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



    <!-- Content 영역-->
    <div id="content-area">

        <div id="content-area3">
            <div class="Writer">
                <img src=".." style="width:200px; height:200px;">
            </div>
            <p class="Introduce">
                자기소개 어쩌구저쩌구
            </p>
        
            <div class="Writer">ㅇㅇㅇ작가</div>
            <p class="Introduce">
                자기소개 어쩌구저쩌구
            </p>
        
            <div class="Writer">ㅇㅇㅇ작가</div>
            <p class="Introduce">
                자기소개 어쩌구저쩌구
            </p>
        
            <div class="Writer">ㅇㅇㅇ작가</div>
            <p class="Introduce">
                자기소개 어쩌구저쩌구
            </p>

            <div class="Writer">ㅇㅇㅇ작가</div>
            <p class="Introduce">
                자기소개 어쩌구저쩌구
            </p>
        </div>
    </div>

    <script>
        $(function(){

            $("#content-area3>div").click(function(){

                let $p = $(this).next(); 
                console.log($p.css("dispaly"));

                if($p.css("display") == "none"){
                    $(this).siblings("#content-area>p").slideUp(500);
                    $p.slideDown(500);
                } else{
                    $p.slideUp(500);
                }
                
                
            });
        });
    </script>

    
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-column">
                <h3>About Us</h3>
                <p>창의성과 영감이 만나는 저희 아트홀에 오신 것을 환영합니다. 전시, 이벤트 등을 위해 함께 하세요.<br>
                    아트홀에 대한 문의사항이 있으시면 언제든지 연락해 주시기 바랍니다. 예매, 공연 일정, 대관 문의 등 모든 질문에 친절히 답변드리겠습니다.</p>
            </div>
            <div class="footer-column">
                <h3>Contact</h3>
                    <p>
                        운영시간 : 월요일~ 금요일 : 09:00 ~ 18:00 <br> 
                        토요일 : 10:00 ~ 16:00 <br>
                        (일요일 및 공휴일 휴무)<br>
                        Email: yjzzang@naver.com<br>
                        Phone: 010-7732-8035
                    </p>
            </div>
            <div class="footer-column">
                <h3>Follow Us</h3>
                <div class="sns-icons">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
            <div class="footer-column">
                <div class="slider">
                    <div class="slides">
                        <img src="../resources/이미지4.jpg" alt="image1">
                        <img src="../resources/참고이미지1.png" alt="image2">
                        <img src="../resources/이미지3.jpg" alt="image3">
                        <img src="../resources/이미지6.jpg" alt="image4">
                        <img src="../resources/이미지12.jpg" alt="image5">
                        <img src="../resources/이미지14.jpg" alt="image6">
                        <img src="../resources/이미지2.jpg" alt="image7">
                    </div>
                    <button class="prev">&#10094;</button>
                    <button class="next">&#10095;</button>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2024 Cureasy Art Hall.</p>
        </div>
    </footer>

    
    <script>
        let slides = document.querySelector('.slides');
        let images = slides.querySelectorAll('img');
        let prev = document.querySelector('.prev');
        let next = document.querySelector('.next');
        let index = 0;

        function showSlide(i) {
            index += i;
            if (index >= images.length) {
                index = 0;
            } else if (index < 0) {
                index = images.length - 1;
            }
            slides.style.transform = 'translateX(' + (-index * 100) + '%)';
        }

        prev.addEventListener('click', () => showSlide(-1));
        next.addEventListener('click', () => showSlide(1));

        // 2초간격
        setInterval(() => showSlide(1), 2000);

        

    </script>


</body>
</html>
