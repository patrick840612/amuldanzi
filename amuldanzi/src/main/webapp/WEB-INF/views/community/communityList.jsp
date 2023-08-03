
<%@ page contentType="text/html; charset=UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>애물단지</title>




<!-- 부트스트랩 -->
<link href="/css/bootstrap.min.css" rel="stylesheet">



<link href="/chunks/css/c552b37c371c331c.css" rel="stylesheet">
<link href="/chunks/css/39c68523bb4928b9.css" rel="stylesheet">
<link href="/chunks/css/281067dbec461a13.css" rel="stylesheet">
<link href="/chunks/css/3ca3804aef0f69b8.css" rel="stylesheet">
<link href="/chunks/css/communitytext.css" rel="stylesheet">
<link href="/css/community/text.css" rel="stylesheet">




</head>

<jsp:include page="../main/header.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script type="text/javascript"> 
function updateBlameCount(commNo) {
    $.ajax({
      type: "GET",
      url: "/community/blameCount",
      data: {
        commNo: commNo
      },
      success: function(response) {
        var blameCount = response.blameCount;
        $("#blameCount").text(blameCount);

        if (blameCount >= 5) {
            console.log(commNo)
          $("#communityBoard" + commNo).hide();
        }
      },
      error: function(error) {
        console.error(error);
      }
    });
  }  
  
</script> 
<body>
	<div class="main_mainContents__GXYBn">
		<br /> <br /> <br /> <br /> <br /> <br />
		<hr class="popper_popperMenuDivider__j1QQj">
		<p class="main_mainTitle__nxOQS" style="font-weight: bold">커뮤니티</p>
		<hr class="popper_popperMenuDivider__j1QQj">
		</br>
		<div class="community_loungeLeftContent__wnv1Z">
			<div class="community_loungeList__HbstN">
				<div class="qaList_qaListContainer__73To2">
					<div class="qaList_qaListWrapper___YnhH">


						<c:forEach items="${communityLikeList}" var="likeList">
						<div class="qaList_qaListLabelWrapper__f7K7c">
							<div class="qaList_qaListTitle__Z1Ssh" style="color:blue">
							<a href="/community/communityDetail?comm_no=${likeList['commNo']}">
							${likeList['title']}</a><br/><br/><span style="color:black;">좋아요${likeList['likeCount']}</span></div> 
						</div>
						<div class="qaList_qaListImg__DiWnU">
							<span
								style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: absolute; inset: 0px;"><img
								alt="community_image"
								src="/images/community/${likeList['path']}"
								decoding="async" data-nimg="fill" sizes="100vw"
								style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover; object-position: center center; filter: none; background-size: cover; background-image: none; background-position: center center;">
								<noscript></noscript></span>
						</div> 
						</c:forEach>			
						
						
						
						<div>
						 <form action='/community/communityInsert' method='GET'>
						    <input class='commentLabel_defaultLabel__JHgyL' type='submit' value='글 쓰기'/>
						  </form>
						</div>

						<div class="qaList_labelWrapper__vsqC0">
							<div class="qaList_desktopLabelContainer__EEK_6"></div>
						</div>
						<hr class="qaList_qaListDivider__blo7m">
					</div>
				</div>
			</div>
			</br>
			<hr class="popper_popperMenuDivider__j1QQj">
			</br>
			<c:forEach items="${communityList}" var = "community">
				<div class="community_loungeList__HbstN">
					<div class="qaList_qaListContainer__73To2">
						<div class="qaList_qaListWrapper___YnhH">
							<div>
							<a href="/community/communityDetail?comm_no=${community['commNo']}">
								<div class="qaList_qaListTitle__Z1Ssh">${community['title']}</a></div>
								<div class="qaList_qaListText__2Cm8R">${community['content']}</div>
							</div>
							<div class="qaList_qaListImg__DiWnU">
								<span
									style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: absolute; inset: 0px;"><img
									alt="community_image"
									src="/images/community/${community['path']}"
									decoding="async" data-nimg="fill" sizes="100vw" 
									style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover; object-position: center center; filter: none; background-size: cover; background-image: none; background-position: center center;">
								<noscript></noscript></span>
							</div>
						</div>
						<div class="qaList_qaListAbout__qL7GR">
							<div class="qaList_communityType__p7p5C">좋아요 : ${community['likeCount'] }</div>
							<div>${community['id']}</div>
							<div>${community['date']}</div>
						</div>
						<div class="qaList_labelWrapper__vsqC0">
							<div class="qaList_desktopLabelContainer__EEK_6"></div>
						</div>
						<hr class="qaList_qaListDivider__blo7m">
					</div>	
					  <script>
					    // commNo 값을 전달하여 게시글 숨김 처리
					    updateBlameCount(${community['comm_no']});
					  </script>	
				</div>  
				</c:forEach> 
				</div>
			</div>
			</div>
			</div>
       		 <ul class="pagination">
            <!-- 처음 페이지로 이동하는 링크를 추가합니다 -->
			<li class="${currentPage == 1 ? 'disabled' : ''}">
			    <a href="/community/communityList?page=1" aria-label="처음 페이지로 이동">«</a>
			</li>
			
			<!-- 이전 페이지로 이동하는 링크를 추가합니다 -->
			<li class="${currentPage == 1 ? 'disabled' : ''}">
			    <a href="/community/communityList?page=${currentPage - 1}" aria-label="이전 페이지로 이동">‹</a>
			</li>
			
			<!-- 페이지 번호를 표시합니다 -->
			<c:forEach begin="1" end="${totalPages}" var="pageNumber">
			    <li class="${pageNumber == currentPage ? 'active' : ''}">
			        <a href="/community/communityList?page=${pageNumber}" aria-label="페이지 ${pageNumber}로 이동">${pageNumber}</a>
			    </li>
			</c:forEach>
			
			<!-- 다음 페이지로 이동하는 링크를 추가합니다 -->
			<li class="${currentPage == totalPages ? 'disabled' : ''}">
			    <a href="/community/communityList?page=${currentPage + 1}" aria-label="다음 페이지로 이동">›</a>
			</li>
			
			<!-- 마지막 페이지로 이동하는 링크를 추가합니다 -->
			<li class="${currentPage == totalPages ? 'disabled' : ''}">
			    <a href="/community/communityList?page=${totalPages}" aria-label="마지막 페이지로 이동">»</a>
			</li>
        </ul>
		</div>
		<hr class="popper_popperMenuDivider__j1QQj">
	</div>
</body>
<jsp:include page="../main/footer.jsp"></jsp:include>
</html>