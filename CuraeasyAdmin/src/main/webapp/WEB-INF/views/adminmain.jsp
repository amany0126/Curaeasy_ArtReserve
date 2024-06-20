<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Manager Screen</title>
    
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="${path}/resources/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <script src="${path}/resources/js/scripts.js"></script>
    <script src="${path}/resources/demo/chart-area-demo.js"></script>
    <script src="${path}/resources/demo/chart-bar-demo.js"></script>
    <script src="${path}/resources/js/datatables-simple-demo.js"></script>
</head>

<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="${pageContext.request.contextPath}/">관리자 페이지</a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
        
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
        </form>
        <!-- Navbar-->
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <%@ include file="common/adminNav.jsp" %>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Dashboard</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active">Dashboard</li>
                    </ol>
                    
                    <div class="card mb-4">
                        <div class="card-header">
                            모든 전시 목록 <!-- 지난전시,진행중,예정 등등 메인에 전체적인 목록조회되게끔 -->
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>NO</th>
                                        <th>전시관</th>
                                        <th>대상자목록</th>
                                        <th>전시일정</th>
                                        <th>상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="display" items="${displayList}">
                                        <tr>
                                            <td>${display.displayNo}</td>
                                            <td>${display.galleryName}</td>
                                            <td>${display.artistNickName}</td>
                                            <td>${display.displayStartDate} ~ ${display.displayEndDate}</td>
                                            <td>${display.displayStatus}</td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty displayList}">
                                        <tr>
                                            <td colspan="5">진행중인 전시가 없습니다.</td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="card mb-4">
                        <div class="card-header">
                            모든 공지사항 목록
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>NO</th>
                                        <th>제목</th>
                                        <th>작성일</th>
                                        <th>상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="notice" items="${noticeList}">
                                        <tr>
                                            <td>${notice.noticeNo}</td>
                                            <td>${notice.noticeTitle}</td>
                                            <td>${notice.noticeDate}</td>
                                            <td>${notice.noticeStatus}</td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty noticeList}">
                                        <tr>
                                            <td colspan="4">등록된 공지사항이 없습니다.</td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="card mb-4">
                        <div class="card-header">
                            모든 후기 목록
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>NO</th>
                                        <th>제목</th>
                                        <th>내용</th>
                                        <th>작성일</th>
                                        <th>작성자</th>
                                        <th>상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="review" items="${reviewList}">
                                        <tr>
                                            <td>${review.reviewNo}</td>
                                            <td>${review.reviewTitle}</td>
                                            <td>${review.reviewContent}</td>
                                            <td>${review.reviewEnrollDate}</td>
                                            <td>${review.memberName}</td>
                                            <td>${review.reviewStatus}</td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty reviewList}">
                                        <tr>
                                            <td colspan="6">등록된 후기가 없습니다.</td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="card mb-4">
                        <div class="card-header">
                            모든 댓글 목록
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>NO</th>
                                        <th>내용</th>
                                        <th>작성일</th>
                                        <th>상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="reply" items="${replyList}">
                                        <tr>
                                            <td>${reply.replyNo}</td>
                                            <td>${reply.replyContent}</td>
                                            <td>${reply.replyEnrollDate}</td>
                                            <td>${reply.replyStatus}</td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty replyList}">
                                        <tr>
                                            <td colspan="4">등록된 댓글이 없습니다.</td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="card mb-4">
                        <div class="card-header">
                            모든 대관신청 목록
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>NO</th>
                                        <th>대관 시작일</th>
                                        <th>대관 종료일</th>
                                        <th>작가</th>
                                        <th>전시관</th>
                                        <th>심사 결과</th>
                                        <th>상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="rental" items="${rentalList}">
                                        <tr>
                                            <td>${rental.rentalNo}</td>
                                            <td>${rental.rentalStartDate}</td>
                                            <td>${rental.rentalEndDate}</td>
                                            <td>${rental.artistNickName}</td>
                                            <td>${rental.galleryName}</td>
                                            <td>${rental.rentalResult}</td>
                                            <td>${rental.rentalStatus}</td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty rentalList}">
                                        <tr>
                                            <td colspan="7">등록된 대관신청이 없습니다.</td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="card mb-4">
                        <div class="card-header">
                            모든 예매 목록
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>NO</th>
                                        <th>예매수량</th>
                                        <th>결제코드</th>
                                        <th>결제일</th>
                                        <th>입장일</th>
                                        <th>결제액</th>
                                        <th>상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="reserve" items="${reserveList}">
                                        <tr>
                                            <td>${reserve.reserveNo}</td>
                                            <td>${reserve.reserveCount}</td>
                                            <td>${reserve.paymentCode}</td>
                                            <td>${reserve.paymentDate}</td>
                                            <td>${reserve.entranceDate}</td>
                                            <td>${reserve.paymentPrice}</td>
                                            <td>${reserve.reserveStatus}</td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty reserveList}">
                                        <tr>
                                            <td colspan="7">등록된 예매가 없습니다.</td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
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
