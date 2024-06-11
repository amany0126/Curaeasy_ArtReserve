<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>대관안내</title>
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
        .tab-menu {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
            border-bottom: 2px solid #ddd;
        }
        .tab-menu a {
            margin: 0 15px;
            text-decoration: none;
            color: #333;
            padding: 10px 20px;
            border-bottom: 2px solid transparent;
        }
        .tab-menu a.active {
            border-bottom: 2px solid #333;
            font-weight: bold;
        }
        .section {
            margin-bottom: 40px;
        }
        .section h2 {
            font-size: 1.5em;
            margin-bottom: 20px;
        }
        .section p {
            font-size: 1em;
            line-height: 1.5;
            margin-bottom: 20px;
        }
        .table-container {
            width: 100%;
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        .btn-container {
            text-align: center;
            margin-top: 20px;
        }
        .btn-container button {
            padding: 10px 20px;
            border: 1px solid #ccc;
            background-color: #333;
            color: #fff;
            cursor: pointer;
        }
    </style>
</head>
<body>

<jsp:include page="../common/header.jsp" />

<div class="container">
    <div class="content">
        <div class="content-header">
            <h1>대관안내</h1>
        </div>
        <div class="tab-menu">
            <a href="rentalInfo.do" class="active">대관안내</a>
            <a href="requirements.do">자격조건</a>
        </div>
        <div class="section">
            <h2>인천아트플랫폼 대관 일정 및 안내</h2>
            <p>정기대관</p>
            <p>2024년도 인천아트플랫폼 정기대관(6월 ~ 12월) 안내</p>
            <ul>
                <li>대관장소: 인천아트플랫폼 전시실</li>
                <li>대관기간: 2024년 6월 1일 ~ 2024년 12월 31일</li>
                <li>신청기간: 2024년 4월 1일 ~ 2024년 4월 30일</li>
                <li>심사기간: 2024년 5월 1일 ~ 2024년 5월 15일</li>
                <li>결과발표: 2024년 5월 20일</li>
            </ul>
        </div>
        <div class="section">
            <h2>수시대관</h2>
            <p>수시대관은 연중 상시로 신청 가능합니다. 자세한 내용은 인천아트플랫폼 대관 담당자에게 문의 바랍니다.</p>
        </div>
        <div class="section">
            <h2>대관방침</h2>
            <h3>자격조건</h3>
            <ul>
                <li>예술단체 및 개인 작가</li>
                <li>비영리 문화예술기관</li>
                <li>기타 대관 목적에 적합한 단체 및 개인</li>
            </ul>
        </div>
        <div class="section">
            <h2>제한사항</h2>
            <p>다음의 경우 대관이 제한될 수 있습니다.</p>
            <ul>
                <li>종교적, 정치적 목적의 행사</li>
                <li>영리 목적의 행사</li>
                <li>기타 공공질서 및 미풍양속에 반하는 행사</li>
            </ul>
        </div>
        <div class="table-container">
            <h2>대관료</h2>
            <table>
                <thead>
                    <tr>
                        <th>시설명</th>
                        <th>이용기간</th>
                        <th>이용시간</th>
                        <th>대관료</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>전시실 A</td>
                        <td>1일</td>
                        <td>10:00 ~ 18:00</td>
                        <td>100,000원</td>
                    </tr>
                    <tr>
                        <td>전시실 B</td>
                        <td>1일</td>
                        <td>10:00 ~ 18:00</td>
                        <td>120,000원</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="btn-container">
            <button onclick="location.href='rental.do'">대관신청</button>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />

</body>
</html>
