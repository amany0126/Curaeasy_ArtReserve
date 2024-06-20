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
    <title>Exhibition Detail</title>
    
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table th, table td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }
        table th {
            background-color: #f2f2f2;
            color: #333;
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
                    <h1 class="mt-4">📅 전시회 상세 보기</h1>
                    <div class="container">
                        <table>
                            <tr>
                                <th>전시번호</th>
                                <td>${display.displayNo}</td>
                            </tr>
                            <tr>
                                <th>전시명</th>
                                <td>${display.displayName}</td>
                            </tr>
                            <tr>
                                <th>내용</th>
                                <td>${display.displayContent}</td>
                            </tr>
                            <tr>
                                <th>시작일</th>
                                <td>${display.displayStartDate}</td>
                            </tr>
                            <tr>
                                <th>종료일</th>
                                <td>${display.displayEndDate}</td>
                            </tr>
                            <tr>
                                <th>가격</th>
                                <td>${display.displayPrice}</td>
                            </tr>
                            <tr>
                                <th>상태</th>
                                <td>${display.displayStatus}</td>
                            </tr>
                        	<tr>
                                <th>작가명</th>
                                <td>${display.artistNickName}</td>
                            </tr>
                            <tr>
                                <th>전시관명</th>
                                <td>${display.galleryName}</td>
                            </tr>
                            <tr>
                                <th>이미지 경로</th>
                                <td>${display.imagePath}</td>
                            </tr>
                        </table>
  
                    </div>
                                        <div class="button-container">
                            <form action="${path}/updateDisplayForm.ad" method="get" style="display:inline;">
                                <input type="hidden" name="displayNo" value="${display.displayNo}">
                                <button type="submit">수정하기</button>
                            </form>
                            <form action="${path}/deleteDisplay.ad" method="post" style="display:inline;" onsubmit="return confirm('정말 삭제하시겠습니까?');">
                                <input type="hidden" name="displayNo" value="${display.displayNo}">
                                <button type="submit">삭제하기</button>
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
