<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전체 전시</title>
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
            margin-bottom: 20px;
        }
        .content-header h1 {
            font-size: 2em;
            margin: 0 0 10px 0;
        }
        .tab-menu {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
            border-bottom: 2px solid #ddd;
        }
        .tab-menu a {
            margin: 0 15px;
            text-decoration: none;
            color: #333;
            padding: 10px 20px;
            border-bottom: 2px solid transparent;
        }
        .tab-menu a.active {
            border-bottom: 2px solid #333;
            font-weight: bold;
        }
        .search-box {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 20px;
        }
        .search-box input[type="text"] {
            padding: 10px;
            width: 200px;
            border: 1px solid #ccc;
            margin-right: 5px;
        }
        .search-box button {
            padding: 10px;
            border: 1px solid #ccc;
            background-color: #333;
            color: #fff;
            cursor: pointer;
        }
        .exhibition-list {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }
        .exhibition-item {
            width: 30%;
            text-align: center;
            margin-bottom: 20px;
        }
        .exhibition-item img {
            width: 100%;
            height: 400px;
            object-fit: cover;
        }
        .exhibition-item h2 {
            font-size: 1.5em;
            margin: 10px 0;
        }
        .exhibition-item p {
            font-size: 1em;
            line-height: 1.5;
            margin-bottom: 10px;
        }
        .pagination {
            text-align: center;
            margin-top: 20px;
            width: 100%;
            display: flex;
            justify-content: center;
        }
        .pagination a {
            margin: 0 5px;
            text-decoration: none;
            color: #333;
        }
        .pagination a.active {
            font-weight: bold;
        }
    </style>
</head>
<body>

<jsp:include page="../common/header.jsp" />

<div class="container">
    <div class="content">
        <div class="tab-menu">
            <a href="onDisplay.do" class="active">현재전시</a>
            <a href="upcomingDisplay.do">예정전시</a>
            <a href="offDisplay.do">지난전시</a>
        </div>
        <div class="content-header">
            <h1>진행중인 전시</h1>
        </div>
        <div class="search-box">
            <input type="text" placeholder="검색어를 입력하세요" />
            <button>검색</button>
        </div>
        <div class="exhibition-list">
            <div class="exhibition-item">
                <img src="resources/images/display1.jpg" alt="전시 이미지 1">
                <h2>[대관 전시] 김진안 展 MAGNETIC LIFE</h2>
                <p>2024-06-04(Tue) ~ 2024-06-14(Fri)</p>
            </div>
            <div class="exhibition-item">
                <img src="resources/images/display1.jpg" alt="전시 이미지 2">
                <h2>[대관 전시] 이재훈 展 ARTIST LIFE</h2>
                <p>2024-07-01(Mon) ~ 2024-07-10(Wed)</p>
            </div>
            <div class="exhibition-item">
                <img src="resources/images/display1.jpg" alt="전시 이미지 3">
                <h2>[대관 전시] 박성민 展 CREATIVE WORLD</h2>
                <p>2024-08-15(Fri) ~ 2024-08-25(Sun)</p>
            </div>
            <div class="exhibition-item">
                <img src="resources/images/display1.jpg" alt="전시 이미지 4">
                <h2>[대관 전시] 홍길동 展 FANTASY REALM</h2>
                <p>2024-09-01(Sun) ~ 2024-09-10(Tue)</p>
            </div>
            <div class="exhibition-item">
                <img src="resources/images/display1.jpg" alt="전시 이미지 5">
                <h2>[대관 전시] 김영희 展 NATURE'S GIFT</h2>
                <p>2024-10-05(Sat) ~ 2024-10-15(Tue)</p>
            </div>
            <div class="exhibition-item">
                <img src="resources/images/display1.jpg" alt="전시 이미지 6">
                <h2>[대관 전시] 이철수 展 URBAN DREAMS</h2>
                <p>2024-11-10(Sun) ~ 2024-11-20(Wed)</p>
            </div>
            <div class="exhibition-item">
                <img src="resources/images/display1.jpg" alt="전시 이미지 7">
                <h2>[대관 전시] 박명수 展 ABSTRACT VISIONS</h2>
                <p>2024-12-05(Thu) ~ 2024-12-15(Sun)</p>
            </div>
            <div class="exhibition-item">
                <img src="resources/images/display1.jpg" alt="전시 이미지 8">
                <h2>[대관 전시] 이수진 展 COSMIC DANCE</h2>
                <p>2025-01-01(Wed) ~ 2025-01-10(Fri)</p>
            </div>
            <div class="exhibition-item">
                <img src="resources/images/display1.jpg" alt="전시 이미지 9">
                <h2>[대관 전시] 김철수 展 TIMELESS TALES</h2>
                <p>2025-02-05(Wed) ~ 2025-02-15(Sat)</p>
            </div>
        </div>
        <div class="pagination">
            <a href="#" class="prev">«</a>
            <a href="#" class="active">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#" class="next">»</a>
        </div>
        
        <a href="displayAdd.do"> <button type="button" class="btn btn-light">전시추가</button></a>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />

</body>
</html>
