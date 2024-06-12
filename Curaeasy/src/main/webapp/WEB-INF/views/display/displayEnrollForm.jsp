<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Include Flatpickr CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <title>전시신청</title>
    <style>
        .form-container {
            border: 1px solid lightgray;
            width: 60%;
            margin: auto;
            padding: 2rem;
            background-color: white;
        }
        .form-group {
            margin-bottom: 1.5rem;
        }
        .form-group label {
            font-weight: bold;
            display: block;
            margin-bottom: 0.5rem;
        }
        .form-group input,
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 0.5rem;
            margin-top: 0.5rem;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
        }
        .form-group input[type="file"] {
            padding: 0.2rem;
        }
        .form-header {
            margin-bottom: 1.5rem;
        }
        .form-footer {
            text-align: right;
        }
        .form-section-title {
            font-weight: bold;
            margin-bottom: 1rem;
            border-bottom: 2px solid #000;
            padding-bottom: 0.5rem;
        }
        .form-inline {
            display: flex;
            justify-content: space-between;
        }
        .form-inline .form-group {
            flex: 1;
            margin-right: 1rem;
        }
        .form-inline .form-group:last-child {
            margin-right: 0;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp" />

<div class="container">
    <div class="form-container">
        <h3 class="form-header">전시신청</h3>
        <hr>
        <form action="submitExhibition.jsp" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="exhibitionName">전시명:</label>
                <input type="text" id="exhibitionName" name="exhibitionName" required maxlength="300">
            </div>
            <div class="form-group">
                <label for="exhibitionDescription">전시설명:</label>
                <textarea id="exhibitionDescription" name="exhibitionDescription" required maxlength="900" rows="5"></textarea>
            </div>
            <div class="form-section-title">전시 기간</div>
            <div class="form-inline">
                <div class="form-group">
                    <label for="startDate">전시 시작일:</label>
                    <input type="text" id="startDate" name="startDate" class="datepicker" required>
                </div>
                <div class="form-group">
                    <label for="endDate">전시 종료일:</label>
                    <input type="text" id="endDate" name="endDate" class="datepicker" required>
                </div>
            </div>
            <div class="form-group">
                <label for="exhibitionPrice">전시가격:</label>
                <input type="text" id="exhibitionPrice" name="exhibitionPrice" required placeholder="원단위로 입력해주세요 ex) 30000">
            </div>
            <div class="form-section-title">첨부 파일</div>
            <div class="form-group">
                <label for="thumbnail">썸네일 첨부파일:</label>
                <input type="file" id="thumbnail" name="thumbnail" accept="image/*" required>
            </div>
            <div class="form-group">
                <label for="detailFile1">상세 첨부파일 1:</label>
                <input type="file" id="detailFile1" name="detailFile1" accept="image/*">
            </div>
            <div class="form-group">
                <label for="detailFile2">상세 첨부파일 2:</label>
                <input type="file" id="detailFile2" name="detailFile2" accept="image/*">
            </div>
            <div class="form-group">
                <label for="detailFile3">상세 첨부파일 3:</label>
                <input type="file" id="detailFile3" name="detailFile3" accept="image/*">
            </div>
            <div class="form-group">
                <label for="detailFile4">상세 첨부파일 4:</label>
                <input type="file" id="detailFile4" name="detailFile4" accept="image/*">
            </div>
            <div class="form-footer">
                <button type="submit" class="btn btn-primary">제출</button>
            </div>
        </form>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />

<!-- Include Flatpickr JS -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script>
    // Initialize Flatpickr on date input fields
    flatpickr(".datepicker", {
        dateFormat: "Y-m-d"
    });

    function checkAvailability() {
        // Add your availability checking logic here
        alert('대관 가능 여부 확인 기능은 구현되지 않았습니다.');
    }
</script>
</body>
</html>
