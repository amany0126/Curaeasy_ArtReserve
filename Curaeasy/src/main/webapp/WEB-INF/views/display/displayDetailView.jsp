<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>전시 상세</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
        }
        .header, .footer {
            background-color: #f8f8f8;
            padding: 20px;
            text-align: center;
        }
        .content {
            padding: 20px;
        }
        .content-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .content-header h1 {
            font-size: 2em;
            margin: 0;
        }
        .exhibition-details {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .exhibition-item {
            width: 45%;
        }
        .exhibition-item img {
            width: 100%;
            height: auto;
            object-fit: cover;
        }
        .exhibition-info {
            width: 45%;
        }
        .exhibition-info table {
            width: 100%;
            border-collapse: collapse;
        }
        .exhibition-info th, .exhibition-info td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .exhibition-info th {
            background-color: #f2f2f2;
        }
        .exhibition-intro {
            margin-top: 40px;
        }
        .exhibition-intro h2 {
            font-size: 1.8em;
            margin-bottom: 20px;
        }
        .exhibition-intro img {
            width: 100%;
            height: auto;
            object-fit: cover;
            margin-bottom: 20px;
        }
        .exhibition-intro p {
            font-size: 1em;
            line-height: 1.5;
        }
        .back-to-list {
            text-align: center;
            margin-top: 20px;
        }
        .back-to-list a {
            text-decoration: none;
            color: #fff;
            background-color: #333;
            padding: 10px 20px;
            border-radius: 5px;
        }
        hr {
            border: 0;
            border-top: 2px solid #ccc;
            margin: 20px 0;
        }
    </style>
</head>
<body>

<jsp:include page="../common/header.jsp" />

<div class="container">
    <div class="content">
        <div class="content-header">
            <h1>현재 전시</h1>
            <button>예매하기</button>
        </div>
        <hr>
        <div class="exhibition-details">
            <div class="exhibition-item">
                <img src="resources/images/display1.jpg" alt="전시 이미지">
                <h2>김진안 展 MAGNETIC LIFE</h2>
                <p>2024-06-04(Tue) ~ 2024-06-14(Fri)</p>
            </div>
            <div class="exhibition-info">
                <table>
                    <tr>
                        <th>전시명</th>
                        <td>김진안 展 MAGNETIC LIFE</td>
                    </tr>
                    <tr>
                        <th>기간</th>
                        <td>2024-06-04(Tue) ~ 2024-06-14(Fri)</td>
                    </tr>
                    <tr>
                        <th>장소</th>
                        <td>인천아트플랫폼 전시실</td>
                    </tr>
                    <tr>
                        <th>소개</th>
                        <td>김진안 작가의 최신 작품 전시...</td>
                    </tr>
                </table>
            </div>
        </div>
        <hr>
        <div class="exhibition-intro">
            <h2>전시 소개</h2>
            <img src="resources/images/display1.jpg" alt="전시 포스터">
            <p>김진안 展 MAGNETIC LIFE는...</p>
        </div>
        <hr>
        <div class="back-to-list">
            <a href="onDisplay.do">목록으로 가기</a>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />

</body>
</html>
