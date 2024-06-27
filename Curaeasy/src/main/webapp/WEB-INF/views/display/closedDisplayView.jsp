<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Grandiflora+One&display=swap" rel="stylesheet">

    <title>현재 전시</title>
    <style>
        .container {
            max-width: 100%;
            margin: auto; margin-top: 50px; margin-bottom: 50px;
            padding: 20px;
            margin-bottom: 50px;
        }
        .header, .footer {
            background-color: #f8f8f8;
            padding: 20px;
            text-align: center;
        }
        .content {
            padding: 0px;
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
            margin-bottom: 100px;
        }
        .exhibition-item img {
            width: 100%;
            height: 400px;
            object-fit: cover;
            border-radius: 20px;
            border-style: ridge;
            transition: filter 0.3s ease;
        }
        .exhibition-item img:hover{
            filter: blur(1px);
            box-shadow: 0 0 10px gray;
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
        .search-box input,button { border-radius: 20px !important}


    </style>
</head>
<body>

<jsp:include page="../common/header.jsp" />

<div class="container">
    <div class="content">
        <div class="tab-menu">
            <a href="onDisplay.do">현재전시</a>
            <a href="upcomingDisplay.do">예정전시</a>
            <a href="offDisplay.do" class="active">지난전시</a>
        </div>
        <div class="content-header">
            <h1>마감된 전시</h1>
        </div>
        <div class="exhibition-list">
            <c:forEach var="exhibition" items="${ list }">
                <div class="exhibition-item">
                	<!-- <div style="text-align: right"><button name="${ exhibition.displayNo }" class="btn btn-outline-dark" onclick="likeCheck(this);">❤ ${ exhibition.likeCount }</button></div> -->
                    <!-- <a href="displayDetail.do?dno=${exhibition.displayNo}" style="text-decoration: none; color: black;" > -->
                        <img src="<c:url value='/resources/display/${exhibition.imagePath}' />" alt="전시 이미지">
                        <h2>${ exhibition.displayName }</h2>
                        <p>${ exhibition.displayContent }</p>
                        <p>${ exhibition.displayStartDate } ~ ${ exhibition.displayEndDate }</p>
                    </a>
                </div>
            </c:forEach>
            <c:if test="${ empty list }">
                <div class="no-exhibition">종료된 전시가 없습니다.</div>
            </c:if>
        </div>
    </div>
</div>

<script>
    $(function() {

        if("${sessionScope.loginUser}" === ""){
            return false;
        }

        let displayNoList = ${requestScope.displayNoList}

        displayNoList.forEach(function(element, index) {
            let btn = $("button[name=" + element + "]")[0];
            if(btn != undefined){
                btn.className = "btn btn-danger";
            }
        });

        if(displayNoList.length == 0){
            return false;
        }        
    });
</script>

<jsp:include page="../common/footer.jsp" />

</body>
</html>
