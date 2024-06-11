<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>curaeasy</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 40px; /* 좌우 공백을 위해 패딩을 추가 */
        }
        .title {
            font-size: 36px;
            font-weight: bold;
            text-align: left;
            margin-bottom: 20px;
        }
        .subtitle {
            font-size: 24px;
            font-weight: bold;
            text-align: left;
            margin-bottom: 10px;
        }
        hr {
            border: 0;
            border-top: 2px solid #000;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <%@ include file="../common/header.jsp" %>
    
    <div class="container">
        <div class="title">조직도</div>
        <hr>
        <div class="subtitle">조직도</div>
        <table>
            <tr>
                <th>직위</th>
                <th>성명</th>
                <th>담당 업무</th>
                <th>전화번호</th>
            </tr>
            <tr>
                <td>팀장</td>
                <td>한상준</td>
                <td>
                    <ul>
                        <li>인천아트플랫폼 업무 총괄</li>
                        <li>우리미술관 업무 총괄</li>
                    </ul>
                </td>
                <td>032-760-1003</td>
            </tr>
            <tr>
                <td>과장</td>
                <td>이영지</td>
                <td>
                    <ul>
                        <li>부서 서무(대외)</li>
                        <li>제물포르네상스 관련 업무 - 뮤직갤러리 조성, 개항살롱 입주, 경관조명 개선, 주차시설 조성</li>
                        <li>공간대관 - 공연장, 중앙공장, 촬영 대관</li>
                        <li>중재채권회생법 관련 업무</li>
                        <li>보안인력 운용</li>
                    </ul>
                </td>
                <td>032-760-1004</td>
            </tr>
            <tr>
                <td>과장</td>
                <td>구사랑</td>
                <td>
                    <ul>
                        <li>인천아트플랫폼 회계 - 정산비 및 사업비 지출, 더존G20 회계 프로그램 관리, 인천시 매입세금계산서 관리, 회계 결산</li>
                        <li>인천아트플랫폼 계약 - 입찰 및 조달, 일반계약 및 구매과제 자질 검토</li>
                    </ul>
                </td>
                <td>032-760-1002</td>
            </tr>
            <tr>
                <td>대리</td>
                <td>조호성</td>
                <td>
                    <ul>
                        <li>기획전시 - 주제전(2개년15주년 기념전)</li>
                        <li>예술창작공간운영 - 14기 레지던시 창작지원 프로젝트, 2024 프로젝트 기반 레지던시 정책연구</li>
                        <li>일반운영 - 부서 서무(내부), 홍보 사무보조 운영위원회, 기록물 관리, 공급미술 평가 인증 관리</li>
                    </ul>
                </td>
                <td>032-760-1005</td>
            </tr>
            <tr>
                <td>대리</td>
                <td>이경한</td>
                <td>
                    <ul>
                        <li>기획공연 및 축제 - 특별기획(어린이날 행사)</li>
                        <li>입주작가 활동 - curaeasy 지원, 전시제작, 전시해설 교육 프로그램 운영</li>
                        <li>지역연계 프로그램 - 활성화 관련 선순환 및 토론회 개최</li>
                    </ul>
                </td>
                <td>032-760-1006</td>
            </tr>
        </table>
    </div>

    <%@ include file="../common/footer.jsp" %>
</body>
</html>
