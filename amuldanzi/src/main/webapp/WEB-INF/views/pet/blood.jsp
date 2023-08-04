<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kakao Map Example</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js" defer></script>
    <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=4cfe8de01569b97e3def8a80bd57abb6&libraries=services"></script>
	<jsp:include page="../main/header.jsp"></jsp:include>
	
	<link rel="stylesheet" href="/css/pet/hospital.css" />
	<link rel="stylesheet" href="/css/pet/pet.css" /> 
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&display=swap" rel="stylesheet"> 
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" defer>
	<style type="text/css">
	#footer{
	
	position: fixed;
	margin-top: 100px;
	
	}
	
	</style>
    <script>

    //jQuery 
    // map이라는 id에 지도가 표시될 영역 
    $(document).ready(function() {
        var mapContainer = document.getElementById('map');
		// 지도의 중심좌표 설정
        var options = {
            center: new kakao.maps.LatLng(36.164927, 128.002180),
            // 지도 확대 수준
            level: 13
        };
        // 위 두 변수를 카카오맵에 적용
        var map = new kakao.maps.Map(mapContainer, options);

        // 마커 생성
        var markers = {
        		  seoul: new kakao.maps.Marker({
        	            position: new kakao.maps.LatLng(37.5665, 126.9780)
        	        }),
        	        jeju: new kakao.maps.Marker({
        	            position: new kakao.maps.LatLng(33.2496, 126.5580)
        	        }),
        	        busan: new kakao.maps.Marker({
        	            position: new kakao.maps.LatLng(35.1796, 129.0750)
        	        }),
        	        kyungki: new kakao.maps.Marker({
        	            position: new kakao.maps.LatLng(37.4721, 126.8726)
        	        }),
        	        daegu: new kakao.maps.Marker({
        	            position: new kakao.maps.LatLng(35.8092, 128.5650)
        	        }),
        	        incheon: new kakao.maps.Marker({
        	            position: new kakao.maps.LatLng(37.4563, 126.7052)
        	        }),
        	        gwangju: new kakao.maps.Marker({
        	            position: new kakao.maps.LatLng(35.1605, 126.8514)
        	        }),
        	        daejeon: new kakao.maps.Marker({
        	            position: new kakao.maps.LatLng(36.3504, 127.3845)
        	        }),
        	        ulsan: new kakao.maps.Marker({
        	            position: new kakao.maps.LatLng(35.5384, 129.3114)
        	        }),
        	        sejong: new kakao.maps.Marker({
        	            position: new kakao.maps.LatLng(36.4804, 127.2895)
        	        }),
        	        chungbuk: new kakao.maps.Marker({
        	            position: new kakao.maps.LatLng(36.6360, 127.4910)
        	        }),
        	        chungnam: new kakao.maps.Marker({
        	            position: new kakao.maps.LatLng(36.6591, 126.6734)
        	        }),
        	        jeonbuk: new kakao.maps.Marker({
        	            position: new kakao.maps.LatLng(35.8203, 127.1087)
        	        }),
        	        jeonnam: new kakao.maps.Marker({
        	            position: new kakao.maps.LatLng(34.8159, 126.4628)
        	        }),
        	        gyungbuk: new kakao.maps.Marker({
        	            position: new kakao.maps.LatLng(36.5759, 128.5055)
        	        }),
        	        gyungnam: new kakao.maps.Marker({
        	            position: new kakao.maps.LatLng(35.2381, 128.6923)
        	        }),
        	        uleong: new kakao.maps.Marker({
        	            position: new kakao.maps.LatLng(37.4857, 130.8989)
        	        }),
        	        gwangwon: new kakao.maps.Marker({
        	            position: new kakao.maps.LatLng(37.5665, 128.8737)
        	        })
        			
        };

        // 전화번호 상태를 저장하는 변수
        var telState = {};
        
        // markers 객체 속성 요소 뽑아서 지도에 추가
        for (var key in markers) {
            markers[key].setMap(map);
        }

        //데이터를 가져와서 테이블에 표시할 함수
        function fetchData(url, areaName) {
            $.ajax({
                url: url,
                type: "GET",
                dataType: "json",
                success: function(data) {
                    // 끌고온 결과 테스트
					// console.log(data)
					// 기존 결과 지우기
                    $("#result").empty(); 
					
                    // 데이터를 순회하며 결과 추가
					$.each(data, function(index, item) {
						  var resultRow = "<tr class='result-item'>";
						  resultRow += "<td class='tel-info' data-tel='" + item.userTel + "'>***-****-****</td>";
						  resultRow += "<td>" + item.sido + "</td>";
						  resultRow += "<td>" + item.petBlood + "</td>";
						  resultRow += "<td>" + item.whichPet + "</td>";
						  resultRow += "</tr>";
						  $("#result").append(resultRow);
						});
					// 전화번호 요소 클릭했을 때 실행되는 이벤트
					 $(".tel-info").click(function() {
		                    var tel = $(this).data("tel");
		                    // 전화번호가 가려져 있으면 가려진 전화번호 표시
		                    if ($(this).text() === "***-****-****") {
		                        $(this).text(tel);
		                     // 아니면 가려진 형태 표시
		                    } else {
		                        $(this).text("***-****-****");
		                    }
		                });
					 // DataTables 플러그인을 적용하여 테이블을 페이징
					 if ($.fn.DataTable.isDataTable("#paging")) {
		                    // DataTable이 이미 초기화된 경우 추가 처리
		                } else {
		                    $("#paging").DataTable({
		                        "paging": true,
		                        "pageLength": 10,  // 기본으로 10개 1페이지
		                        "info": false, // 정보 숨기기
		                        "language": {
		                            "lengthMenu": "SHOW _MENU_", // 텍스트 변경
		                            "paginate": {
		                                "previous": "이전", // 텍스트 변경
		                                "next": "다음" // 텍스트 변경
		                            }
		                        }
		                    });
		                }
		            },
                error: function() {
                    alert(areaName + " 데이터를 가져오는데 실패했습니다.");
                }
            });
        }
  
        // 마커에 클릭 이벤트 리스너 추가
        for (var key in markers) {
            (function(key) {
                kakao.maps.event.addListener(markers[key], 'click', function() {
					// 마커에 정의된 이름을 key 값으로 저장
                    var areaName = key;
                    // controller 함수명 앞부분 소문자이기 때문에 소문자로 변경
                    var url = "/pet/" + areaName.toLowerCase() + "Data"; // URL 경로 수정
					// 함수 호출
                    fetchData(url, areaName);

                    // 전화번호 상태 확인
                    if (!telState[key]) {
                        // 클릭된 경우 전화번호 표시
                        $(".tel-info").text("***-****-****");
                        telState[key] = true;
                    }
                });
            })(key);
        }
    });


</script> 
</head>
<body>
	<div style="position:relative;top:120px;left:830px;">
    <h1 class='font' style='color:#fd2c58'>혈액 나눔 정보</h1>
    </div>
    <div style="height:1000px;">
    <div id="map" style="position:relative;top:120px;left:200px;width: 600px; height: 750px;"></div>
    <div class="result">
    <table id="paging" class= "table"> 
  		<thead>
    	<tr>
	      <th>전화번호</th>
	      <th>주 소</th>
	      <th>혈액형</th>
	      <th>반려동물 종류</th>
    	</tr>
  		</thead>
    <tbody id="result">
    </tbody>
    </div>
  	</div>
  
</table>
	<footer><jsp:include page="../main/footer.jsp"></jsp:include></footer>
</body> 

</html>
