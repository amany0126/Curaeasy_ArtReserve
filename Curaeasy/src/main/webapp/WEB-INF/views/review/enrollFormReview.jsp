<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>작가신청</title>
    <style>
        .radio{
          width: 17px; 
          display: inline;
        }
        .innerOuter {
            border:0px solid lightgray;
            width:70%;
            margin:auto; margin-top: 50px; margin-bottom: 50px;
            padding:5% 10%;
            background-color:white;
        }

        #reviewContent { resize: none; width: 100%; height: 400px; }
        img { border-radius: 20px; border-style : ridge;}
        #but>button{ border-radius: 20px; width: 130px; background-color: white;}
        #but>button:hover { background-color: lightgray; }
    </style>
</head>
<body>
	    <jsp:include page="../common/header.jsp" />
        <!-- 회원가입 -->
        <div class="content">
            <br><br>
            <div class="innerOuter">
                <h3>전시회 후기</h3>
                <hr style="border: 2px solid black;">
                
                <form action="insertReview.re" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="reviewTitle">* 전시회 제목 :</label>
                        <input type="text" class="form-control" id="reviewTitle" placeholder="한글 30글자 이내" maxlength="30px" name="reviewTitle" required> <br>
                        <div id="checkResult1" style="font-size: 0.8em ;display: none;" ></div>
                        <label for="displayName">* 리뷰 작성 가능한 전시회 목록 : </label> <br>
                        <select name="displayName" id="displayName" class="form-control"  style="display: inline;">
                            <c:forEach var="n" items="${requestScope.list}">
                                <option value="${n}">${n}</option>
                            </c:forEach>
                        </select>
                         <br>
                        <label for="reviewContent">* 전시회 후기 내용 :</label>
                        <textarea name="reviewContent" id="reviewContent" class="form-control" rows="15" placeholder="후기 내용" required></textarea>
                        <!-- <textarea class="form-control" rows="5" id="artistIntroduce" name="artistIntroduce" placeholder="한글 100글자 이하" maxlength="100px" required></textarea> -->
                        <br>
                        <label for="">* 썸네일이미지 : </label><br>
                        <img src="https://i.ibb.co/1Kcs8pB/001.png" width="200px" alt="썸네일이미지" id="reviewPreviewImage" class="rounded" ><br>
                        <input type="text" disabled style="background-color: white; border: 0; color: red;" id="reviewPreviewImageOk" value="이미지를 넣어주세요">
                        <br><br>
                        <input type="file" class="form-control-file border" id="reviewImage" name="upfile" onchange="loadImg(this, 1)" required style="display: none;"> <br>
                       
                    </div>
                    <div align="center" id="but">
                        <button type="button" onclick="history.back()">뒤로가기</button>
                        <button type="submit">후기 작성하기</button>
                    </div>
                </form>
            </div>
        </div>
         <br><br>
    <jsp:include page="../common/footer.jsp" />
    <script>
    
   
	$(function(){
		$("#reviewPreviewImage").click(function(){
			$("#reviewImage").click();
		});
	});
	
	function loadImg(inputFile, num) {
		if(inputFile.files.length == 1){
			let reader = new FileReader();
			reader.readAsDataURL(inputFile.files[0]);
			reader.onload=function(e){
				switch(num){
				case 1 : $("#reviewPreviewImage").attr("src",e.target.result); 
                         $("#reviewPreviewImageOk").val("썸네일 첨부됨").show().css("color","green");
                break

			}
		};
		}else{
			switch(num){
				case 1 : $("#reviewPreviewImage").attr("src","https://i.ibb.co/1Kcs8pB/001.png"); 
                          $("#reviewPreviewImageOk").val("이미지를 넣어주세요").show().css("color","red");
                break
			}
		}
	};

    </script>
</body>
</html>