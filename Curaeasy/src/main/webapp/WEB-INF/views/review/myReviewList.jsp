<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!--폰트-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
        
    <title>후기 게시글목록</title>


    <style>
        h1 {
            /* 폰트 */
            font-family: "Do Hyeon", sans-serif;
            font-weight: 400;
            font-size :larger;
            font-style :oblique;  
        }

        .innerOuter {
            border:0px solid lightgray;
            width:80%;
            height : 800px;
            padding:5% 10%;
            background-color:white;
            display: inline-block;
            float: right;
        }
		button { border-radius: 50px !important;}

        .content {
        width:80%;
            padding: 0px;
            
        }
        .content-header {
            margin-bottom: 20px;     
        }
        .content-header h1 {
            font-size: 2em;
        }
        .search-box {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 20px;
        }
        .search-box>input { border-radius: 20px;}
        .search-box>button { border-radius: 20px;}




        .notice-list {
            width: 100%;
            border-collapse: collapse;
            
        }
        .notice-list th, .notice-list td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        .notice-list th {
            background-color: #f2f2f2;
            border : none; 
            height: 60px;
            border-top: 3px solid; border-bottom: 3px solid; 
            text-align: center;
        }
        .pagination {
            text-align: center;
            margin-top: 35px;
            width: 100%;
            display: flex;
            justify-content: center;
        }
        .pagination a {
            margin: 0 5px;
            text-decoration: none;
            color: #333;
        }
        .pagination a.active {
            font-weight: bold;
        }
        td{
         text-align: center;}

      /*   td:hover { display: block; font-size: 15px; font-weight: 600; cursor: pointer; } */
        tbody > tr:hover { background-color: lightgray;  }

    </style>
</head>
<body>

<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/mainPageSidbar.jsp" />
<br><br>
<div class="innerOuter">
    <div class="content">
        <div class="content-header">
            <h1>작성한 후기 게시글 목록</h1>
        </div>
    <!--     <div class="search-box">
            <input type="text" placeholder="대관장소를 입력하세요" />
            <button>검색</button>
        </div> -->
        <table id="noticeList" class="notice-list">
            <thead>
                <tr>
                    <th>게시글 번호</th>
                    <th>게시글 제목</th>
                    <th>조회수</th>
                    <th>작성 일자</th>
                </tr>
            </thead>
            <tbody>                
                <c:forEach var="n" items="${ requestScope.list }">
                		<tr>
                			<td>${ n.reviewNo }</td>
                			<td>${ n.reviewTitle }</td>
                            <td>${ n.reviewCount }</td>
                			<td>${ n.reviewEnrollDate}</td>
                		</tr>
                </c:forEach>
            </tbody>
        </table>
        
        
        
        
        <!-- 페이징바 -->
        
    <script>
		$(function() {
       		
			$("#noticeList>tbody>tr").click(function() {
       			
       			let rno = $(this).children().eq(0).text();
       			
       			location.href = "reviewDetail.do?rno=" + rno;
       		});
       		
       	});
       </script>

      <%--   
        <div id="pagingArea">
                <ul class="pagination">
                
                	<c:choose>
                	<c:when test="${ requestScope.pi.currentPage eq 1 }">	
                    	<li class="page-item disabled">
                    		<a class="page-link" href="#">⇦</a>
                    	</li>
                    </c:when>
                    <c:otherwise>
                    	<li class="page-item">
                    		<a class="page-link" 
                    		   href="notice.do?cpage=${ requestScope.pi.currentPage - 1 }">
                    			Previous
                    		</a>
                    	</li>
                    </c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ requestScope.pi.startPage }"
                    		   end="${ requestScope.pi.endPage }"
                    		   step="1">
                    	
                    	<c:choose>	   
                    	<c:when test="${ requestScope.pi.currentPage ne p }">
                    		<li class="page-item">
		                    	<a class="page-link" href="notice.do?cpage=${ p }">
									${ p }
								</a>
		                    </li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item active">
		                    	<a class="page-link">
									${ p }
								</a>
		                    </li>
                    	</c:otherwise>
	                    </c:choose>
                    </c:forEach>
                    
                    <c:choose>
                    <c:when test="${ requestScope.pi.currentPage eq requestScope.pi.maxPage }">
	                    <li class="page-item disabled">
	                    	<a class="page-link" href="#">
	                    		Next
	                    	</a>
	                    </li>
                    </c:when>
                    <c:otherwise>
	                    <li class="page-item">
	                    	<a class="page-link" 
	                    	   href="notice.do?cpage=${ requestScope.pi.currentPage + 1 }">
                               ⇨
	                    	</a>
	                    </li>
	                </c:otherwise>
                    </c:choose>
                </ul>
            </div> --%>
            
            
    </div>
</div>

<jsp:include page="../common/footer.jsp" />

</body>
</html>
