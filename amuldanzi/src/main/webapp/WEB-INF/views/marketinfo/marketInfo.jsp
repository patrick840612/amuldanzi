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
    		<link rel="stylesheet" href="/css/marketinfo/pet.css" />  
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&display=swap" rel="stylesheet"> 
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" defer>
    <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=4cfe8de01569b97e3def8a80bd57abb6&libraries=services"></script>

	
	<jsp:include page="../main/header.jsp"></jsp:include>  
 
	<style type="text/css">
	    #btnAll {
        background-color: #fd2c58;
        color: white;
    }
	
    .kboard-branch-button {
        border-radius: 50px; /* Making the buttons more round */
        padding: 10px 20px;
        font-size: 16px;
        background-color: #ffffff; /* Setting the background color to white */
        border: 2px solid #fd2c58; /* Setting the border color to pink */
        color: black; /* Setting the text color to pink */
        margin: 5px;
    }
	
	.first-row-buttons {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    margin-bottom: 10px;
    position: absolute;
    top: 185px; /* Adjust the top position according to your preference */
    width: 1000px;
    left: 57%;
    transform: translateX(-50%);
    margin-right: 5px;
}

/* CSS for the buttons in the second row */
.second-row-buttons {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    position: absolute;
    top: 245px; /* Adjust the top position according to your preference */
    width: 1000px;
    left: 57%;
    transform: translateX(-50%);
     margin-right: 5px; 
}
	
	
	#map-container {
    position: absolute;
    top: 350px;
    left: 50%;
    transform: translateX(-50%);
    width: 1400px; /* 원하는 지도의 가로 크기를 조절하세요. */
    height: 750px;
}

/* Style for the table container */
#table-container {
    position: absolute;
    top: 1050px; /* 원하는 테이블의 상단 위치를 조절하세요. */
    left: 50%;
    transform: translateX(-50%);
    width: 1400px; /* 원하는 테이블의 가로 크기를 조절하세요. */
    height: 550px;
    overflow: auto;
}
	
	.table {
    width: 100%; 
    border-collapse: collapse;
    margin-top: 20px;
}

/* Style for table header cells */
.table th {
    background-color: #f2f2f2;
    padding: 5px;
    text-align: center;
}

