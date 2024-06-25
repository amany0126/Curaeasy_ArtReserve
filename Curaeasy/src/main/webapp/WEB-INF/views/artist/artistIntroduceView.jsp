<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--폰트-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

    <title>입주작가</title>
    <style>
        h1{
      
        }
        body {
            margin: 0;
            padding: 0;
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


            /* 폰트 */
            font-family: "Do Hyeon", sans-serif;
            font-weight: 400;
            font-size :larger;
            font-style :oblique;
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
        </div>
        <div class="sidebar">
            <ul class="ul">
           		<c:set var='ordinal' value='9999' />
            	<c:forEach items='${requestScope.list}' var="item">
           			<c:if test="${ ordinal ne item.artistOrdinal }">
           				<li><a href="javascript:void(0)">${ item.artistOrdinal }기</a></li>
           				<c:set var='ordinal' value='${item.artistOrdinal}' />
           			</c:if>
                </c:forEach>
            </ul>
        </div>
        <div class="main-content">
            <div class="artist-list">
            	<c:set var='ordinal' value='${requestScope.list[0].artistOrdinal}' />
	            	<c:forEach items='${requestScope.list}' var="item">
	           			<c:if test="${ ordinal eq item.artistOrdinal }">
	           				<div class="artist-item">
			                    <img src="resources/artistProfileImgs/${ item.artistImage }" alt="작가 이미지 1">
			                    <h2>${ item.artistNickName }</h2>
			                    <p>${ item.artistIntroduce }</p>
			                </div>
	           			</c:if>
	                </c:forEach>
            </div>
        </div>
    </div>
</div>
<script>
    $(".sidebar a").click(function(event) {
        const list = JSON.parse('${jsonList}');
        const ordinal = event.target.innerText.replace("기", "");

        $(".artist-list").empty();

        list.forEach(e => {
            if(e.artistOrdinal == ordinal){
                $e = $("<div class=artist-item></div>");
                $e.append($('<img src="resources/artistProfileImgs/' + e.artistImage + '" alt="작가 이미지 1">'))
                $e.append($('<h2>' + e.artistNickName + '</h2>'))
                $e.append($('<p>' + e.artistIntroduce + '</p>'))
                $(".artist-list").append($e);
            }
        });

        
    })
</script>

<jsp:include page="../common/footer.jsp" />
</body>
</html>
