<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>회원 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${path}/resources/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${path}/resources/js/scripts.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 95%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        .form-group label {
            font-weight: bold;
        }
        .btn-primary {
            width: 100px;
            margin-top: 20px;
        }
    </style>
</head>

<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <a class="navbar-brand ps-3" href="${path}/">관리자 페이지</a>
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"><i class="fas fa-bars"></i></button>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <%@ include file="../common/adminNav.jsp" %>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container">
                    <h1 class="mt-4">회원 수정</h1>
                    <form action="${path}/updateMember.ad" method="post">
                        <input type="hidden" name="memberNo" value="${member.memberNo}" />
                        <div class="form-group mb-3">
                            <label for="memberId">아이디</label>
                            <input type="text" class="form-control" id="memberId" name="memberId" value="${member.memberId}" readonly>
                        </div>
                        <div class="form-group mb-3">
                            <label for="memberName">이름</label>
                            <input type="text" class="form-control" id="memberName" name="memberName" value="${member.memberName}" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="memberPhone">연락처</label>
                            <input type="text" class="form-control" id="memberPhone" name="memberPhone" value="${member.memberPhone}" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="memberEmail">이메일</label>
                            <input type="email" class="form-control" id="memberEmail" name="memberEmail" value="${member.memberEmail}" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="memberAddress">주소</label>
                            <input type="text" class="form-control" id="memberAddress" name="memberAddress" value="${member.memberAddress}" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="memberBirthday">생년월일</label>
                            <input type="date" class="form-control" id="memberBirthday" name="memberBirthday" value="${member.memberBirthday}" readonly>
                        </div>
                        <div class="form-group mb-3">
                            <label for="memberEnrollDate">가입일</label>
                            <input type="text" class="form-control" id="memberEnrollDate" name="memberEnrollDate" value="${member.memberEnrollDate}" readonly>
                        </div>
                        <div class="form-group mb-3">
                            <label for="memberStatus">회원상태</label>
                            <select class="form-control" id="memberStatus" name="memberStatus" required>
                                <option value="Y" ${member.memberStatus == 'Y' ? 'selected' : ''}>가입중</option>
                                <option value="N" ${member.memberStatus == 'N' ? 'selected' : ''}>탈퇴됨</option>
                            </select>
                        </div>
                        <div class="form-group mb-3">
                            <label for="artistOngoing">작가여부</label>
                            <select class="form-control" id="artistOngoing" name="artistOngoing" required>
                                <option value="Y" ${member.artistOngoing == 'Y' ? 'selected' : ''}>작가회원</option>
                                <option value="N" ${member.artistOngoing == 'N' ? 'selected' : ''}>일반회원</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">수정하기</button>
                        <button type="button" class="btn btn-secondary" onclick="history.back();">취소하기</button>
                    </form>
                </div>
            </main>
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">CURAEASY &copy; our ArtHall 2024</div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
</body>
</html>
