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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${path}/resources/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${path}/resources/js/scripts.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>   
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
        .attachment-item {
            display: flex;
            align-items: center;
            margin-top: 10px;
        }
        .attachment-item img {
            max-width: 100px;
            margin-right: 10px;
        }
        .attachment-item p {
            margin: 0;
            flex: 1;
        }
        .attachment-item button {
            margin-left: 10px;
        }
        .btn-primary, .btn-danger,.btn-secondary {
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
                    <h1 class="mt-4">공지사항 수정</h1>
                    <form action="${path}/noticeUpdate.ad" method="post" enctype="multipart/form-data" >
                        <input type="hidden" name="noticeNo" value="${ requestScope.noticeList.noticeNo}" />
                        <div class="form-group mb-3">
                            <label for="noticeTitle">제목</label>
                            <input type="text" class="form-control" id="noticeTitle" name="noticeTitle" value="${ requestScope.noticeList.noticeTitle}" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="noticeContent">내용</label>
                            <textarea class="form-control" id="noticeContent" name="noticeContent" rows="3" required>${ requestScope.noticeList.noticeContent}</textarea>
                        </div>

                    
	                        <div class="form-group mb-3" ">
	                            <label>첨부파일 미리보기</label> <br>
	                            <img src="../../../curaeasy/resources/notice/${requestScope.noticeList.noticeAttachment}" width="200px" alt="프로필이미지" id="preview1" class="rounded" ><br>
	                            <input type="file" class="form-control-file " id="reUpfile" name="reUpfile" onchange="loadImg(this, 1)" accept="image/png, image/jpeg"   style="display: none;" > <br> 
	                        </div>
	                       
                       
                         <div class="form-group mb-3" align="center">
                            <button type="submit" class="btn btn-primary">수정하기</button>
                        	<button type="button" class="btn btn-secondary" onclick="history.back();">취소하기</button>
                        </div>
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
            $(function(){
        		$("#preview1").click(function(){
        			$("#reUpfile").click();
        		});
        	
        	});
        	function loadImg(inputFile, num) {
        		if(inputFile.files.length == 1){
        			let reader = new FileReader();
        			reader.readAsDataURL(inputFile.files[0]);
        			reader.onload=function(e){
        				switch(num){
        				case 1 : $("#preview1").attr("src",e.target.result); 
        				break
        			}
        		};
        		}else{
        			switch(num){
        				case 1 : $("#preview1").attr("src","../../../curaeasy/resources/notice/${requestScope.noticeList.noticeAttachment}"); 
        				break
        			}
        		}
        	};
    </script>
</body>
</html>
