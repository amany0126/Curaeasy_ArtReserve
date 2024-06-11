<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>curaeasy</title>
    <style>
        body { margin: 0; padding: 0; font-family: Arial, sans-serif; }
        .content { padding: 20px; max-width: 1200px; margin: auto; }
        .image-container { text-align: center; margin-bottom: 20px; }
        .image-container img { max-width: 100%; height: auto; }
        .text-container { text-align: center; }
        .text-container h2 { font-size: 24px; margin-bottom: 20px; }
        .text-container p { font-size: 16px; line-height: 1.5; margin-bottom: 20px; }
    </style>
</head>
<body>

<jsp:include page="../common/header.jsp" />

<div class="content">
    <div class="text-container">
        <h2>curaeasy 소개</h2>
        <p>인천이 지향하는 문화의 꿈을 실현해 가는 문화예술의 창작공간, 인천아트플랫폼</p>
    </div>
    <div class="image-container">
        <img src="resources/images/img2.jpg" alt="Image 1">
    </div>
    <div class="image-container">
        <img src="resources/images/img3.jpg" alt="Image 2">
    </div>
</div>

<jsp:include page="../common/footer.jsp" />

</body>
</html>
