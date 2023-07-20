<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
  <head>
    <title>�ֹ�����</title>
    <script src="https://cdn.pubnub.com/sdk/javascript/pubnub.4.19.0.min.js"></script>
    <!-- css �� �̹��� ��� ������ �⺻���� resources ���� ���� �ֱ� ������ /css ���� ���� �ϴ� ��η� ��������  -->
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
      <h1 class="font">�ڳ��� ������ �ݷ������� ã���</h1>
        <center><hr style="height:2px; border:none; color:#ffffff; background-color:#ffffff;  width:35%; margin: 0 auto 0 auto;"></center>
        <p class="font">�Ʒ� ��ư�� Ŭ���ϸ� ������ ���۵˴ϴ�!</p>  
        <!-- js ���� ���̵� ����ϱ� ���� ���̵� ����  -->
        <center><button class="btn btn-success col-sm-3" id="action" >!!Start!!</button></center><br>
        <center><div id="map-canvas" style="position: relative; overflow: hidden; top:60px" ></div></center>
    </div>
          </div>

    <script>
    // �ʱ� ��ġ ���� (���� �Ѷ���ؿ�Ÿ��)
    window.lat = 37.477097;
    window.lng = 126.879678;

    var map;
    var mark;
    var lineCoords = [];

    // ���� ���� api �� ����ϴ� �ڵ� 
    var initialize = function() {
      map  = new google.maps.Map(document.getElementById('map-canvas'), {center:{lat:lat,lng:lng},zoom:12});
      mark = new google.maps.Marker({position:{lat:lat, lng:lng}, map:map});
    };

    window.initialize = initialize;

    // �ʱ�ȭ �Լ� ����Ʈ�� ���ΰ�ħ �ϸ� ó���� ������ �ʱ� ����, �浵�� ���ƿ�����
    var redraw = function(payload) {
      if(payload.message.lat){
      lat = payload.message.lat;
      lng = payload.message.lng;

      map.setCenter({lat:lat, lng:lng, alt:0});
      mark.setPosition({lat:lat, lng:lng, alt:0});
      // �繰�� �����϶� ���� �ߴ� �ڵ�
      lineCoords.push(new google.maps.LatLng(lat, lng));

      var lineCoordinatesPath = new google.maps.Polyline({
        path: lineCoords,
        geodesic: true,
        strokeColor: '#2E10FF'
      });
      
      lineCoordinatesPath.setMap(map);}
    };

    // ä�ο� �����͸� ���� �� ���̽�� ����, �̸��� �����ؾ���
    var pnChannel = "raspi-tracker";

    // ����Ű�� ,����Ű http://admin.pubnub.com/#register �����Ͽ� Ű ���
    var pubnub = new PubNub({
      publishKey:   'pub-c-7843891f-9ad9-4ae3-80ac-59da8898ac27',
      subscribeKey: 'sub-c-e035ec81-95dc-4a50-9e8c-2118d85c8b3b'
    });
        
    document.querySelector('#action').addEventListener('click', function(){
        var text = document.getElementById("action").textContent;
        if(text == "Start Tracking"){
            // �ش� ä�ο� �Խõ� �޼��� ����
            pubnub.subscribe({channels: [pnChannel]});
            pubnub.addListener({message:redraw});
            // �ִϸ��̼� ����
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
    	//500�и��ʸ��� ������ ��ǥ(���� �� �浵)�� �����ϰ� ������ ä�ο� �Խ��Ͽ� ��Ŀ�� ������ �Ϻ� ���� ������ �ڵ����� ǥ���ϰ� �ش� ������ ����ϴ� ��θ� �����մϴ�.
    	//�׽�Ʈ�� �ڵ� 
    	
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