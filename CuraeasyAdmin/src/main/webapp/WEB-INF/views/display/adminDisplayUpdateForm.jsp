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
        .btn-primary, .btn-danger {
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
                    <h1 class="mt-4">전시 수정</h1>
                    <form action="${path}/updateDisplay.ad" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="displayNo" value="${display.displayNo}" />
                        <div class="form-group mb-3">
                            <label for="displayName">전시명</label>
                            <input type="text" class="form-control" id="displayName" name="displayName" value="${display.displayName}" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="displayContent">내용</label>
                            <textarea class="form-control" id="displayContent" name="displayContent" rows="3" required>${display.displayContent}</textarea>
                        </div>
                        <div class="form-group mb-3">
                            <label for="displayStartDate">시작일</label>
                            <input type="date" class="form-control" id="displayStartDate" name="displayStartDate" value="${display.displayStartDate}" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="displayEndDate">종료일</label>
                            <input type="date" class="form-control" id="displayEndDate" name="displayEndDate" value="${display.displayEndDate}" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="displayPrice">가격</label>
                            <input type="number" class="form-control" id="displayPrice" name="displayPrice" value="${display.displayPrice}" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="displayStatus">상태</label>
                            <select class="form-control" id="displayStatus" name="displayStatus" required>
                                <option value="예정" ${display.displayStatus == '예정' ? 'selected' : ''}>예정</option>
                                <option value="진행" ${display.displayStatus == '진행' ? 'selected' : ''}>진행</option>
                                <option value="종료" ${display.displayStatus == '종료' ? 'selected' : ''}>종료</option>
                                <option value="폐기" ${display.displayStatus == '폐기' ? 'selected' : ''}>폐기</option>
                            </select>
                        </div>
                        <div class="form-group mb-3">
                            <label for="artistNickName">작가명</label>
                            <input type="text" class="form-control" id="artistNickName" name="artistNickName" value="${display.artistNickName}" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="galleryName">전시관명</label>
                            <input type="text" class="form-control" id="galleryName" name="galleryName" value="${display.galleryName}" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="attachments">첨부파일 추가</label>
                            <input type="file" class="form-control-file" id="attachments" name="attachments" multiple>
                        </div>
                        <div class="form-group mb-3">
                            <label>현재 첨부파일</label>
                            <c:forEach var="attachment" items="${attachments}">
                                <div class="attachment-item">
                                    <img src="${path}/resources/attachment_image/${attachment.changeName}" alt="${attachment.originName}">
                                    <p>${attachment.originName}</p>
                                    <button type="button" class="btn btn-danger btn-delete-attachment" data-attachment-no="${attachment.attachmentNo}">삭제</button>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="form-group mb-3">
                            <label>첨부파일 미리보기</label>
                            <div id="preview" class="preview"></div>
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

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            document.querySelectorAll('.btn-delete-attachment').forEach(button => {
                button.addEventListener('click', function() {
                    if (confirm('정말 이 파일을 삭제하시겠습니까?')) {
                        const attachmentNo = this.dataset.attachmentNo;
                        fetch('${path}/deleteAttachment.ad', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify({ attachmentNo: attachmentNo })
                        })
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                this.closest('.attachment-item').remove();
                            } else {
                                alert('파일 삭제에 실패했습니다.');
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                        });
                    }
                });
            });

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
