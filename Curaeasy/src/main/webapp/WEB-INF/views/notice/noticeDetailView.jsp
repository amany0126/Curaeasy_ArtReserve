<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 상세보기</title>
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
        .notice-detail {
            border: 1px solid #ddd;
            padding: 20px;
            margin-bottom: 20px;
        }
        .notice-detail h2 {
            font-size: 1.5em;
            margin-bottom: 10px;
        }
        .notice-meta {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            font-size: 0.9em;
            color: #777;
        }
        .notice-content {
            margin-top: 20px;
            font-size: 1em;
            line-height: 1.5;
        }
        .notice-nav {
            margin: 20px 0;
            font-size: 0.9em;
            color: #555;
        }
        .notice-nav .nav-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
        }
        .nav-item span {
            min-width: 60px;
            font-weight: bold;
            text-align: left;
        }
        .nav-item a {
            flex-grow: 1;
            margin-left: 10px;
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
        .icon {
            margin-left: 10px;
        }
        .separator {
            border-bottom: 1px solid #ddd;
            margin: 10px 0;
        }
    </style>
</head>
<body>

<jsp:include page="../common/header.jsp" />

<div class="container">
    <div class="content">
        <div class="content-header">
            <h1>공지사항</h1>
        </div>
        <div class="notice-detail">
            <h2>[공고 제2024-72호] 인천아트플랫폼 정기대관(6월~12월) 공고</h2>
            <div class="notice-meta">
                <span>작성자: 관리자(admin)</span>
                <span>등록일: 2024-04-25</span>
            </div>
            <hr>
            <div class="notice-content">
                <p>다운로드: <a href="#">[별첨] 인천아트플랫폼 대관규칙.hwp</a></p>
                <p>(재)인천문화재단 공고 제2024-72호</p>
                <h3>2024년도 인천아트플랫폼 정기대관(6월 ~ 12월) 공고</h3>
                <p>문의처: 인천아트플랫폼 전화번호: 032) 760-1007</p>
            </div>
        </div>
        <div class="notice-nav">
            <div class="nav-item">
                <span>이전글</span>
                <a href="#">2024 인천아트플랫폼 <작가연계 프로그램> 신청 안내</a>
                <span class="icon">^</span>
            </div>
            <div class="separator"></div>
            <div class="nav-item">
                <span>다음글</span>
                <a href="#">브런치 사운드 4/20(토) 공연 장소 변경 안내</a>
                <span class="icon">v</span>
            </div>
        </div>
        <div class="btn-container">
            <button onclick="location.href='notice.do'">목록으로</button>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />

</body>
</html>
