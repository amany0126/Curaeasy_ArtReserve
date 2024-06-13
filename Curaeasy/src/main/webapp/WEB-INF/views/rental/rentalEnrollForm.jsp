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
         <div class="coronation">
            <div class="img">
                <img src="image1.jpg" alt="제 1 전시장 이미지">
            </div>
            <div class="information">
                <p><b>제 1 전시장</b></p>
                <p>A동 1층 전시장 1은 지상 1, 2층에 걸친 약 200평의 규모를 갖추고 있습니다. 인천아트플랫폼에서 가장 규모가 큰 전시장으로 문화체육광관부 1종 미술관으로 등록되어 있습니다. 주로 인천아트플랫폼 자체 기획전시를 개최하고 있으며, 별도 로비 공간이 있습니다. 규모가 큰 개인전과 그룹 전시에 적합한 전시 공간입니다.</p>
                <div class="btn-group">
                    <button class="btn btn-outline-dark">공간안내</button>
                    <button class="btn btn-dark" onclick="PTR(1)">수시대관신청</button>
                </div>
            </div>
        </div>
        <hr>

        <div class="coronation">
            <div class="img">
                <img src="image2.jpg" alt="제 2 전시장 이미지">
            </div>
            <div class="information">
                <p><b>제 2 전시장</b></p>
                <p>전시장 2는 인천아트플랫폼 중앙광장에 위치한 36평 규모의 전시 공간입니다. 천장이 높은 구조로 회화, 사진, 설치 등 작은 규모의 기획전이나 개인전 개최에 용이합니다.</p>
                <div class="btn-group">
                    <button class="btn btn-outline-dark">공간안내</button>
                    <button class="btn btn-dark" onclick="PTR(2)">수시대관신청</button>
                </div>
            </div>
        </div>
        <hr>

        <div class="coronation">
            <div class="img">
                <img src="image3.jpg" alt="제 3 전시장 이미지">
            </div>
            <div class="information">
                <p><b>제 3 전시장</b></p>
                <p>전시장 3은 인천아트플랫폼 서쪽에 위치한 100평 규모의 전시 공간입니다. 현대미술, 미디어아트, 퍼포먼스 등 다양한 형태의 전시가 가능한 공간으로, 최신 기술을 활용한 전시도 용이합니다.</p>
                <div class="btn-group">
                    <button class="btn btn-outline-dark">공간안내</button>
                    <button class="btn btn-dark" onclick="PTR(3)">수시대관신청</button>
                </div>
            </div>
        </div>
        <hr> <div class="coronation">
            <div class="img">
                <img src="image1.jpg" alt="제 1 전시장 이미지">
            </div>
            <div class="information">
                <p><b>제 4 전시장</b></p>
                <p>A동 4층 전시장 1은 지상 1, 2층에 걸친 약 200평의 규모를 갖추고 있습니다. 인천아트플랫폼에서 가장 규모가 큰 전시장으로 문화체육광관부 1종 미술관으로 등록되어 있습니다. 주로 인천아트플랫폼 자체 기획전시를 개최하고 있으며, 별도 로비 공간이 있습니다. 규모가 큰 개인전과 그룹 전시에 적합한 전시 공간입니다.</p>
                <div class="btn-group">
                    <button class="btn btn-outline-dark">공간안내</button>
                    <button class="btn btn-dark" onclick="PTR(4)">수시대관신청</button>
                </div>
            </div>
        </div>
        <hr>

        <div class="coronation">
            <div class="img">
                <img src="image2.jpg" alt="제 2 전시장 이미지">
            </div>
            <div class="information">
                <p><b>제 5 전시장</b></p>
                <p>전시장 5는 인천아트플랫폼 중앙광장에 위치한 36평 규모의 전시 공간입니다. 천장이 높은 구조로 회화, 사진, 설치 등 작은 규모의 기획전이나 개인전 개최에 용이합니다.</p>
                <div class="btn-group">
                    <button class="btn btn-outline-dark">공간안내</button>
                    <button class="btn btn-dark" onclick="PTR(5)">수시대관신청</button>
                </div>
            </div>
        </div>
        <hr>

        <div class="coronation">
            <div class="img">
                <img src="image3.jpg" alt="제 3 전시장 이미지">
            </div>
            <div class="information">
                <p><b>제 6 전시장</b></p>
                <p>전시장 6은 인천아트플랫폼 서쪽에 위치한 100평 규모의 전시 공간입니다. 현대미술, 미디어아트, 퍼포먼스 등 다양한 형태의 전시가 가능한 공간으로, 최신 기술을 활용한 전시도 용이합니다.</p>
                <div class="btn-group">
                    <button class="btn btn-outline-dark">공간안내</button>
                    <button class="btn btn-dark" onclick="PTR(6)">수시대관신청</button>
                </div>
            </div>
        </div>
        <hr>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />
<script>
	function PTR(num) {
		console.log(num)
		var link = 'calendar.re?gno='+num;
		location.replace(link);
	}
</script>
</body>
</html>