/* Style for table data cells */
.table td {
    padding: 5px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

/* Style for the table rows on hover */
.table tr:hover {
    background-color: #f5f5f5;
}
	
    .table td:nth-child(4) {
        width: 300px; /* Adjust the width as needed */
    }	
	
	</style> 
    <script>  

    var dataTableInitialized = false;
    var dataTable; 
    var map;
    var markers = []; 
    var infowindows = [];
    var initialTableHeight;
        // 카카오 지도 API 초기화
        $(document).ready(function() {
            // 카카오 지도 API 초기화
            kakao.maps.load(function() {
                // 지도 생성
                var container = document.getElementById('map');
                var options = {
                    center: new kakao.maps.LatLng(37.5665, 126.9780), // 초기 중심 좌표 (서울)
                    level: 6 // 초기 줌 레벨
                };
                map = new kakao.maps.Map(container, options);

                // 클리닉 데이터 가져오기
                $.ajax({
                    url: '/marketinfo/marketMarker', // 실제 클리닉 데이터를 제공하는 서버 API의 URL로 대체해야 합니다.
                    type: 'GET',
                    dataType: 'json',
                    success: function(marketData) {
                        for (var i = 0; i < marketData.length; i++) {
                            var lat = marketData[i].lat;
                            var lng = marketData[i].lng;

                            var latlng = new kakao.maps.LatLng(lat, lng);
                            var marker = new kakao.maps.Marker({
                                position: latlng
                            });
                            marker.setMap(map);
                            markers.push(marker);

                            var infowindow = new kakao.maps.InfoWindow({
                                content: '<div class="infowindow">' +
                                             '<h3 class = "font">' + marketData[i]['title'] + '</h3>' +
                                             '<p class = "font">주소: ' + marketData[i]['addr'] + '</p>' +
                                             '<p class = "font">전화번호: ' + marketData[i]['tel'] + '</p>' +
                                             '<p class = "font">영업시간: ' + marketData[i]['time'] + '</p>' +
                                         '</div>',
                                removable: true
                            });
                            infowindows.push(infowindow);

                            // 마커에 이벤트 리스너 등록
                            (function(marker, infowindow) {
                                kakao.maps.event.addListener(marker, 'mouseover', function() {
                                    infowindow.open(map, marker);
                                });
                                kakao.maps.event.addListener(marker, 'mouseout', function() {
                                    infowindow.close();
                                });
                            })(marker, infowindow);
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('Error:', error);
                    }
                });
            });
        });

        // showMarkets 함수 정의
        function showMarkets(location) {
            $.ajax({
                url: '/marketinfo/searchByLocation',
                method: 'GET',
                data: { location: location },
                success: function(response) {
                    // 테이블 초기화
                    var resultTable = $('#result');
                    resultTable.empty();

                    // 병원 데이터 출력
                    $.each(response, function(index, market) {
                        var row = $('<tr>');
                        var title = $('<td>').text(market.title);
                        var addr = $('<td>').text(market.addr);
                        var tel = $('<td>').text(market.tel);
                        var time = $('<td>').text(market.time);

                        row.append(title, addr, tel, time);
                        resultTable.append(row);

                        
                    });

                    setTableContainerHeight();
                    
                    if (dataTableInitialized) {
                        dataTable.clear().rows.add(resultTable.find('tr')).draw();
                    } else {
                        initializeDataTable();
                    }

                    if (location === '서울') {
                        map.setCenter(new kakao.maps.LatLng(37.5665, 126.9780));
                    } else if (location === '제주') {
                        map.setCenter(new kakao.maps.LatLng(33.4996, 126.5312));
                    } else if (location === '부산') {
                        map.setCenter(new kakao.maps.LatLng(35.1796, 129.0756));
                    } else if (location === '대구') {
                        map.setCenter(new kakao.maps.LatLng(35.8714, 128.6014));
                    } else if (location === '인천') {
                        map.setCenter(new kakao.maps.LatLng(37.4563, 126.7052));
                    } else if (location === '광주') {
                        map.setCenter(new kakao.maps.LatLng(35.1601, 126.8513));
                    } else if (location === '대전') {
                        map.setCenter(new kakao.maps.LatLng(36.3504, 127.3845));
                    } else if (location === '울산') {
                        map.setCenter(new kakao.maps.LatLng(35.5384, 129.3114));
                    } else if (location === '세종') {
                        map.setCenter(new kakao.maps.LatLng(36.4808, 127.2892));
                    } else if (location === '충북') {
                        map.setCenter(new kakao.maps.LatLng(36.635316, 127.491640));
                    } else if (location === '충남') {
                        map.setCenter(new kakao.maps.LatLng(36.814390, 127.114532));
                    } else if (location === '전북') {
                        map.setCenter(new kakao.maps.LatLng(35.820040, 127.108634));
                    } else if (location === '전남') {
                        map.setCenter(new kakao.maps.LatLng(34.817635, 126.463367));
                    } else if (location === '경북') {
                        map.setCenter(new kakao.maps.LatLng(36.578295, 128.504694));
                    } else if (location === '경남') {
                        map.setCenter(new kakao.maps.LatLng(35.237629, 128.692224));
                    } else if (location === '울릉') {
                        map.setCenter(new kakao.maps.LatLng(37.5040, 130.8923));
                    } else if (location === '강원') {
                        map.setCenter(new kakao.maps.LatLng(37.868202, 127.730236));
                    }

                    map.setLevel(6);
                },
                error: function(error) {
                    console.log(error);
                }
            }); 
        }

        // showAllMakkets 함수 정의
        function showAllMakkets(location) {
            if (location === '전체') {
                $.ajax({
                    url: "/marketinfo/searchAll",
                    method: 'GET',
                    dataType: 'json',
                    success: function(response) {
                        $("#result").empty();

                        $.each(response, function(index, market) {
                            var row = $('<tr>');
                            var title = $('<td>').text(market.title);
                            var addr = $('<td>').text(market.addr);
                            var tel = $('<td>').text(market.tel);
                            var time = $('<td>').text(market.time);

                            row.append(title, addr, tel, time);
                            $("#result").append(row);
                        });

                        if (dataTableInitialized) {
                            dataTable.clear().rows.add($("#result tr")).draw();
                        } else {
                            initializeDataTable();
                        }
                    },
                    error: function() {
                        console.log('오류 발생');
                    }
                });
            } 
        }

        // DataTable 초기화 함수
        function initializeDataTable() {
            dataTable = $("#paging").DataTable({
                "paging": true,
                "pageLength": 10, // 한 페이지에 보여줄 행의 개수
                "info": false, // 정보 숨기기
                "language": {
                    "lengthMenu": "SHOW _MENU_", // 페이지당 행 개수 옵션 텍스트 변경
                    "paginate": {
                        "previous": "이전", // 이전 페이지 버튼 텍스트 변경
                        "next": "다음" // 다음 페이지 버튼 텍스트 변경
                    }
                }
            });
            dataTableInitialized = true;
        }

        // 테이블 컨테이너 높이 설정 함수
        function setTableContainerHeight() {
            if (!initialTableHeight) {
                // 초기 테이블 높이 계산 (최초 한 번만 실행)
                initialTableHeight = $('#table-container').height();
            }

            // 초기 테이블 높이 값으로 테이블 컨테이너 높이 설정
            $('#table-container').height(initialTableHeight);
        }

        

        $('#btnAll').click(function() {
            var location = "전체";
            showAllHospitals(location);

            // DataTable 초기화
            initializeDataTable();
        });
 
        
        // 버튼 클릭 이벤트 핸들러 등록
        $('#btnSeoul').click(function() {
            var location = "서울";
            showHospitals(location);
        });

        $('#btnJeju').click(function() {
            var location = "제주";
            showHospitals(location);
        });

        $('#btnBusan').click(function() {
            var location = "부산";
            showHospitals(location);
        });

        $('#btnDaegu').click(function() {
            var location = "대구";
            showHospitals(location);
 		});

     

        $('#btnIncheon').click(function() {
            var location = "인천";
            showMarkets(location);
        });

        $('#btnGwangju').click(function() {
            var location = "광주";
            showMarkets(location);
        });

        $('#btnDaejeon').click(function() {
            var location = "대전";
            showMarkets(location);
        });

        $('#btnUlsan').click(function() {
            var location = "울산";
            showMarkets(location);
        });

        $('#btnSejong').click(function() {
            var location = "세종";
            showMarkets(location);
            
        });

        $('#btnChungbuk').click(function() {
            var location = "충북";
            showMarkets(location);
        });

        $('#btnChungnam').click(function() {
            var location = "충남";
            showMarkets(location);
        });

        $('#btnJeonbuk').click(function() {
            var location = "전북";
            showMarkets(location);
        });

        $('#btnJeonnam').click(function() {
            var location = "전남";
            showMarkets(location);
        });

        $('#btnGyeongbuk').click(function() {
            var location = "경북";
            showMarkets(location);
        });

        $('#btnGyeongnam').click(function() {
            var location = "경남";
            showMarkets(location);
        });

        $('#btnUlleung').click(function() {
            var location = "울릉";
            showMarkets(location);
        });

        $('#btnGangwon').click(function() {
            var location = "강원";
            showMarkets(location);
        });

       

</script> 
</head>
<body>
	<div style="position:relative;top:100px;margin-left:750px;">
        <h1 class='font' style='color:#fd2c58'>가까운 반려동물 용품 찾기</h1>
    </div>
    
    
    <div class="button-container">
     
  <a href="/clinic/clinicInfo"><button class="kboard-branch-button" style="position:relative;margin-left:400px;margin-top:150px;">병원정보 확인하기</a></button>
     
        <div class="first-row-buttons">
            <button onclick="showAllMakkets('전체')" id="btnAll" class="kboard-branch-button all">전체</button>
            <button onclick="showMarkets('서울')" id="btnSeoul" class="kboard-branch-button">서울</button>
            <button onclick="showMarkets('제주')" id="btnJeju" class="kboard-branch-button">제주</button>
            <button onclick="showMarkets('부산')" id="btnBusan" class="kboard-branch-button">부산</button>
            <button onclick="showMarkets('대구')" id="btnDaegu" class="kboard-branch-button">대구</button>
            <button onclick="showMarkets('인천')" id="btnIncheon" class="kboard-branch-button">인천</button>
            <button onclick="showMarkets('광주')" id="btnGwangju" class="kboard-branch-button">광주</button>
            <button onclick="showMarkets('대전')" id="btnDaejeon" class="kboard-branch-button">대전</button>
            <button onclick="showMarkets('울산')" id="btnUlsan" class="kboard-branch-button">울산</button>
        </div>
        <div class="second-row-buttons">
            <button onclick="showMarkets('세종')" id="btnSejong" class="kboard-branch-button">세종</button>
            <button onclick="showMarkets('충북')" id="btnChungbuk" class="kboard-branch-button">충북</button><br/>
		    <button onclick="showMarkets('충남')" id="btnChungnam" class="kboard-branch-button">충남</button>
		    <button onclick="showMarkets('전북')" id="btnJeonbuk" class="kboard-branch-button">전북</button>
		    <button onclick="showMarkets('전남')" id="btnJeonnam" class="kboard-branch-button">전남</button>
		    <button onclick="showMarkets('경북')" id="btnGyeongbuk" class="kboard-branch-button">경북</button><br/>
		    <button onclick="showMarkets('경남')" id="btnGyeongnam" class="kboard-branch-button">경남</button>
		    <button onclick="showMarkets('울릉')" id="btnUlleung" class="kboard-branch-button">울릉</button>
		    <button onclick="showMarkets('강원')" id="btnGangwon" class="kboard-branch-button">강원</button>
            <!-- Add more buttons here if needed -->
        </div>
    </div>
    
    <div id="map-container">
        <div id="map" style="width: 100%; height: 90%;"></div>
    </div>
    <div id="table-container">
        <table id="paging" class="table"> 
            <thead>
                <tr>
                    <th>병원명</th>
                    <th>주 소</th>
                    <th>전화번호</th> 
                    <th>병원시간</th>
                </tr>
            </thead>
            <tbody id="result">
            </tbody>
        </table>
    </div> 
</body> 
</html>