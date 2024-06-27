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
    <title>작가관리</title>
    
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="${path}/resources/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <script src="${path}/resources/js/scripts.js"></script>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    
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
            text-align: left;
            color: #333;
        }
        .table-responsive {
            margin-top: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table th, table td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        table th {
            background-color: #007bff;
            color: white;
        }
        table td {
            background-color: #f8f9fc;
        }
        table tr:nth-child(even) {
            background-color: #f1f1f1;
        }
        table tr:nth-child(odd) {
            background-color: #f8f9fc;
        }
        table tr:hover {
            background-color: #d1d3e2;
            cursor: pointer;
        }
        .truncate {
            max-width: 200px; /* Adjust the width as needed */
        }
        .btn-add-artist {
            margin-right: 10px;
        }
        .search-bar {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-bottom: 10px;
        }
        .search-bar input {
            margin-right: 10px;
            width: 200px; /* Adjust the width as needed */
        }
        .search-bar select {
            margin-right: 10px;
            width: 150px; /* Adjust the width as needed */
        }
        .search-bar button {
            margin-right: 5px;
        }
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            list-style: none;
            padding: 0;
        }
        .pagination li {
            margin: 0 5px;
        }
        .pagination a {
            display: block;
            padding: 8px 16px;
            text-decoration: none;
            color: #007bff;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .pagination a:hover {
            background-color: #007bff;
            color: white;
        }
        .pagination a.disabled {
            color: #ddd;
            pointer-events: none;
            cursor: default;
        }
   
        .pagination a.active {
            background-color: #007bff;
            color: white;
            border-color: #007bff;
        }
        /* 테이블 배경색 흰색으로 설정 */
        #datatablesSimple {
            background-color: white;
        }

        /* 테이블 요소 중앙 정렬 */
        #datatablesSimple th, #datatablesSimple td {
            text-align: center;
            vertical-align: middle;
        }
        
        /* Disabled button style */
        .btn-disabled {
            background-color: grey;
            pointer-events: none;
        }
    </style>
 
</head>

