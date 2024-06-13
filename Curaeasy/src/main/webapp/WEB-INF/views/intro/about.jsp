<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>curaeasy</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
            background-color: #f2f2f2;
        }
        .main-section {
            margin-top: 60px;
            text-align: center;
        }
        .main-section h1 {
            font-size: 36px;
            margin-bottom: 0px;
        }
        .main-section p {
            font-size: 18px;
            line-height: 1.6;
            margin-bottom: 40px;
        }



        .features-section, .gallery-section {
            padding: 0px;
            text-align: center;
        }
        .features-section h2, .gallery-section h2 {
            margin-bottom: 20px;
        }
        .feature, .gallery-item {
            display: inline-block;
            width: 300px;
            margin: 20px;
            border: 1px solid #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 10px gray;
        }
        .feature img, .gallery-item img {
            width: 100%;
            height: auto;
        }
        .gallery-item {
            width: 800px;
        }
        .gallery-item iframe {
            width: 100%;
            height: auto;
            aspect-ratio: 16 / 9; /* 이건 비율조정이야*/
            border: none;
        }
        #Introduction { 
            margin:auto;
            text-align: left;
            width : 45%;
            margin-bottom: 100px;
        }
        .feature { margin-bottom: 100px;}

    </style>
</head>
<body>

<jsp:include page="../common/header.jsp" />



    <div class="main-section">
        <h1>CURAEASY Introduction</h1>
        <p>
            KH파이널 프로젝트를 통해 이번에 전시회를 열게된 CURAEASY 입니다<br><br>
            
            국내에서 처음으로 유네스코 미디어아트 창의로 선정될 아트홀은 <br>
            창의벨트, 미디어아트 플랫폼 조성, 미디어아트 플랫폼 파사드 콘텐츠 개발, 미디어아트 페스티벌 개최 등<br>
            ‘미디어아트’를 통해 예술과 삶의 연결을 주도하는 문화산업 도시로서의 기반을 구축할것입니다.<br><br>                   
        </p>     
    </div>
    
    <div class="gallery-section">
        <h2>작품 갤러리</h2>
        <div class="gallery-item">
            <iframe src="https://www.youtube.com/embed/UsOLPFme6IQ?autoplay=1&mute=1" frameborder="0" allowfullscreen></iframe>
        </div>
    </div>
    <div id="Introduction">
        <p>
            아트플랫폼은 예술 작품을 전시하고 창작자들을 연결하는 플랫폼입니다. <br>
            다양한 작품을 감상하고 창작자와 소통할 수 있습니다.
            저희 아트홀 에서는 예술 작품을 전시하고 창작자들을 연결하는 플랫폼입니다. 다양한 작품을 감상하고 창작자와 소통할 수 있습니다</p>
    </div>

    <div class="features-section">
        <h2>갤러리 평면도</h2>
        <div class="feature">
            <img src="http://gmap.gwangju.go.kr/html/img/0204_11F.png" alt="FloorPlan1">
            <p>작품 전시</p>
        </div>
        <div class="feature">
            <img src="http://gmap.gwangju.go.kr/html/img/0204_12F.png" alt="FloorPlan2">
            <p>예술 강연</p>
        </div>
        <div class="feature">
            <img src="http://gmap.gwangju.go.kr/html/img/0204_13F.png" alt="FloorPlan3">
            <p>창작자 커뮤니티</p>
        </div>
    </div>

<jsp:include page="../common/footer.jsp" />

</body>
</html>
