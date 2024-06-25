<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전시 예약 완료</title>

    <style>

        body {
            background-color: #f5f5f5;
            color: #333;
            display: block; /* 이거로하든가 auto  | 확인해 */
            justify-content: center;
            align-items: center;
            height : 700px;
            /* overflow: hidden;  스크롤바 */
        }

        .container {
            background-color: #fff;
            border-radius: 20px;
            box-shadow: 0 0 8px rgb(88, 88, 88);
            width: 1000px;
            padding: 40px;
            text-align: center;
            animation: slide-in 1s ease-out; /* 애니메이션 추가 */
        }


        /*  애니메이션 */
        @keyframes slide-in {
            from { transform: translateX(-100%); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        .title {
            color: rgb(196, 101, 101);
            margin-bottom: 20px;
        }

        .message {
            font-size: 16px;
            color: #666;
            margin-bottom: 40px;
            border : 1px groove;
            border-left: none; border-right: none;
        }

        .details p {
            font-size: 15px;
            margin: 5px 0;
        }

        .homeReturn:hover { background-color: black; color:white; }

        .details { text-align: left; margin-bottom: 30px; }
        .details table { width: 50%; border-collapse: collapse; }
        .details td { padding: 10px; border: 1px solid #ddd; text-align: center; }
        .details th { text-align: center; width: 20%;}

        button { 
            background-color: white; color:white;  color:black; border-radius: 20px;  cursor: pointer;
            width: 150px; height: 40px; font-size : 15px;
        }


        .details td, .details th {
            border-top: 1px solid #ddd; 
            border-bottom: 1px solid #ddd; 
            border-left: none; 
            border-right: none; 
        }


        .homeReturn:hover{transform: translateY(10px);}


    </style>
</head>
<body>

 <jsp:include page="../common/header.jsp" />
<br> <br>
    <div class="container">
        <div class="content">
            <h1 class="title">🗦 예약이 완료되었습니다! 🗧</h1> <br>
            <p class="message">&#128227; 예약 내역은 이메일로 발송되었습니다.</p>
            <div class="details">
                <table align="center">
                    <tr>
                        <th>예약번호</th> 
                        <td>${requestScope.r.reserveNo}</td>
                    </tr>
                    <tr>
                        <th>예약인원</th>
                        <td>${requestScope.r.reserveCount}</td>
                    </tr>
                    <tr>
                        <th>전시명</th>
                        <td>${requestScope.d.displayName}</td>
                    </tr>
                    <tr>
                        <th>전시관명</th>
                        <td>${requestScope.d.galleryNo}</td>
                    </tr>
                    <tr>
                        <th>입장일</th>
                        <td>${requestScope.r.entranceDate}</td>
                    </tr>

                </table>
            </div>
            
            <a href="${pageContext.request.contextPath}"><button  class="homeReturn">홈으로 돌아가기</button></a>
        </div>
    </div>
	
	<br><br>
    <jsp:include page="../common/footer.jsp" /> 
    
</body>
</html>