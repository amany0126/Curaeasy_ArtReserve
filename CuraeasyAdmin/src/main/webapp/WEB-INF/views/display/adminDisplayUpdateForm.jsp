<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Exhibition Update</title>
    
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="${path}/resources/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <script src="${path}/resources/js/scripts.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 95%;
            margin: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px black;
            padding: 20px;
            border-radius: 10px;
        }
        h1 {
            text-align: left;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        .form-group input, .form-group select, .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .form-group textarea {
            height: 100px;
            resize: vertical;
        }
        .button-container {
            margin-top: 20px;
            text-align: center;
        }
        .button-container button {
            margin: 0 10px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
</head>

<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <a class="navbar-brand ps-3" href="${path}/">관리자 페이지</a>
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"><i class="fas fa-bars"></i></button>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <%@ include file="../common/adminNav.jsp" %>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">📅 전시회 수정</h1>
                    <div class="container">
                        <form action="${path}/updateDisplay.ad" method="post">
                            <input type="hidden" name="displayNo" value="${display.displayNo}">
                            <div class="form-group">
                                <label for="displayName">전시명</label>
                                <input type="text" id="displayName" name="displayName" value="${display.displayName}" required>
                            </div>
                            <div class="form-group">
                                <label for="displayContent">내용</label>
                                <textarea id="displayContent" name="displayContent" required>${display.displayContent}</textarea>
                            </div>
                            <div class="form-group">
                                <label for="displayStartDate">시작일</label>
                                <input type="date" id="displayStartDate" name="displayStartDate" value="${display.displayStartDate}" required>
                            </div>
                            <div class="form-group">
                                <label for="displayEndDate">종료일</label>
                                <input type="date" id="displayEndDate" name="displayEndDate" value="${display.displayEndDate}" required>
                            </div>
                            <div class="form-group">
                                <label for="displayPrice">가격</label>
                                <input type="number" id="displayPrice" name="displayPrice" value="${display.displayPrice}" required>
                            </div>
                            <div class="form-group">
                                <label for="displayStatus">상태</label>
                                <select id="displayStatus" name="displayStatus" required>
                                    <option value="예정" <c:if test="${display.displayStatus == '예정'}">selected</c:if>>예정</option>
                                    <option value="진행" <c:if test="${display.displayStatus == '진행'}">selected</c:if>>진행</option>
                                    <option value="종료" <c:if test="${display.displayStatus == '종료'}">selected</c:if>>종료</option>
                                    <option value="폐기" <c:if test="${display.displayStatus == '폐기'}">selected</c:if>>폐기</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="artistNo">작가번호</label>
                                <input type="number" id="artistNo" name="artistNo" value="${display.artistNo}" required>
                            </div>
                            <div class="form-group">
                                <label for="galleryNo">전시관번호</label>
                                <input type="number" id="galleryNo" name="galleryNo" value="${display.galleryNo}" required>
                            </div>
                            <div class="form-group">
                                <label for="imagePath">이미지 경로</label>
                                <input type="text" id="imagePath" name="imagePath" value="${display.imagePath}">
                            </div>
                            <div class="button-container">
                                <button type="submit">수정하기</button>
                                <a href="${path}/displayDetail.ad?displayNo=${display.displayNo}" class="btn btn-secondary">취소</a>
                            </div>
                        </form>
                    </div>
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
