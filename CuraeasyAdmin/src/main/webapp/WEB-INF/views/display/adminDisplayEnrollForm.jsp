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
    <title>전시 추가</title>
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
        .form-control-file {
            margin-top: 10px;
        }
        .btn-primary {
            width: 100px;
            margin-top: 20px;
        }
        .preview {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }
        .preview img {
            max-width: 150px;
            margin-top: 10px;
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
                <div class="container">
                    <h1 class="mt-4">전시 추가</h1>
                    <form action="${path}/addDisplay.ad" method="post" enctype="multipart/form-data">
                        <div class="form-group mb-3">
                            <label for="displayName">전시명</label>
                            <input type="text" class="form-control" id="displayName" name="displayName" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="displayContent">내용</label>
                            <textarea class="form-control" id="displayContent" name="displayContent" rows="3" required></textarea>
                        </div>
                        <div class="form-group mb-3">
                            <label for="displayStartDate">시작일</label>
                            <input type="date" class="form-control" id="displayStartDate" name="displayStartDate" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="displayEndDate">종료일</label>
                            <input type="date" class="form-control" id="displayEndDate" name="displayEndDate" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="displayPrice">가격</label>
                            <input type="number" class="form-control" id="displayPrice" name="displayPrice" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="displayStatus">상태</label>
                            <select class="form-control" id="displayStatus" name="displayStatus" required>
                                <option value="예정">예정</option>
                                <option value="진행">진행</option>
                                <option value="종료">종료</option>
                                <option value="폐기">폐기</option>
                            </select>
                        </div>
                        <div class="form-group mb-3">
                            <label for="artistNickName">작가명</label>
                            <input type="text" class="form-control" id="artistNickName" name="artistNickName" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="galleryName">전시관명</label>
                            <input type="text" class="form-control" id="galleryName" name="galleryName" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="attachments">첨부파일 추가</label>
                            <input type="file" class="form-control-file" id="attachments" name="attachments" multiple>
                        </div>
                        <div class="form-group mb-3">
                            <label>첨부파일 미리보기</label>
                            <div id="preview" class="preview"></div>
                        </div>
                        <button type="submit" class="btn btn-primary">추가하기</button>
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

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            document.getElementById('attachments').addEventListener('change', function(event) {
                const files = event.target.files;
                const preview = document.getElementById('preview');
                preview.innerHTML = '';
                for (const file of files) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        const img = document.createElement('img');
                        img.src = e.target.result;
                        preview.appendChild(img);
                    };
                    reader.readAsDataURL(file);
                }
            });
        });
    </script>
</body>
</html>
