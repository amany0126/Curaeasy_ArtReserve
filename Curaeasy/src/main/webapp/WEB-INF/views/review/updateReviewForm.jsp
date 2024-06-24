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

    <!--폰트-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<title>작가신청</title>
    <style>
        .radio{
          width: 17px; 
          display: inline;
        }
        .innerOuter {
            border: 0px solid lightgray;
            width:70%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }

        
        #reviewContent { resize: none; width: 100%; height: 400px; }
        img { border-radius: 20px; border-style : ridge;}
        #but>button{ border-radius: 20px; width: 130px; background-color: white;}
        #but>button:hover { background-color: lightgray; }
        button:hover{transform: translateY(10px); }
        h3{ 
            /* 폰트 */
            font-family: "Do Hyeon", sans-serif;
            font-weight: 400;
            font-style :oblique;
         }
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
                
                <form action="updateReview.re" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <input type="hidden" class="form-control" id="reviewNo" name="reviewNo" value="${requestScope.list.reviewNo}"> <br>
                        <label for="reviewTitle">* 수정할 제목 :</label>
                        <input type="text" class="form-control" id="reviewTitle" placeholder="한글 30글자 이내" value="${requestScope.reviewTitle}" maxlength="30px" name="reviewTitle" required> <br>
                        <div id="checkResult1" style="font-size: 0.8em ;display: none;" ></div>
                        <label for="displayName">* 리뷰 수정중인 전시회 : </label> <br>
                        <input type="text" class="form-control" id="" name="" required value="${requestScope.displayName}" disabled> <br>
                        <input type="hidden" class="form-control" id="displayName" name="displayName" required value="${requestScope.displayName}"> 
                        <label for="reviewContent">* 수정할 전시회 후기 내용 :</label>
                        <textarea name="reviewContent" id="reviewContent" class="form-control" rows="15" placeholder="후기 내용"  required>${requestScope.list.reviewContent}</textarea>
                        <!-- <textarea class="form-control" rows="5" id="artistIntroduce" name="artistIntroduce" placeholder="한글 100글자 이하" maxlength="100px" required></textarea> -->
                        <br>
                        <label for="">* 수정할 썸네일이미지 : </label><br>
                        <img src="resources/reviewProfileImgs/${requestScope.list.reviewImage}" width="200px" alt="썸네일이미지" id="reviewPreviewImage" class="rounded" ><br>
                        <input type="text" disabled style="background-color: white; border: 0; color: green;" id="reviewPreviewImageOk" value="기존 이미지">
                        <br><br>
                        <input type="file" class="form-control-file border" id="reviewImage" name="reUpfile"  onchange="loadImg(this, 1)"  style="display: none;"> <br>
                       
                    </div>
                    <div align="center" id="but">
                        <button type="button" onclick="history.back()">뒤로가기</button>
                        <button type="submit" >후기 수정하기</button>
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
                         $("#reviewPreviewImageOk").val("새로운 이미지 첨부됨").show().css("color","green");
                break

			}
		};
		}else{
			switch(num){
				case 1 : $("#reviewPreviewImage").attr("src","resources/reviewProfileImgs/${requestScope.list.reviewImage}"); 
                          $("#reviewPreviewImageOk").val("기존 이미지").show().css("color","green");
                break
			}
		}
	};

    </script>
</body>
</html>