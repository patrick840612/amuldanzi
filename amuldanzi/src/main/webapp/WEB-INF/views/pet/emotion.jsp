<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<!--
	Radius by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>  
	
	function updatePreview(event) {
	    var reader = new FileReader();
	    reader.onload = function() {
	      var imagePreview = document.getElementById('imagePreview');
	      imagePreview.src = reader.result;
	    };
	    reader.readAsDataURL(event.target.files[0]);
	  }
 
    function submitForm() {
      var form = $('#uploadForm')[0];
      var formData = new FormData(form);
      
      $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "/upload",
        data: formData,
        dataType: 'text',
        processData: false,
        contentType: false,
        cache: false,
        success: function (data) {
          //$('#responseMessage').text(data);
          console.log(data)
          $('#analysisResult').text(data);
        },
        error: function (e) {
          console.log("Error: ", e);
        }
      });
    }

</script>
<html>

		<script src="/js/pet/jquery.min.js"></script>
		<script src="/js/pet/skel.min.js"></script>
		<script src="/js/pet/util.js"></script>
		<script src="/js/pet/main.js"></script>
			
		<link rel="stylesheet" href="/css/pet/main.css" />
		<link rel="stylesheet" href="/css/pet/pet.css" /> 
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&display=swap" rel="stylesheet">
	
	<head>
		<title>나의 반려동물 표정 맞추기</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		
	</head>
	<body> 
		<!-- Header -->
		<jsp:include page="../main/header.jsp"></jsp:include>
		<!-- Header -->
			<header id="header">
				<div class="inner">
					
					<div class="content">
						<h1 class='font'>표정 맞추기!!</h1>
						<h2 class='font'>사랑하는 반려동물의 이미지를 첨부해 <br />
						표정을 맞춰보아요!</h2>
						<a href="#" class="button big alt"><span>Let's Go</span></a>
					</div>
					
					<a href="#" class="button hidden"><span>Let's Go</span></a>
				</div>
			</header>	
			
		<div class = "font">
			<br/><br/><br/><br/><br/><br/>
			<h2 style="text-align:center; color:#FE2E64">★나의 반려동물 표정 맞추기★</h2>
			<form id="uploadForm" method="POST" action="/upload" style="text-align:center">
		    <br/><br/><br/>
		    <div style="display: flex; justify-content: center; gap: 30px;">
		        <input type="file" id="imageFile" name="imageFile" accept=".jpg, .jpeg, .png" onchange="updatePreview(event)" />
		        <input type="button" value="Click!!" style="background-color:#FE2E64;color:white;" onclick="submitForm()" />
		    </div>
		    <img id="imagePreview" src="#" alt="" style="display:block;margin:auto;transform:translateX(-10px);" ><br/><br/>
		    <h3 class='font' style="font-size:40px;text-align:center">♣결과♣</h3>
		    <h2 class='font' style="font-size:30px;text-align:center" id="analysisResult"></h2>
		</form>
		</div>	 
		<!-- Main -->
			<div id="main">
				<div class="inner">
					<div class="columns"> 

						<!-- Column 1 (horizontal, vertical, horizontal, vertical) -->
							<div class="image fit">
								<img src="/images/pet/pet01.jpg" alt="화난 고양이 사진1" />
							</div>
							<div class="image fit">
								<img src="/images/pet/pet02.jpg" alt="화난 고양이 사진2" />
							</div>
							<div class="image fit">
								<img src="/images/pet/pet03.jpg" alt="화난 고양이 사진3" />
							</div>
							<div class="image fit">
								<img src="/images/pet/pet04.jpg" alt="화난 고양이 사진4" />
							</div>

						<!-- Column 2 (vertical, horizontal, vertical, horizontal) -->
							<div class="image fit">
								<img src="/images/pet/pet06.jpg" alt="화난 강아지 사진5" />
							</div>
							<div class="image fit">
								<img src="/images/pet/pet05.jpg" alt="졸린 고양이 사진6" />
							</div>
							
							<div class="image fit">
								<img src="/images/pet/pet08.jpg" alt="졸린 고양이 사진7" />
							</div>
							<div class="image fit">
								<img src="/images/pet/pet07.jpg" alt="귀여운 인절미 강아지 사진8" />
							</div>

						<!-- Column 3 (horizontal, vertical, horizontal, vertical) -->
							<div class="image fit">
								<img src="/images/pet/pet09.jpg" alt="슬픈 고양이 사진9" />
							</div>
							<div class="image fit">
								<img src="/images/pet/pet12.jpg" alt="웃는 강아지 사진10" />
							</div>
							<div class="image fit">
								<img src="/images/pet/pet11.jpg" alt="웃는 강아지 사진 11" />
							</div>
							<div class="image fit">
								<img src="/images/pet/pet10.jpg" alt="슬픈 고양이 사진 12" />
							</div>

						<!-- Column 4 (vertical, horizontal, vertical, horizontal) -->
							<div class="image fit">
								<img src="/images/pet/pet13.jpg" alt="슬픈 고양이 사진 13" />
							</div>
							<div class="image fit">
								<img src="/images/pet/pet14.jpg" alt="슬픈 고양이 사진 14" />
							</div>
							<div class="image fit">
								<img src="/images/pet/pet15.jpg" alt="슬픈 강아지 사진 15" />
							</div>
							<div class="image fit">
								<img src="/images/pet/pet16.jpg" alt="슬픈 강아지 사진 16" />
							</div>

					</div>
				</div>
			</div>


	</body>
</html>