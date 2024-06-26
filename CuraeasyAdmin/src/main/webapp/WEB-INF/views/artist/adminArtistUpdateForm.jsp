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
    <title>작가 정보 수정</title>
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
        .btn-primary, .btn-secondary {
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
                    <h1 class="mt-4">작가 정보 수정</h1>
                    <form action="${path}/updateArtist.ad" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="artistNo" value="${artist.artistNo}" />
                        <div class="form-group mb-3">
                            <label for="artistNickName">예명</label>
                            <input type="text" class="form-control" id="artistNickName" name="artistNickName" value="${artist.artistNickName}" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="artistIntroduce">소개</label>
                            <textarea class="form-control" id="artistIntroduce" name="artistIntroduce" rows="3" required>${artist.artistIntroduce}</textarea>
                        </div>
                        <div class="form-group mb-3">
                            <label for="artistImage">썸네일 이미지</label>
                            <input type="file" class="form-control-file" id="artistImage" name="artistImage" onchange="loadImg(this, 1)">
                            <div class="preview">
                            	<img src="../../../curaeasy/resources/resources/artist_images/$" alt="">
                            </div>
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
    <script>
    function loadImg(inputFile, num) {
        if (inputFile.files && inputFile.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#artistPreviewImage').attr('src', e.target.result);
            }
            reader.readAsDataURL(inputFile.files[0]);
        }
    }
    </script>
</body>
</html>
