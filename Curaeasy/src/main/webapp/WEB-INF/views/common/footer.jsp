<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>curaeasy</title>

    <!-- jQuery 라이브러리 -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
    <!-- 부트스트랩 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
    <!--로그인스타일-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!--폰트-->

    
    <style>

        .footer { 
            background-color: #333; 
            color: #fff; 
            padding: 40px 20px; 
            clear: both; /* 충돌 방지용 */
            box-shadow: 0 0 15px #333;
        }
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
        .footer-column li { 
            list-style: none; 
            text-align: left;
        }
        .footer-column ul li { 
            margin-bottom: 10px; 
        }
        .sns-icons { 
            display: flex; 
            gap: 30px; 
        }
        .sns-icons a {
            margin:10px;
            color: white;
            font-size: 1.7em;
            transition: color 1s ease;
        }
        .sns-icons a:hover { 
            color: white; 
        }
        .footer-bottom {
            margin-top: 20px;
            border-top: 1px solid #444;
            padding-top: 20px;
            text-align: center;
        }
    </style>
</head>
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
        </div>
        <div class="footer-bottom">
            <p>&copy; 2024 Cureasy Art Hall.</p>
        </div>
    </footer>

</body>
</html>
