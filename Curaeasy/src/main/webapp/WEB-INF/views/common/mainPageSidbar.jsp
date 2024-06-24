<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>사이드바</title>

<style>
.sidbar {
	display: inline-block;
	float: left;
	margin-top: 7.5%;
	padding-left: 3%;
	width: 20%
}

.sidbar>ul {
	margin: 30px 0px 40px;
}

.sidbar>ul>li:hover {
	background-color: rgb(227, 227, 235);
	font-weight: bold;
}

.sidbar>ul>li {
	padding-top: 12px;
}

hr {
	background: black;
}

li {
	list-style-type: none;
	font-size: large;
	font-style: inherit;
}

li a {
	color: black;
	text-decoration: none;
}

li a:hover {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="sidbar">
		<hr style="height: 3px">
		<ul>
			<li><a href="myPage.me">- 마이페이지</a></li>
			<li><a href="reserveList.me">- 결제내역조회</a></li>
			<li><a href="myReviewList.re">- 작성한 후기 목록</a></li>
			<c:choose>
			<c:when test="${sessionScope.loginUser.artistOngoing eq 'Y'}">
				<li><a href="updateForm.at">- 작가 정보 수정</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="enrollForm.at">- 작가신청</a></li>
			</c:otherwise>
		</c:choose>
			
		</ul>
		<c:choose>
			<c:when test="${sessionScope.loginUser.artistOngoing eq 'Y'}">
			<hr style="height: 3px">
				<ul>
					<li><a href="rentalList.re">- 대관 신청 조회</a></li>
					<li><a href="exhibition.do ">- 전시회 관련 조회</a></li>
				</ul>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>



	</div>
</body>
</html>
