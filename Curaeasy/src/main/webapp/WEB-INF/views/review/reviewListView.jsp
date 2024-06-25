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

    <!--검색돋보기-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <title>후기 게시글목록</title>


    <style>
        .innerOuter {
            border:0px solid lightgray;
            width:70%;
            margin:auto;
            padding: 3% 5%;
			margin-top: 30px; 
            margin-bottom: 100px;

            background-color :#e7e6e6;
            border-radius: 20px;
            box-shadow: 0 0 10px gray;
        }
        .search-box {
            display: flex;
            justify-content: flex-end;
            margin-top: 20px;
        }

        .content-header {
            margin-bottom: 20px;

            /* 폰트 */
            font-family: "Do Hyeon", sans-serif;
            font-weight: 400;
            font-size :larger;
            font-style :oblique;  
        }
        /*button,option,input { border-radius: 20px !important;  }*/

        #SearchFunction {padding: 0px 20px 20px;}
        #SearchFunction button{
            border-radius: 20px;
            width: 70px; height: 35px;
            background-color: white; 

        }
        #SearchFunction button:hover { background-color: gray; }
        #SearchFunction input{
            border-radius: 20px;
            display: inline;
            width: 350px;
        }
        #SearchFunction>select{
            border-radius: 20px; width: 100px;
            display: inline;
            
        }
        #SearchFunction{
            position: absolute;
            top: 430px;
            left: 50%;
            transform: translate(-50%, -50%);

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


        td{
         text-align: center;}
        




      /*   td:hover { display: block; font-size: 15px; font-weight: 600; cursor: pointer; } */
        tbody > tr:hover { background-color: lightgray;  }

        #ReviewBtn {
            margin-bottom: 100px;
            right:400px;
            background-color: white; border-radius: 20px; width:130px; height: 40px;
        }
        #ReviewBtn:hover{ transform: translateX(20px); background-color: #333; color:white;}



    </style>
</head>
<body>

<jsp:include page="../common/header.jsp" />
<br><br>
<div class="innerOuter">
    <div class="content">
        <div class="content-header">
            <h1>&#128486; 후기게시글 목록 &#128487;</h1>
            <form action="reviewEnrollForm.re">
                <button id="ReviewBtn" type="submit" style="float: right;">후기 작성하기</button>
           </form>
        </div>
        

       <div class="search-box" style="float: right">
       
        <form action="review.do" id="SearchFunction">
            <select name="category" id="category" class="form-control" >
                <option value="">전체</option>
                <option value="writer">작성자</option>
                <option value="title">제목</option>
            </select>
            <input type="search" name="search" id="search" placeholder="검색어를 입력하세요." value="${ requestScope.search }" style="display: inline; " class="form-control">
            <button type="submit" class="search-button"><i class="fas fa-search"></i></button>
        	</form>
        	<br><br>
        </div>
        <c:if test="${ requestScope.ticket > 0}">
        <br><br>

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
       			
       			let rno = $(this).children().eq(0).text();
       			
       			
       			location.href = "reviewDetail.do?rno=" + rno;
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
		                    	<a href="review.do?cpage=${ p }&category=${ requestScope.category }&search=${ requestScope.search }">
									${ p }
								</a>
		                    </li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item active">
		                    	<a>
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
