<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
        #but>button{border-radius: 20px; width: 160px; height: 40px; background-color: white;}
        #but>button:hover{transform: translateY(10px); background-color: black; color:white;}
    </style>
</head>
<body>
	    <jsp:include page="../common/header.jsp" />
        <!-- 회원가입 -->
        <div class="content">
            <br><br>
            <div class="innerOuter">
                <h3>작가 정보 변경</h3>
                <hr style="border: 2px solid black;">
                
                <form action="updateArtist.at" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="artistNickName">* 활동명 :</label>
                        <input type="text" class="form-control" id="artistNickName" name="artistNickName"  value="${requestScope.list.artistNickName}" required disabled> <br>
                        <div id="checkResult1" style="font-size: 0.8em ;display: none;" ></div>
                        <label for="artistOrdinal">* 기수 : </label> <br>
                        <input type="text" class="form-control " id="artistOrdinal" name="artistOrdinal" value="${requestScope.list.artistOrdinal}년도" required disabled checked><br>
                        
                        <label for="artistIntroduce">* 자기소개/설명 :</label>
                        <input type="url" class="form-control" id="artistIntroduce" placeholder="변경할 포트폴리오 주소 기입" value="${requestScope.list.artistIntroduce}" name="artistIntroduce" maxlength="100px" required> <br>
                        <!-- <textarea class="form-control" rows="5" id="artistIntroduce" name="artistIntroduce" placeholder="한글 100글자 이하" maxlength="100px" required></textarea> -->
                        <br>
                        <label for="">* 변경할 프로필 이미지 :</label><br>
                        <!-- <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5aSSsOYE2kGFloVt8UbHgjAwZ6Z7GaCpbDQ&s" width="200px" alt="프로필이미지" id="artistPreviewImage" class="rounded" >
                        <br><br>
                        <input type="file" class="form-control-file border" id="artistImage" name="upfile" onchange="loadImg(this, 1)" required> <br> -->


                        <img src="resources/artistProfileImgs/${requestScope.list.artistImage}" width="200px" alt="프로필이미지" id="artistPreviewImage" class="rounded" ><br>
                        <input type="text" disabled style="background-color: white; border: 0; color: green;" id="artistPreviewImageOk" value="기존 이미지">
                        <br><br>
                        <input type="file" class="form-control-file border" id="artistImage" name="reUpfile"  onchange="loadImg(this, 1)"  style="display: none;"  accept="image/png, image/jpeg" /> <br>
                    </div>
                    <div align="center" id="but">
                        <button type="button"onclick="history.back()">뒤로가기</button>
                        <button type="submit" >작가 정보 수정하기</button>
                    </div>
                </form>
            </div>
        </div>
         <br><br>
    <jsp:include page="../common/footer.jsp" />
    <script>
    
 
    
  
	$(function(){
		$("#artistPreviewImage").click(function(){
			$("#artistImage").click();
		});
	});
	
	function loadImg(inputFile, num) {
		if(inputFile.files.length == 1){
			let reader = new FileReader();
			reader.readAsDataURL(inputFile.files[0]);
			reader.onload=function(e){
				switch(num){
				case 1 : $("#artistPreviewImage").attr("src",e.target.result); 
                         $("#artistPreviewImageOk").val("새로운 이미지 첨부됨").show().css("color","green");
                break

			}
		};
		}else{
			switch(num){
				case 1 : $("#artistPreviewImage").attr("src","resources/artistProfileImgs/${requestScope.list.artistImage}"); 
                          $("#artistPreviewImageOk").val("기존 이미지").show().css("color","green");
                break
			}
		}
	};
    </script>
</body>
</html>