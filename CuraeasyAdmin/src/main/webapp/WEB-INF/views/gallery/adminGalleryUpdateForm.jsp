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
    <title>전시관 수정</title>
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
        .btn-primary {
            width: 100px;
            margin-top: 20px;
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
                    <h1 class="mt-4">전시관 수정</h1>
                    <form action="${path}/updateGallery.ad" method="post">
                        <input type="hidden" name="galleryNo" value="${gallery.galleryNo}" />
                        <div class="form-group mb-3">
                            <label for="galleryName">전시관명</label>
                            <input type="text" class="form-control" id="galleryName" name="galleryName" value="${gallery.galleryName}" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="galleryPlace">위치</label>
                            <input type="text" class="form-control" id="galleryPlace" name="galleryPlace" value="${gallery.galleryPlace}" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="galleryInfo">설명</label>
                            <textarea class="form-control" id="galleryInfo" name="galleryInfo" rows="3" required>${gallery.galleryInfo}</textarea>
                        </div>
                        <div class="form-group mb-3">
                            <label for="galleryType">종류</label>
                            <select class="form-control" id="galleryType" name="galleryType" required>
                                <option value="소형관" ${gallery.galleryType == '소형관' ? 'selected' : ''}>소형관</option>
                                <option value="중형관" ${gallery.galleryType == '중형관' ? 'selected' : ''}>중형관</option>
                                <option value="대형관" ${gallery.galleryType == '대형관' ? 'selected' : ''}>대형관</option>
                            </select>
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
