<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <a class="nav-link" href="${path}/">
                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                    대시보드
                </a>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseExhibitions" aria-expanded="false" aria-controls="collapseExhibitions">
                    <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                    전시 관리
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseExhibitions" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionExhibitions">
                        <a class="nav-link" href="${path}/displayList.ad">전시회 관리</a>
                        <a class="nav-link" href="${path}/galleryList.ad">전시관 관리</a>
                        <a class="nav-link" href="${path}/rentalList.ad">대관 관리</a>
                        <a class="nav-link" href="${path}/reserveList.ad">예매 관리</a>
                    </nav>
                </div>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMembers" aria-expanded="false" aria-controls="collapseMembers">
                    <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                    회원 관리
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseMembers" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionMembers">
                        <a class="nav-link" href="${path}/memberList.ad">일반회원 관리</a>
                        <a class="nav-link" href="${path}/artistList.ad">작가 관리</a>
                    </nav>
                </div>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseNotices" aria-expanded="false" aria-controls="collapseNotices">
                    <div class="sb-nav-link-icon"><i class="fas fa-bullhorn"></i></div>
                    공지사항 관리
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseNotices" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionNotices">
                        <a class="nav-link" href="${path}/noticeList.ad">공지사항 관리</a>
                    </nav>
                </div>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseReviews" aria-expanded="false" aria-controls="collapseReviews">
                    <div class="sb-nav-link-icon"><i class="fas fa-comment-dots"></i></div>
                    후기 관리
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseReviews" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionReviews">
                        <a class="nav-link" href="${path}/reviewList.ad">후기 관리</a>
                        <a class="nav-link" href="${path}/replyList.ad">댓글 관리</a>
                    </nav>
                </div>
            </div>
        </div>
    </nav>
</body>
</html>
