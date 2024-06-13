

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록 전체조회 (list.me) </title>

<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 100%;
            margin: 50px auto;
            background-color: #fff;
            box-shadow: 0 0 10px black;
            padding: 20px;
            border-radius: 30px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .filter {
            text-align: center;
            margin-bottom: 20px;
            float : right;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table th, table td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }
        table th {
            background-color: #f2f2f2;
            color: #333;
        }
        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        table tr:nth-child(odd) {
            background-color: #fff;
        }

    </style>
    
</head>
<body>

	<h1>확인</h1>
	
	<%@ include file="../common/adminTop.jsp" %>
	
	<!-- navi 원/투 나누고 includ해 -->
	<script>
        function filterTable() {
            var filter = document.getElementById("authorFilter").value;
            var rows = document.querySelectorAll("tbody tr");
            rows.forEach(row => {
                var authorStatus = row.querySelector("td:last-child").textContent.trim();
                if (filter === "all" || authorStatus === filter) {
                    row.style.display = "";
                } else {
                    row.style.display = "none";
                }
            });
        }
    </script>
    

    <div class="container">

            <h1 style="text-align: left;">&#128101;회원 목록 조회</h1>
            <div class="filter">
                <label for="authorFilter">작가 | 회원 필터:</label>
                <select id="authorFilter" onchange="filterTable()">
                    <option value="all">전체</option>
                    <option value="Y">작가 (Y)</option>
                    <option value="N">일반회원 (N)</option>
                </select>
            </div>

        <table id="all">
            <thead>
                <tr>
                    <th>회원번호</th>
                    <th>회원이름</th>
                    <th>회원아이디</th>
                    <th>전화번호</th>
                    <th>이메일</th>
                    <th>회원주소</th>
                    <th>생일</th>
                    <th>회원가입일</th>
                    <th>작가여부</th>
                </tr>
            </thead>
            <tbody>
                <%-- 여기서부터는 서버에서 회원 목록 데이터를 가져와서 반복적으로 출력합니다. --%>
                <%
                    // 예시 데이터, 실제로는 데이터베이스에서 데이터를 가져와야 합니다.
                    String[][] members = {
                        {"1", "홍길동", "hong123", "010-1234-5678", "hong@example.com", "서울시 강남구", "1990-01-01", "2020-06-01", "Y"},
                        {"2", "김철수", "kimcs", "010-2345-6789", "kim@example.com", "부산시 해운대구", "1985-05-15", "2019-07-15", "N"},
                        {"3", "박영희", "park99", "010-3456-7890", "park@example.com", "대구시 중구", "1992-12-25", "2021-01-10", "Y"},
                        {"4", "이민호", "minho123", "010-4567-8901", "minho@example.com", "광주시 북구", "1988-03-03", "2018-11-11", "N"}
                        // 더 많은 회원 데이터를 여기에 추가합니다.
                    };

                    for (String[] member : members) {
                %>
                <tr>
                    <td><%= member[0] %></td>
                    <td><%= member[1] %></td>
                    <td><%= member[2] %></td>
                    <td><%= member[3] %></td>
                    <td><%= member[4] %></td>
                    <td><%= member[5] %></td>
                    <td><%= member[6] %></td>
                    <td><%= member[7] %></td>
                    <td><%= member[8] %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
	
	<%@ include file="../common/adminNav.jsp" %>

</body>
</html>