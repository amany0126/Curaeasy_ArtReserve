<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--폰트-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <title>작가소개 페이지</title>

    <style>
        h1{
            /* 폰트 */
            font-family: "Do Hyeon", sans-serif;
            font-weight: 400;
            font-size : xx-large;
            font-style :oblique;      
        }

        .container {
            width: 80%;
            margin: 0 auto;
            padding: 30px;
            background-color: #f9f9f9;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .header, .footer { padding: 10px 0; }
        .content {
            display: flex;
            flex-wrap: wrap;
            padding: 20px 0;
        }
        .content img {
            max-width: 340px;
            border-radius: 10px;
            margin-right: 20px;
        }
        .content .info { flex: 1; }
        .info h2 { margin-top: 0; }
        .profile {
            margin-top: 40px;
        }
        .profile h3 {
            border-bottom: 2px solid #333;
            padding-bottom: 10px;
        }
        .profile ul {
            list-style-type: none;
            padding: 0;
        }
        .profile ul li { margin-bottom: 10px; }
        .works {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .work-item { text-align: center; }
        .works img {

            max-width: 250px; height: 250px;
            margin: 5px;
            border-radius: 20px;
            border-style : ridge; /*액자로하든 바꾸든해*/
        }
        .work-item p { margin: 0; font-weight: bold; }

        h1 { text-align: center;}



        /* 애니메이션을 넣을까 말까 */


        .works img:hover { opacity: 0.4; cursor: pointer; box-shadow: 0 0 10px gray; }

    </style>

</head>
<body>

    <jsp:include page="../common/header.jsp" />

    <h1>상주작가 소개</h1> <br><br>

    <div class="container">
        <div class="content">
            <img src="../../../resources/images/artist1.jpg" alt="작가 사진"> <!-- 작가이미지 ARTIST_IMAGE 섬네일 첨부 ? -->
            <div class="info">
                <h2>작가 예명 : ${a.artistNickName}</h2>
                <p>입주 기간: 2024년 07월 - 2024년 12월</p>
                <p>이메일: artist1@example.com</p>
                <p>작가에 대한 소개 : 이 작가는 현대 미술의 선구자로, 다양한 매체를 통해 독창적인 작품을 선보이고 있습니다...?</p>
            </div>
        </div>

        <div class="profile">
            <h3>작가 프로필 및 학력</h3>
            <ul>
                <li>2020년 ~ 2022년: ○○대학교 미술학과 석사</li>
                <li>2016년 ~ 2020년: ○○대학교 미술학과 학사</li>
                <br>
                <li>다양한 전시 및 수상 경력...이 있겠쥬? </li>
            </ul> <br><br>
        </div>
        <hr>
        <h3>작가 작품 소개</h3> 
        <div class="works">

            <div class="work-item">
                <img src="../../../resources/images/img6.jpg" alt="작품 1">
                <p>작품명: 작품 1</p>
            </div>
            <div class="work-item">
                <img src="../../../resources/images/img8.jpg" alt="작품 2">
                <p>작품명: 작품 2</p>
            </div>
            <div class="work-item">
                <img src="../../../resources/images/img9.jpg" alt="작품 3">
                <p>작품명: 작품 3</p>
            </div>
            <div class="work-item">
                <img src="../../../resources/images/img11.jpg" alt="작품 4">
                <p>작품명: 작품 4</p>
            </div>
            
    </div>


    <jsp:include page="../common/footer.jsp" />
    
</body>
</html>