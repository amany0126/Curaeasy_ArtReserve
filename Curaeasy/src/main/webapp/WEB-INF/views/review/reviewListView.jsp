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
    
    <title>후기 게시글목록</title>


    <style>
        .innerOuter {
            border:0px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
			margin-top: 5px;
        }
        .search-box {
            display: flex;
            justify-content: flex-end;
            margin-top: 20px;
        }

        .content-header {
            margin-bottom: 20px;     
        }
        .content-header h1 {
            font-size: 2em;
        }





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
<br><br>
<div class="innerOuter">
    <div class="content">
        <div class="content-header">
            <h1>작성한 후기 게시글 목록</h1>
        </div>
       <div class="search-box" style="float: right">
       <form action="review.do">
            <select name="category" id="category" class="form-control"  style="display: inline; width: 130px;">
                <option value="">전체</option>
                <option value="writer">작성자</option>
                <option value="title">제목</option>
            </select>
            <input type="search" name="search" id="search" placeholder="검색어" value="${ requestScope.search }" style="display: inline; width: 250px;" class="form-control">
            <button type="submit" class="form-control btn btn-info" style="display: inline; width: 100px;">검색</button>
        	</form>
        	<br><br>
        </div>
        <c:if test="${ requestScope.ticket > 0}">
        <br><br>
        	<div class="search-box">
        	<form action="reviewEnrollForm.do">
        		 <button type="submit" class="btn btn-info" style="float: right;">후기 작성</button>
        	</form>
        	</div>
        </c:if>
        <br>
        <table id="noticeList" class="notice-list">
            <thead>
                <tr>
                    <th>후기 번호</th>
                    <th>후기글 제목</th>
                    <th>후기 작성자 아이디</th>
                    <th>조회수</th>
                    <th>작성 일자</th>
                </tr>
            </thead>
            <tbody>                
                <c:forEach var="n" items="${ requestScope.list }">
                		<tr>
                			<td>${ n.reviewNo }</td>
                			<td>${ n.reviewTitle }</td>
                			<td>${ n.reviewContent }</td>
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
       			
       			let nno = $(this).children().eq(0).text();
       			
       			location.href = "noticeDetail.do?nno=" + nno;
       		});
       		
       	});
       </script>
		<script>
		$(".search-box select[name=category]>option").each(function() {
			if($(this).val() == "${ requestScope.category }") {
				$(this).attr("selected", true);
			}
		
		});
	 	</script>
 
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
                    		   href="review.do?cpage=${ requestScope.pi.currentPage - 1 }&category=${ requestScope.category }&search=${ requestScope.search }">
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
		                    	<a class="page-link" href="review.do?cpage=${ p }&category=${ requestScope.category }&search=${ requestScope.search }">
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
	                    	   href="review.do?cpage=${ requestScope.pi.currentPage + 1 }&category=${ requestScope.category }&search=${ requestScope.search }">
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
