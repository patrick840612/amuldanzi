
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
<link href="/chunks/css/text.css" rel="stylesheet">





</head>

<jsp:include page="../main/header.jsp"></jsp:include>
<script type="text/javascript">
</script> 
<body >
	<div class="qaDetail_qaDetailContainer__GdYJp">
		<div class="qaDetail_qaDetailContent__ggrjL">
			<form action="/community/delete" method="post">
			<input name="comm_no" type="hidden" value="${community.commNo}"/>
			
			<div class="qaDetail_qaDetailQuestion__AXVqt">
				<div class="qaDetail_qaDetailTitle__xKc9F">					
					<h1 class="qaDetail_qaDetailTop__O4CyB">${community.commTitle}</h1>
				</div>
				<div class="qaDetail_qaDetailText__ClRN5">${community.commContent}</div>
				<div class="qaDetail_qaDetailImgBox__VzApc"></div>
				<div class="qaDetail_qaDetailImgBox__VzApc"> 
				<c:forEach var="image" items="${commImages}" varStatus="loop">
					<c:if test="${loop.index < 3}">
				    <img  class="img_verticalImage__P4gbA" src="/images/community/${image}" alt="Community Image" style="width: 600px; height: 500px;" />
					</c:if>
				</c:forEach>
				
				</div>
						<div class="comment_commentInfo__OI8e5">
							<div>
       							 <a href="/community/communityModify?comm_no=${community.commNo}" class="commentLabel_defaultLabel__JHgyL">게시글 수정</a>
							    <button class="commentLabel_defaultLabel__JHgyL">게시글 삭제</button>
								<button class="commentLabel_defaultLabel__JHgyL" type="submit">좋아요 </button>
								<button class="commentLabel_defaultLabel__JHgyL">신고 0</button>
							</div>
						</div>
				<br/>
				<div class="qaDetail_qaDetailInfo__SKGtj">
					<div>
						<div class="qaDetail_qaDetailUser__A8sIb">${community.memberId.id}</div>
						<div class="qaDetail_qaDetailDate__3o03Q">${community.commDate}</div>
					</div>
				</div>
			</div>
			</form>
			<div class="qaDetail_qaDetailBar__tOqjr"></div>
			<ins class="adsbygoogle" data-ad-client="ca-pub-4786722989459138"
				data-ad-slot="6986428526" data-ad-format="auto"
				data-full-width-responsive="true" style="display: block;"></ins>
			<div class="qaDetail_qaDetailAnswerWrapper__TJpOV">
				<div class="qaDetail_qaDetailTotal__wSReo">댓글 ${community.answerCount}</div>
				<div class="qaDetail_qaDetailComment__7y1PJ">
					<div class="answer_qaAnswerInputWrapper___cOZ0">
						<textarea placeholder="댓글을 입력해주세요"></textarea>
						<div class="answer_inputBtnWrapper__8hVzb">
							<div class="answer_questionImgContainer__oRcY2"></div>
							<div class="answer_answerBtnContainer__VgUOs">
								<form enctype="multipart/form-data">
									<input id="uploadFile" type="file" multiple=""
										accept="image/jpg,image/png,image/jpeg,image/gif"
										class="answer_fileUploadWrapper__Q0Qrd">
								</form>
								<div>
									<label for="uploadFile" class="answer_photoBtn__J_YLl"><img
										src="/icons/ICON_Camera.png">사진첨부</label>
									<button class="answer_submitBtn__lKInH">등록</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="qaDetail_qaDetailAnswer__E9eTw" id="answers-30298">
					<div class="comment_qaDetailComment__guTi_">
						<div class="comment_qaCommentIdWrapper__u6F4S">
							<div>${community.memberId.id}</div><!-- 여기는 사용자 로그인 세션값이 들어가야함  -->
							<div>${community.commDate}</div>
						</div>
						<div class="comment_qaDetailImgNone__ngvPO"></div> 
						<div class="comment_commentInfo__OI8e5">
							<div>
								<button class="commentLabel_defaultLabel__JHgyL" onclick="likeCommunity(${community.commNo})">좋아요 0</button>
								<button class="commentLabel_defaultLabel__JHgyL">싫어요 0</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>