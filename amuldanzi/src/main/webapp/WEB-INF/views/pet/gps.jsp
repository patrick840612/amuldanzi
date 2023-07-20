<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
  <head>
    <title>애물단지</title>
    <script src="https://cdn.pubnub.com/sdk/javascript/pubnub.4.19.0.min.js"></script>
    <!-- css 및 이미지 경로 설정시 기본으로 resources 까지 잡혀 있기 때문에 /css 부터 시작 하는 경로로 잡아줘야함  -->
    <link rel="stylesheet" type="text/css" href="/css/pet/map.css">
    <link rel="stylesheet" type="text/css" href="/css/pet/pet.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&display=swap" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </head>
  

  <body>

      <div class="bg"></div>
        <jsp:include page="../main/header.jsp"></jsp:include>
     <div class="bg-others"> 
    <div class="container">
      <h1 class="font">★나의 소중한 반려동물을 찾기★</h1>
        <center><hr style="height:2px; border:none; color:#ffffff; background-color:#ffffff;  width:35%; margin: 0 auto 0 auto;"></center>
        <p class="font">아래 버튼을 클릭하면 추적이 시작됩니다!</p>  
        <!-- js 에서 아이디 사용하기 위해 아이디 생성  -->
        <center><button class="btn btn-success col-sm-3" id="action" >!!Start!!</button></center><br>
        <center><div id="map-canvas" style="position: relative; overflow: hidden; top:60px" ></div></center>
    </div>
          </div>

    <script>
    // 초기 위치 설정 (가산 한라원앤원타워)
    window.lat = 37.477097;
    window.lng = 126.879678;

    var map;
    var mark;
    var lineCoords = [];

    // 구글 지도 api 를 사용하는 코드 
    var initialize = function() {
      map  = new google.maps.Map(document.getElementById('map-canvas'), {center:{lat:lat,lng:lng},zoom:12});
      mark = new google.maps.Marker({position:{lat:lat, lng:lng}, map:map});
    };

    window.initialize = initialize;

    // 초기화 함수 사이트를 새로고침 하면 처음에 저장한 초기 위도, 경도로 돌아오도록
    var redraw = function(payload) {
      if(payload.message.lat){
      lat = payload.message.lat;
      lng = payload.message.lng;

      map.setCenter({lat:lat, lng:lng, alt:0});
      mark.setPosition({lat:lat, lng:lng, alt:0});
      // 사물이 움직일때 선을 긋는 코드
      lineCoords.push(new google.maps.LatLng(lat, lng));

      var lineCoordinatesPath = new google.maps.Polyline({
        path: lineCoords,
        geodesic: true,
        strokeColor: '#2E10FF'
      });
      
      lineCoordinatesPath.setMap(map);}
    };

    // 채널에 데이터를 보낼 것 파이썬과 연결, 이름이 동일해야함
    var pnChannel = "raspi-tracker";

    // 공개키와 ,구독키 http://admin.pubnub.com/#register 가입하여 키 얻기
    var pubnub = new PubNub({
      publishKey:   'pub-c-7843891f-9ad9-4ae3-80ac-59da8898ac27',
      subscribeKey: 'sub-c-e035ec81-95dc-4a50-9e8c-2118d85c8b3b'
    });
        
    document.querySelector('#action').addEventListener('click', function(){
        var text = document.getElementById("action").textContent;
        if(text == "Start Tracking"){
            // 해당 채널에 게시된 메세지 수신
            pubnub.subscribe({channels: [pnChannel]});
            pubnub.addListener({message:redraw});
            // 애니매이션 적용
            document.getElementById("action").classList.add('btn-danger');
            document.getElementById("action").classList.remove('btn-success');
            document.getElementById("action").textContent = 'Stop Tracking';
        }
        else{
            pubnub.unsubscribe( {channels: [pnChannel] });
            document.getElementById("action").classList.remove('btn-danger');
            document.getElementById("action").classList.add('btn-success');
            document.getElementById("action").textContent = 'Start Tracking';
        }
        });
    	//500밀리초마다 임의의 좌표(위도 및 경도)를 생성하고 동일한 채널에 게시하여 마커가 지도의 일부 임의 지점을 자동으로 표시하고 해당 지점을 통과하는 경로를 생성합니다.
    	//테스트용 코딩 
    	
	    function newPoint(time) {
		      var radius = 0.01;
		      var x = Math.random() * radius;
		      var y = Math.random() * radius;
		      return {lat:window.lat + y, lng:window.lng + x};
		        }
		      setInterval(function() {
		      pubnub.publish({channel:pnChannel, message:newPoint()});
		      }, 4000);
		      
    </script> 
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyBOVnOwiiflRUtvahCdSBef0vpW4yskfrk&callback=initialize"></script>
  </body>
</html>