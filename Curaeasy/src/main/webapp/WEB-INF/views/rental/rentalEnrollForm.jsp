<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>대관신청</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
        }
        .header, .footer {
            background-color: #f8f8f8;
            padding: 20px;
            text-align: center;
        }
        .content {
            padding: 20px;
        }
        .content-header {
            margin-bottom: 20px;
        }
        .content-header h1 {
            font-size: 2em;
            margin: 0 0 10px 0;
        }
        .facility-item {
            display: flex;
            margin-bottom: 20px;
        }
        .facility-item img {
            width: 300px;
            height: 200px;
            object-fit: cover;
            margin-right: 20px;
        }
        .facility-details {
            flex: 1;
        }
        .facility-details h2 {
            margin-top: 0;
        }
        .facility-buttons {
            display: flex;
            margin-top: 10px;
        }
        .facility-buttons button {
            padding: 10px 20px;
            margin-right: 10px;
            border: 1px solid #ccc;
            background-color: #333;
            color: #fff;
            cursor: pointer;
        }
        hr {
            border: none;
            border-top: 2px solid #ddd;
            margin: 20px 0;
        }
    </style>
</head>
<body>

<jsp:include page="../common/header.jsp" />

<div class="container">
    <div class="content">
        <div class="content-header">
            <h1>대관신청</h1>
        </div>
        <div class="facility-item">
            <img src="resources/images/gallery1.png">
            <div class="facility-details">
                <h2>전시장 1</h2>
                <p>전시실 B1은 약 1,000평 규모의 전시공간으로 최첨단 조명 시스템을 갖추고 있습니다. 인천아트플랫폼의 가장 큰 전시공간으로, 현대미술부터 전통공예까지 다양한 장르의 작품을 전시할 수 있습니다. 자연광이 들어오는 전면 유리창을 통해 아름다운 전경을 감상할 수 있습니다.</p>
                <div class="facility-buttons">
                    <button>공간안내</button>
                    <button>상세보기</button>
                </div>
            </div>
        </div>
        <hr>
        <div class="facility-item">
            <img src="resources/images/gallery2.png">
            <div class="facility-details">
                <h2>전시장 2</h2>
                <p>공연장 C는 약 300석 규모의 공연장으로 연극, 무용, 콘서트 등 다양한 공연을 개최할 수 있는 공간입니다. 최신 음향 시스템과 조명 장비를 갖추고 있으며, 관객석과 무대가 가깝게 배치되어 보다 가까운 감동을 선사할 수 있습니다.</p>
                <div class="facility-buttons">
                    <button>공간안내</button>
                    <button>상세보기</button>
                </div>
            </div>
        </div>
        <hr>
        <div class="facility-item">
            <img src="resources/images/gallery3.png">
            <div class="facility-details">
                <h2>E1 전시장 2</h2>
                <p>전시실 E1은 인천아트플랫폼의 중간규모 전시공간으로 회화, 사진, 조각 등 다양한 장르의 전시가 가능합니다. 높은 천장과 넓은 벽면을 활용하여 대형 작품도 전시할 수 있으며, 특히 야간 전시를 위한 조명 시스템이 잘 갖추어져 있습니다.</p>
                <div class="facility-buttons">
                    <button>공간안내</button>
                    <button>상세보기</button>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />

</body>
</html>
