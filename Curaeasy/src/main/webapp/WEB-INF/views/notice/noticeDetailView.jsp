
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

    <title>공지사항 상세보기</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
        }
        .header, .footer {
            background-color: #f8f8f8;
            padding: 20px;
            text-align: center;
        }
        .content {
            padding: 20px;
            margin-top: 50px; margin-bottom: 50px;
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
            margin: 0 0 10px 0;
        }
        .notice-detail {
            border: 1px solid #ddd;
            padding: 20px;
            margin-bottom: 20px;
            border-left: none; border-right: none;
        }
        .notice-detail h2 {
            font-size: 1.5em;
            margin-bottom: 10px;
        }
        .notice-meta {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            font-size: 0.9em;
            color: #777;
        }
        .notice-content {
            margin-top: 20px;
            font-size: 1em;
            line-height: 1.5;
        }
        .notice-nav {
            margin: 20px 0;
            font-size: 0.9em;
            color: #555;
        }
        .notice-nav .nav-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
        }
        .nav-item span {
            min-width: 60px;
            font-weight: bold;
            text-align: left;
        }
        .nav-item a {
            flex-grow: 1;
            margin-left: 10px;
            text-align: left;
        }
        .btn-container {
            text-align: center;
            margin-top: 20px;
        }
        .btn-container button {
            padding: 10px 20px;
            border: 1px solid #ccc;
            background-color: #333;
            color: white;
            cursor: pointer;
            border-radius: 20px; width: 150px;
        }
        .icon {
            margin-left: 10px;
        }
        .separator {
            border-bottom: 1px solid #ddd;
            margin: 10px 0;
        }

        td {height: 300px;}
        button:hover{transform: translateY(10px); }

    </style>
</head>
<body>

<jsp:include page="../common/header.jsp" />

<div class="container">
    <div class="content">
    
        <div class="content-header">
            <h1>${ n.noticeTitle }</h1>
        </div>
        
        <div class="notice-detail">
            


            <table id="contentArea" align="center" class="table">
                <div class="notice-meta">
                    <span>작성자: 관리자</span>
                    <span>작성일 : ${ n.noticeDate }</span>
                    <span>조회수 : ${ n.noticeCount }</span>
                </div>


                <tr>
                    <tr>
                    <th>첨부파일</th></tr>
                    <td colspan="3">
                    	<c:choose>
	                    	<c:when test="${ empty n.noticeAttachment }">
	                    		첨부파일이 없습니다.
	                    	</c:when>
	                    	<c:otherwise>
                        		<img src="${ n.noticeAttachment }" >
                        	</c:otherwise>
                        </c:choose>
                    </td>
                </tr>
                <tr>
                    <th colspan="3">내용</th>
                </tr>
                <tr>
                    <td colspan="3">
                    	<p style="height:150px;">
							<!-- <img  src="resources/images/cimg1.png" alt="">  -->

                    		${ requestScope.n.noticeContent }
                    	</p>
                    </td>
                </tr>
            </table>

        </div>


        <div class="btn-container">
            <button onclick="location.href='notice.do'">목록으로</button>
        </div>


        <div class="notice-nav">
            <div class="nav-item">
                <span>이전글</span>
                    <a href="noticeDetail.do?cpage=${ pi.currentPage - 1 }&nno=${ previousNoticeId }">이전게시글</a>
                <span class="icon">&#8743;</span>
            </div>
            <div class="separator"></div>
            <div class="nav-item">
                <span>다음글</span>
                    <a href="noticeDetail.do?cpage=${ pi.currentPage + 1 }&nno=${ nextNoticeId }">다음게시글</a>
                <span class="icon">&#8744;</span>
            </div>
        </div>




        
        

    </div>
</div>

<jsp:include page="../common/footer.jsp" />

</body>
</html>
