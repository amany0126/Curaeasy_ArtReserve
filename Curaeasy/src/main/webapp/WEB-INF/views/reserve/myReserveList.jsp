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

    <title>나의 대관일자</title>


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
            
            padding:5% 10%;
            background-color:white;
            display: inline-block;
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

        /* td:hover { display: block; font-size: 15px; font-weight: 600; cursor: pointer; } */
        tr:hover { background-color: lightgray; }

    </style>
</head>
<body>

<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/mainPageSidbar.jsp" />
<br><br>
<div class="innerOuter">
    <div class="content">
        <div class="content-header">
            <h1>나의 예매 리스트</h1>
        </div>
        <table id="noticeList" class="notice-list">
            <thead>
                <tr>
                    <th>예약번호</th>
                    <th>예약인원</th>
                    <th>전시명</th>
                    <th>입장일</th>
                    <th>결제일</th>
                    <th>결제금액</th>
                </tr>
            </thead>
            <tbody>                
                <c:forEach var="n" items="${ requestScope.list }">
                		<tr>
                			<td>${ n.reserveNo }</td>
                			<td>${ n.reserveCount }</td>
                			<td>${ n.displayNo }</td>
                			<td>${ n.entranceDate }</td>
                            <td>${ n.paymentDate }</td>
                            <td>${ n.paymentPrice }</td>
                		</tr>
                </c:forEach>
            </tbody>
        </table>
        
        

        
        <!-- 페이징바 -->
        
    

        
        <!-- <div id="pagingArea">
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
            </div> -->
            
            
    </div>
</div>

<script>
    $("#noticeList tbody tr").click(function() {
        let f = document.createElement('form');
        let dno = '${requestScope.dno}'
    
        let obj1;
        obj1 = document.createElement('input');
        obj1.setAttribute('type', 'hidden');
        obj1.setAttribute('name', 'reserveNo');
        obj1.setAttribute('value', this.children[0].innerText);

        f.appendChild(obj1);
        f.setAttribute('method', 'post');
        f.setAttribute('action', 'reserveComplete.do');
        
        document.body.appendChild(f);
        f.submit();
        
    })
</script>
<jsp:include page="../common/footer.jsp" />
<form action="" method=""></form>
</body>
</html>
