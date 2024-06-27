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
    <title>대관 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${path}/resources/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        .form-group label {
            font-weight: bold;
        }
    </style>
</head>

<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <a class="navbar-brand ps-3" href="${path}/admin.ad">관리자 페이지</a>
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"><i class="fas fa-bars"></i></button>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <%@ include file="../common/adminNav.jsp" %>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container">
                    <h1 class="mt-4">대관 정보 수정</h1>
                    <form action="${path}/updateRental.ad" method="post">
                        <input type="hidden" name="rentalNo" value="${rental.rentalNo}" />
                        <div class="form-group mb-3">
                            <label for="rentalStartDate">대관 시작일</label>
                            <input type="date" class="form-control" id="rentalStartDate" name="rentalStartDate" value="${rental.rentalStartDate}" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="rentalEndDate">대관 종료일</label>
                            <input type="date" class="form-control" id="rentalEndDate" name="rentalEndDate" value="${rental.rentalEndDate}" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="rentalStatus">대관 상태</label>
                            <select class="form-control" id="rentalStatus" name="rentalStatus" required>
                                <option value="Y" ${rental.rentalStatus == 'Y' ? 'selected' : ''}>대관중</option>
                                <option value="N" ${rental.rentalStatus == 'N' ? 'selected' : ''}>취소됨</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">수정하기</button>
                        <button type="button" class="btn btn-secondary" onclick="history.back();">취소하기</button>
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
