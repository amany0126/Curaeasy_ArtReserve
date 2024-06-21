<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>전시 수정</title>
    <link href="${path}/resources/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="${path}/resources/js/scripts.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 95%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: left;
            color: #333;
        }
        .table-responsive {
            margin-top: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table th, table td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        table th {
            background-color: #007bff;
            color: white;
        }
        table td {
            background-color: #f8f9fc;
        }
        table tr:nth-child(even) {
            background-color: #f1f1f1;
        }
        table tr:nth-child(odd) {
            background-color: #f8f9fc;
        }
        table tr:hover {
            background-color: #d1d3e2;
            cursor: pointer;
        }
        .truncate {
            max-width: 200px; /* Adjust the width as needed */
        }
        .btn-add-exhibition {
            margin-right: 10px;
        }
        .search-bar {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-bottom: 10px;
        }
        .search-bar input {
            margin-right: 10px;
            width: 200px; /* Adjust the width as needed */
        }
        .search-bar select {
            margin-right: 10px;
            width: 150px; /* Adjust the width as needed */
        }
        .search-bar button {
            margin-right: 5px;
        }
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            list-style: none;
            padding: 0;
        }
        .pagination li {
            margin: 0 5px;
        }
        .pagination a {
            display: block;
            padding: 8px 16px;
            text-decoration: none;
            color: #007bff;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .pagination a:hover {
            background-color: #007bff;
            color: white;
        }
        .pagination a.disabled {
            color: #ddd;
            pointer-events: none;
            cursor: default;
        }
   
        .pagination a.active {
            background-color: #007bff;
            color: white;
            border-color: #007bff;
        }
        /* 테이블 배경색 흰색으로 설정 */
        #datatablesSimple {
            background-color: white;
        }

        /* 테이블 요소 중앙 정렬 */
        #datatablesSimple th, #datatablesSimple td {
            text-align: center;
            vertical-align: middle;
        }
    </style>
</head>

<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="${path}/">관리자 페이지</a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"><i class="fas fa-bars"></i></button>
        <!-- Logout Button-->
        <div class="ms-auto me-0 me-md-3 my-2 my-md-0">
            <!--  <button class="logout-button" onclick="logout()">나가기</button> -->
        </div>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <%@ include file="../common/adminNav.jsp" %>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">전시 수정</h1>
                    <form action="${path}/updateDisplay.ad" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="displayNo" value="${display.displayNo}" />
                        <div class="form-group">
                            <label for="displayName">전시명</label>
                            <input type="text" class="form-control" id="displayName" name="displayName" value="${display.displayName}" required>
                        </div>
                        <div class="form-group">
                            <label for="displayContent">내용</label>
                            <textarea class="form-control" id="displayContent" name="displayContent" rows="3" required>${display.displayContent}</textarea>
                        </div>
                        <div class="form-group">
                            <label for="displayStartDate">시작일</label>
                            <input type="date" class="form-control" id="displayStartDate" name="displayStartDate" value="${display.displayStartDate}" required>
                        </div>
                        <div class="form-group">
                            <label for="displayEndDate">종료일</label>
                            <input type="date" class="form-control" id="displayEndDate" name="displayEndDate" value="${display.displayEndDate}" required>
                        </div>
                        <div class="form-group">
                            <label for="displayPrice">가격</label>
                            <input type="number" class="form-control" id="displayPrice" name="displayPrice" value="${display.displayPrice}" required>
                        </div>
                        <div class="form-group">
                            <label for="displayStatus">상태</label>
                            <select class="form-control" id="displayStatus" name="displayStatus" required>
                                <option value="예정" ${display.displayStatus == '예정' ? 'selected' : ''}>예정</option>
                                <option value="진행" ${display.displayStatus == '진행' ? 'selected' : ''}>진행</option>
                                <option value="종료" ${display.displayStatus == '종료' ? 'selected' : ''}>종료</option>
                                <option value="폐기" ${display.displayStatus == '폐기' ? 'selected' : ''}>폐기</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="artistNickName">작가명</label>
                            <input type="text" class="form-control" id="artistNickName" name="artistNickName" value="${display.artistNickName}" required>
                        </div>
                        <div class="form-group">
                            <label for="galleryName">전시관명</label>
                            <input type="text" class="form-control" id="galleryName" name="galleryName" value="${display.galleryName}" required>
                        </div>
                        <button type="submit" class="btn btn-primary">수정하기</button>
                    </form>
                </div>
            </main>
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">CURAEASY &copy; our ArtHall 2024</div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
</body>
</html>
