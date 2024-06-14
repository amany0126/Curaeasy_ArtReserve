<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>대관신청</title>
    <style>
        .coronation {
            display: flex;
            flex-direction: row;
            align-items: center;
            margin-bottom: 2rem;
            margin-top: 50px;
        }
        .img {
            flex: 0 0 33%;
        }
        .img img {
            width: 100%;
            height: auto;
            border-radius: 5px;
        }
        .information {
            flex: 0 0 65%;
            padding-left: 2rem;
        }
        .information p {
            margin: 0;
        }
        .btn-group {
            margin-top: 1rem;
        }
        .btn-group button {
            margin-right: 1rem;
        }
        .innerOuter {
            border: 1px solid lightgray;
            width: 100%;
            margin: auto;
            padding: 2rem;
            background-color: white;
            margin-top: 70px; margin-bottom: 100px;
            border-radius: 50px; box-shadow: 0 0 5px gray;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp" />

<div class="container">
    <div class="innerOuter">
        <h3>대관신청</h3>
        <hr style="border: 1px solid black;">
        
        <div class="coronation">
            <div class="img">
                <img src="resources/images/gallery1.jpg" alt="프로필이미지">
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

        <!-- Repeat the structure for additional exhibition halls -->
        <div class="coronation">
            <div class="img">
                <img src="resources/images/gallery2.jpg" alt="프로필이미지">
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
                <img src="resources/images/gallery3.jpg" alt="제 3 전시장 이미지">
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
                <img src="resources/images/gallery4.jpg" alt="제 4 전시장 이미지">
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
                <img src="resources/images/gallery5.jpg" alt="제 5 전시장 이미지">
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
                <img src="resources/images/gallery6.jpg" alt="제 6 전시장 이미지">
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
