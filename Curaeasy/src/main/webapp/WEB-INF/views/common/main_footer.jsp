<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>curaeasy</title>

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
    
</head>
<style>
    * { 
        font-family: "IBM Plex Sans KR", sans-serif;
        font-weight: 400;
        font-style: normal;
    }
    .footer { background-color: #333; color: #fff; padding: 40px 20px; 
        box-shadow: 0 0 15px #333;}
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
<body>

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
                        <img src="resources/images/img4.jpg" alt="image1">
                        <img src="resources/images/cimg1.png" alt="image2">
                        <img src="resources/images/img3.jpg" alt="image3">
                        <img src="resources/images/img6.jpg" alt="image4">
                        <img src="resources/images/img12.jpg" alt="image5">
                        <img src="resources/images/img14.jpg" alt="image6">
                        <img src="resources/images/img2.jpg" alt="image7">
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