<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="${path}/admin.ad">관리자 페이지</a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"><i class="fas fa-bars"></i></button>
        <!-- Logout Button-->
        <div class="ms-auto me-0 me-md-3 my-2 my-md-0">
            <!--  <button class="logout-button" onclick="logout()">나가기</button> -->
        </div>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <%@ include file="../common/adminNav.jsp" %>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">🖌️ 작가 목록 조회</h1>
                    <div class="search-bar">
                        <select id="searchCategory" class="form-select">
                            <option value="all">전체</option>
                            <option value="artistNickName">작가명</option>
                            <option value="artistApplyTitle">신청제목</option>
                            <option value="artistOrdinal">작가 기수</option>
                        </select>
                        <input type="text" id="searchInput" class="form-control" placeholder="검색어 입력">
                        <button id="searchButton" class="btn btn-primary">검색</button>
                    </div>
                    <div class="table-responsive">
                        <table id="datatablesSimple" class="table table-striped table-bordered">
                            <thead>
                                <tr style="background-color: #007bff; color: white;">
                                    <th>작가번호</th>
                                    <th>예명</th>
                                    <th>작가 기수</th>
                                    <th>신청일</th>
                                    <th>신청제목</th>
                                    <th>소개</th>
                                    <th>이미지</th>
                                    <th>결과</th>
                                    <th>상태</th>
                                    <th>회원번호</th>
                                    <th>수정하기</th>
                                    <th>작가승인</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="artist" items="${artistList}">
                                    <tr>
                                        <td>${artist.artistNo}</td>
                                        <td>${artist.artistNickName}</td>
                                        <td>${artist.artistOrdinal}</td>
                                        <td class="date">${artist.artistApplyDate}</td>
                                        <td>${artist.artistApplyTitle}</td>
                                        <td>${artist.artistIntroduce}</td>
                                        <td>${artist.artistImage}</td>
                                        <td>${artist.artistResult == 'N' ? '승인대기' : '처리완료'}</td>
                                        <td>${artist.artistStatus == 'Y' ? '작가' : '일반회원'}</td>
                                        <td>${artist.memberNo}</td>
	                                    <td><button class="btn btn-warning" onclick="location.href='${path}/updateArtist.ad?artistNo=${artist.artistNo}'">수정하기</button></td>
	                                    <td>
	                                        <button class="btn ${artist.artistResult == 'N' ? 'btn-primary' : 'btn-disabled'}"
	                                                onclick="confirmApproval( ${ artist.artistNo}, '${artist.artistResult}')">
	                                            		${artist.artistResult == 'N' ? '작가승인' : '처리완료'}
	                                        </button>
	                                    </td>
                                    </tr>
                                </c:forEach>
                                
                                <c:if test="${empty artistList}">
                                    <tr>
                                        <td colspan="12">등록된 작가가 없습니다.</td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                    <ul class="pagination">
                        <li>
                            <a href="${path}/artistList.ad?currentPage=${pi.currentPage - 1}" class="${pi.currentPage == 1 ? 'disabled' : ''}"><</a>
                        </li>
                        <c:forEach begin="${pi.startPage}" end="${pi.endPage}" var="p">
                            <li>
                                <a href="${path}/artistList.ad?currentPage=${p}" class="${pi.currentPage == p ? 'active' : ''}">${p}</a>
                            </li>
                        </c:forEach>
                        <li>
                            <a href="${path}/artistList.ad?currentPage=${pi.currentPage + 1}" class="${pi.currentPage == pi.maxPage ? 'disabled' : ''}">></a>
                        </li>
                    </ul>
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
       <script>
        function goToDetail(artistNo) {
            window.location.href = '${path}/artistDetail.ad?artistNo=' + artistNo;
        }

        function truncateText(selector, maxLength) {
            const elements = document.querySelectorAll(selector);
            elements.forEach(element => {
                if (element.textContent.length > maxLength) {
                    element.textContent = element.textContent.slice(0, maxLength) + '...';
                }
            });
        }

        function formatDate() {
            const dateElements = document.querySelectorAll('.date');
            dateElements.forEach(element => {
                let date = element.textContent;
                element.textContent = date.split(" ")[0];
            });
        }

        document.addEventListener("DOMContentLoaded", function() {
            truncateText('.truncate', 20);
            formatDate();
            
            // 검색 버튼 클릭 이벤트
            $("#searchButton").click(function() {
                performSearch();
            });
            
            // 검색 입력창에서 Enter 키 눌렀을 때 이벤트
            $("#searchInput").on("keypress", function(e) {
                if (e.which == 13) { // Enter 키 코드
                    performSearch();
                }
            });
            
            function performSearch() {
                var searchValue = $("#searchInput").val().toLowerCase();
                var searchCategory = $("#searchCategory").val();
                $("table tbody tr").filter(function() {
                    var textToSearch;
                    if (searchCategory === "artistNickName") {
                        textToSearch = $(this).find('td:eq(1)').text().toLowerCase();
                    } else if (searchCategory === "artistApplyTitle") {
                        textToSearch = $(this).find('td:eq(4)').text().toLowerCase();
                    } else if (searchCategory === "artistOrdinal") {
                        textToSearch = $(this).find('td:eq(2)').text().toLowerCase();
                    } else {
                        textToSearch = $(this).text().toLowerCase();
                    }
                    $(this).toggle(textToSearch.indexOf(searchValue) > -1);
                });
            }
        });

        function confirmApproval( artistNo, artistResult) {
        	
        	if(artistResult == 'N'){
        		
	           if (confirm("작가를 승인하시겠습니까?")) {
	                window.location.href = '${path}/approveArtist.ad?artistNo=' + artistNo + '&status=Y';
	            } else {
	                window.location.href = '${path}/approveArtist.ad?artistNo=' + artistNo + '&status=N';
	            } 
        	}
        }
    </script>
</body>
</html>
