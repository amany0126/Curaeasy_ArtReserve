<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>입주작가</title>
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
        .content {
            padding: 20px;
        }
        .content-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-top: 20px;
            padding-bottom: 50px;
        }
        .content-header h1 {
            font-size: 2em;
            margin: 0;
        }
        .search-box {
            display: flex;
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
        .sidebar {
            width: 200px;
            float: left;
            margin-right: 20px;
        }
        .main-content {
            width: calc(100% - 240px);
            float: left;
        }
        .artist-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .artist-item {
            width: 30%;
            text-align: center;
            margin-bottom: 20px;
        }
        .artist-item img {
            width: 100%;
            height: 250px;
            object-fit: cover;
            border-radius: 20px;
            border-style : ridge;
            box-shadow: 0 0 10px gray;
        }
        .artist-item h2 {
            font-size: 1.2em;
            margin: 10px 0;
        }
        .artist-item p {
            font-size: 1em;
            line-height: 1.5;
            margin-bottom: 10px;
        }
        .pagination {
            text-align: left;
            margin-top: 20px;
            width: 100%;
            padding-bottom: 50px;
            display: flex;
            justify-content: center;
            clear: both;
        }
        .pagination a {
            margin: 0 5px;
            text-decoration: none;
            color: #333;
        }
        .pagination a.active {
            font-weight: bold;
        }

        .sidebar li { 
            list-style-type: none;
            padding-bottom: 20px;
            font-size: 19px;
            font-weight : 700;
            text-align :left;
            color : black;
        }


        .sidebar>ul{ padding: 0; }
        .sidebar a { color : black; }
        .sidebar a:hover { color : plum; }

        .search-box>input { border-radius: 20px;}
        .search-box>button { border-radius: 20px;}

        .artist-item>img:hover { opacity: 0.4; cursor: pointer; }

    </style>
</head>
<body>

<jsp:include page="../common/header.jsp" />

<div class="container">
    <div class="content">
        <div class="content-header">
            <h1>입주작가</h1>
            <div class="search-box">
                <input type="text" placeholder="검색어를 입력하세요" />
                <button>검색</button>
            </div>
        </div>
        <div class="sidebar">
            <ul class="ul">
                <li><a href="#">2023기</a></li>
                <li><a href="#">2022기</a></li>
                <li><a href="#">2021기</a></li>
                <li><a href="#">2020기</a></li>
                <li><a href="#">2019기</a></li>
            </ul>
        </div>
        <div class="main-content">
            <div class="artist-list">
                <div class="artist-item">
                    <img src="resources/images/artist1.jpg" alt="작가 이미지 1">
                    <h2>작가명 1</h2>
                    <p>작가소개 1</p>
                </div>
                <div class="artist-item">
                    <img src="resources/images/artist2.jpg" alt="작가 이미지 2">
                    <h2>작가명 2</h2>
                    <p>작가소개 2</p>
                </div>
                <div class="artist-item">
                    <img src="resources/images/artist3.jpg" alt="작가 이미지 3">
                    <h2>작가명 3</h2>
                    <p>작가소개 3</p>
                </div>
                <div class="artist-item">
                    <img src="resources/images/artist4.jpg" alt="작가 이미지 4">
                    <h2>작가명 4</h2>
                    <p>작가소개 4</p>
                </div>
                <div class="artist-item">
                    <img src="resources/images/artist5.jpg" alt="작가 이미지 5">
                    <h2>작가명 5</h2>
                    <p>작가소개 5</p>
                </div>
                <div class="artist-item">
                    <img src="resources/images/artist6.jpg" alt="작가 이미지 6">
                    <h2>작가명 6</h2>
                    <p>작가소개 6</p>
                </div>
            </div>
            <div class="pagination">
                <a href="#" class="prev">«</a>
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#" class="next">»</a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />

</body>
</html>
