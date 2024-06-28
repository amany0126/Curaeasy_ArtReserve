<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--폰트-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

    <title>공지사항</title>


    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 1200px;
            margin: auto;
            margin-bottom: 100px;
            padding: 20px;
            margin-top: 80px; background-color :#e7e6e6;
            box-shadow: 0 0 10px gray;
        }
        .content {
            padding: 20px;
        }
        .content-header {
            margin-bottom: 20px;
            /* 폰트 */
            font-family: "Do Hyeon", sans-serif;
            font-weight: 400;
            font-size :larger;
            font-style :oblique;          
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



        .search-box input[type="text"] {
            padding: 10px;
            width: 200px;
            border: 1px solid #ccc;
            margin-right: 5px;
        }
        .search-box button {
            padding: 10px;
            border: 1px solid #ccc;
            background-color: #333;
            color: #fff;
            cursor: pointer;
        }
        .notice-list {
            width: 100%;
            border-collapse: collapse;
            
        }
        .notice-list th, .notice-list td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
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
            color: white;
            float: left;
            padding: 8px 10px;
            text-decoration: none; 
            border-radius: 20%;
            background-color: white; color:black;
            margin : 0px 4px;
        }
        .pagination a:hover{background-color: black; color:white;}
        .pagination a.active {
            font-weight: bold;
        }

        td:hover { display: block; font-size: 15px; font-weight: 600; cursor: pointer; }
        tr:hover { background-color: #fff; }

    </style>
</head>
<body>

<jsp:include page="../common/header.jsp" />

<div class="container">
    <div class="content">
        <div class="content-header">
            <h1>&#128486; 공지사항 &#128487;</h1>
        </div>
        <!--
        <div class="search-box">
            <input type="text" placeholder="검색어를 입력하세요" />
            <button>검색</button>
        </div>
        -->
        <table id="noticeList" class="notice-list">
            <thead>
                <tr>
                    <th style="width:25px">No</th>
                    <th style="width:70%;">제 목</th>
                    <th >등록일</th>
                    <th>조회수</th>
                    <th style="width:100px;">첨부파일</th>
                </tr>
            </thead>
            <tbody>
                
                
                <c:forEach var="n" items="${ requestScope.list }">
                		<tr>
                			<td>${ n.noticeNo }</td>
                			<td>${ n.noticeTitle }</td>
                			<td>${ n.noticeDate }</td>
                            <td style="text-align: center;">${ n.noticeCount }</td>
                			<td style="text-align: center;">
								<c:if test="${ not empty n.noticeAttachment }">
									<b>&#128449;</b>
								</c:if>
							</td>
                		</tr>
                </c:forEach>
            </tbody>
        </table>
        
        
        
        
        <!-- 페이징바 -->
        
       <script>
		$(function() {
       		
			$("#noticeList>tbody>tr").click(function() {
       			
       			let nno = $(this).children().eq(0).text();
       			
       			location.href = "noticeDetail.do?nno=" + nno;
       		});
       		
       	});
       </script>

        
        <div id="pagingArea">
                <ul class="pagination">
                
                	<c:choose>
                	<c:when test="${ requestScope.pi.currentPage eq 1 }">	
                    	<li >
                    		<a class="page-link" href="#">⇦</a>
                    	</li>
                    </c:when>
                    <c:otherwise>
                    	<li class="page-item disabled">
                    		<a class="page-link" 
                    		   href="notice.do?cpage=${ requestScope.pi.currentPage - 1 }">
                               ⇦
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
		                    	<a href="notice.do?cpage=${ p }">
									${ p }
								</a>
		                    </li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item active">
		                    	<a >
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
	                    		⇨
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
            </div>
            
            
    </div>
</div>

<jsp:include page="../common/footer.jsp" />

</body>
</html>
