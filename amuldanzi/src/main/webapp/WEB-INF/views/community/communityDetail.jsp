
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript"> 
$(document).ready(function() {
	// 좋아요 개수 업데이트 하는 함수 
    function updateLikeCount() {
        $.ajax({
            type: "GET",
            url: "/community/likeCount",
            data: {
                commNo: "${community.commNo}"
            },
            success: function(response) {
                var likeCount = response.likeCount;
                $("#likeCount").text(likeCount);
            },
            error: function(error) {
                console.error(error);
            }
        });
    }

	// 신고 개수 업데이트 하는 함수
    function updateBlameCount() {
        $.ajax({
            type: "GET",
            url: "/community/blameCount",
            data: {
                commNo: "${community.commNo}"
            },
            success: function(response) {
                var blameCount = response.blameCount;
                $("#blameCount").text(blameCount);
            },
            error: function(error) {
                console.error(error);
            }
        });
    }

	// 좋아요 / 좋아요 취소 기능 처리 함수
    function likeCommunity(commMemberId, commNo, event) {

        // submit 으로 넘어가는걸 막고
        event.preventDefault();

        // 현재 좋아요 상태 확인
        var isLiked = $("#like-button").hasClass("liked");

        // 이미 좋아요가 되어있는 경우 좋아요 취소 요청을 보냅니다.
        if (isLiked) {
            $.ajax({
                url: "/community/unlike",
                type: "DELETE",
                data: {
                    commMemberId: commMemberId,
                    commNo: commNo
                },
                success: function(response) {
                    updateLikeCount();
                    console.log("좋아요 취소 성공");
                    // 좋아요 취소 후 버튼 스타일 변경
                    $("#like-button").removeClass("liked");
                },
                error: function(error) {
                    console.log(error);
                }
            });
        } else {
            // 좋아요를 처리하는 요청을 보냅니다.
            $.ajax({
                url: "/community/like",
                type: "POST",
                data: {
                    commMemberId: commMemberId,
                    commNo: commNo
                },
                success: function(response) {
                    updateLikeCount();
                    console.log("좋아요 성공");
                    // 좋아요 처리 후 버튼 스타일 변경
                    $("#like-button").addClass("liked");
                },
                error: function(error) {
                    console.log(error);
                }
            });
        }
    }

	// 신고 / 신고 취소 기능을 처리하는 함수
    function blameCommunity(commMemberId, commNo, event) {
        
        event.preventDefault();

        // 현재 좋아요 상태 확인
        var isLiked = $("#blame-button").hasClass("liked");

        // 이미 좋아요가 되어있는 경우 좋아요 취소 요청을 보냅니다.
        if (isLiked) {
            $.ajax({
                url: "/community/unblame",
                type: "DELETE",
                data: {
                    commMemberId: commMemberId,
                    commNo: commNo
                },
                success: function(response) {
                    updateBlameCount();
                    console.log("신고 취소 성공");
                    // 좋아요 취소 후 버튼 스타일 변경
                    $("#blame-button").removeClass("liked");
                },
                error: function(error) {
                    console.log(error);
                }
            });
        } else {
            // 좋아요를 처리하는 요청을 보냅니다.
            $.ajax({
                url: "/community/blame",
                type: "POST",
                data: {
                    commMemberId: commMemberId,
                    commNo: commNo
                },
                success: function(response) {
                    updateBlameCount();
                    console.log("신고 성공");
                    // 좋아요 처리 후 버튼 스타일 변경
                    $("#blame-button").addClass("liked");
                },
                error: function(error) {
                    console.log(error);
                }
            });
        }
    }

    // 좋아요 버튼 클릭 이벤트
    $("#like-button").click(function(event) {
        var commMemberId = "${id}";
        var commNo = "${community.commNo}";
        likeCommunity(commMemberId, commNo, event);
    });

    // 신고 버튼 클릭 이벤트
    $("#blame-button").click(function(event) {
        var commMemberId = "${id}";
        var commNo = "${community.commNo}";
        blameCommunity(commMemberId, commNo, event);
    });

    // 초기 좋아요 및 신고 숫자 업데이트
    updateLikeCount();
    updateBlameCount();


    // 댓글 등록 버튼 클릭시 
    $("#submit-button").click(function(event) {
        event.preventDefault(); // 강제 submit 막고
        addReply(); // 함수 호출
    });
        

        function addReply() {
            var commNo = "${community.commNo}"; // 글번호 변수
            var memberId = "${id}"; // ID 변수
            var replyContent = $("#reply-content").val(); // 댓글 내용

            // AJAX 요청 보내기
            $.ajax({
                url: "/community/addReply",
                type: "POST",
                data: {
                    commNo: commNo,
                    memberId: memberId,
                    replyContent: replyContent
                },
                success: function(response) {
                    // 댓글 등록 성공 시 처리할 로직 작성
                    console.log("성공");
                    $("#reply-content").val("");
                    fetchReplies(); // 댓글 등록 후 댓글 목록 업데이트
                    replyCount(); // 댓글 개수 업데이트 
                },
                error: function(error) {
                    // 오류 발생 시 처리할 로직 작성
                }
            });
        }
   

    function fetchReplies() {
        $.ajax({
            type: "GET",
            url: "/community/getReplies",
            dataType: "json",
            data: {
                commNo: "${community.commNo}"
            },
            success: function(response) {
                console.log("성공");
                // 서버에서 반환된 댓글 리스트 데이터를 처리하여 화면에 표시
                displayReplies(response);
            },
            error: function(error) {
                console.error(error);
            }
        });
    }

    // 댓글 리스트를 화면에 표시하는 함수 
    function displayReplies(replies) {
        // 댓글 리스트를 보여줄 영역을 선택
        var replyList = $("#replyList");
        replyList.empty(); // 기존 댓글 리스트 내용 초기화

        // 댓글 데이터를 반복하여 동적으로 댓글 리스트 생성
        var commentDiv = $("<div>").addClass("comment_qaDetailComment__guTi_");
        for (var i = 0; i < replies.length; i++) {
            var reply = replies[i];
            var commentIdWrapper = $("<div>").addClass("comment_qaCommentIdWrapper__u6F4S");
            var commentUserId = $("<div>").text(reply.id); // 댓글 작성자 ID
            var commentDate = $("<div>").text(reply.replyDate); // 댓글 작성 일시
            var commentContent = $("<div style ='position:relative; top:25px;'>").text(reply.replyContent); // 댓글 내용

            commentIdWrapper.append(commentUserId);
            commentIdWrapper.append(commentContent);
            commentIdWrapper.append(commentDate); 
              

            var deleteButton = $("<button>")
                .addClass("commentLabel_defaultLabel__JHgyL delete-button")
                .text("댓글 삭제")
                .data("commNo", reply.commNo)
                .data("replyNo", reply.replyNo); 


            var buttonContainer = $("<div style ='position:relative; width: 265px; left: 883px; margin: 0;'>")
            .addClass("comment_buttonContainer__JHgyL") 
            .append(deleteButton);

            commentDiv.append(commentIdWrapper); 
            commentDiv.append(buttonContainer);

            var hr = $("<hr/>");  
            commentDiv.append(hr);
                

            replyList.append(commentDiv);
        } 
        updateLikeCount();
        updateBlameCount(); 
     
    }
    fetchReplies();

 // 댓글 삭제 함수
    function deleteReply(commNo, replyNo) {
        $.ajax({
            url: "/community/deleteReply",
            type: "DELETE",
            data: {
                commNo: commNo,
                replyNo: replyNo
            },
            success: function(response) {
                console.log("댓글 삭제 성공");
                // 삭제된 댓글을 화면에서 제거
                fetchReplies();
                replyCount();
            },
            error: function(error) {
                console.log(error);
            }
        });
    }

    // 댓글 삭제 버튼 클릭 이벤트
    $(document).on("click", ".delete-button", function(event) {
        var commNo = $(this).data("commNo");
        var replyNo = $(this).data("replyNo");
        console.log(commNo);
        console.log(replyNo);
        deleteReply(commNo, replyNo);
    });

    // 댓글 개수 업데이트 함수 
    function replyCount() {
        $.ajax({
          type: "GET",
          url: "/community/replyCount", // 가져올 replyCount의 URL을 올바르게 변경합니다.
          data: {
            commNo: "${community.commNo}"
          },
          success: function(response) {
            var replyCount = response.replyCount;
            $("#replyCount").text(replyCount); // 가져온 값을 replyCount 요소에 업데이트합니다.
          },
          error: function(xhr, status, error) {
            console.error(error);
          }
        });
      }

    replyCount();
    
});

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
								<c:choose>
							    <c:when test="${community.memberId.id eq id}">
							        <a href="/community/communityModify?comm_no=${community.commNo}" class="commentLabel_defaultLabel__JHgyL">게시글 수정</a>
							    </c:when>
							    <c:otherwise> 
							    </c:otherwise>
							    </c:choose>
							   
							   <c:choose>
							    <c:when test="${community.memberId.id eq id}">
							    <button class="commentLabel_defaultLabel__JHgyL">게시글 삭제</button>
							     </c:when>
							    <c:otherwise> 
							    </c:otherwise> 
							    </c:choose>
							    
							    
								<button class="commentLabel_defaultLabel__JHgyL" id="like-button">좋아요 &nbsp;&nbsp;<span id="likeCount">${likeCount}</span></button>
								<button class="commentLabel_defaultLabel__JHgyL" id="blame-button">신고 &nbsp;&nbsp;<span id="blameCount">${blameCount}</span></button>
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
				<div class="qaDetail_qaDetailTotal__wSReo">댓글: &nbsp<span id="replyCount">${replyCount}</span></div>
				<div class="qaDetail_qaDetailComment__7y1PJ">
					
					
					<!-- 댓글 -->
					<div class="answer_qaAnswerInputWrapper___cOZ0">
						<textarea id="reply-content" placeholder="댓글을 입력해주세요"></textarea>
						<div class="answer_inputBtnWrapper__8hVzb">
							<div class="answer_questionImgContainer__oRcY2"></div>
							<div class="answer_answerBtnContainer__VgUOs">
								<div>
									<button id="submit-button" class="answer_submitBtn__lKInH">등록</button>
								</div>
							</div>
						</div>
					</div>
				</div> 
						<div id="replyList">
						</div>
			</div>
		</div>
	</div>
</body>
</html>