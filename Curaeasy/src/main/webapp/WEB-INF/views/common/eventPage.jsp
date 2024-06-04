<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <jsp:include page="header.jsp" />

    <br>
    <div align="center">
        <img src="https://cdn-icons-png.flaticon.com/512/75/75718.png">
        <br><br>
        <h1 style="font-weight:bold;">
        	${ requestScope.eventMsg }
        </h1>
        <a href="${pageContext.request.contextPath}/"><button type="button" class="btn btn-success">메인페이지로</button></a>
    </div>
    <br>

    <jsp:include page="footer.jsp" />
    
</body>
</html>