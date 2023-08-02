<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="light-theme">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<link rel="icon" href="/admin/production/images/favicon.ico" type="image/ico" />
<title>나의 캐릭터</title>

<link rel="stylesheet" href="/chunks/css/market/marketOld.css" media="all" />
<link rel="preload" href="/chunks/css/market/marketShop.css" as="style" />
<link rel="stylesheet" href="/chunks/css/market/marketShop.css" />
<link rel="preload" href="/chunks/css/market/marketShop2.css" as="style" />
<link rel="stylesheet" href="/chunks/css/market/marketShop2.css" />

<style type="text/css">
._3nqg3y0 {
    height: 52rem;
}

._1ff3f302{
	max-width: 80rem;
}

.cat {
  position: absolute;
  left: 500px;
  top: 700px;
  z-index: 999;
}


/* 버튼 스타일 */
.game-button {
    width: 200px;
    height: 200px;
    margin: 5px;
    padding: 10px 15px;
    /* background-color: #3498db; */
    background-color: white;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 18px;
}


/* 4행 3열로 버튼 배치하기 */
#GameZone {
    display: grid;
    grid-template-columns: repeat(6, 200px);
    grid-template-rows: repeat(3, 200px);
    grid-gap: 10px;
}

/* 캔버스 스타일 */
canvas {
    grid-column: 1 / span 2; /* 캔버스는 1열부터 2열까지 차지 */
    grid-row: 1 / span 3;    /* 캔버스는 1행부터 3행까지 차지 */
}

/* 스크롤바 숨기기 */
body {
    overflow: hidden;
}
    
#selectImg {
    position: absolute;
    bottom: 10px;
    right: 25px;
    margin-bottom: 30px;
    margin-right: 0px;
    width: 150px;
    padding: 10px 15px;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    color: #fff;
    background-color: pink;
    cursor: pointer;    
}


#playGame{
    position: absolute;
    top: 760px;
    right: 980px;
    margin-bottom: 0px;
    margin-right: 0px;
	width: 200px;
	padding: 10px 15px;
	font-size: 16px;
	border: none;
	border-radius: 5px;
	color: #fff;
	background-color: pink;
	cursor: pointer;
}

#selectImg:hover, #playGame:hover {
  background-color: #2980b9;
}

/* 텍스트 입력 스타일 */
#point {
  padding: 10px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 5px;
  border: none;
  background-color: transparent; 
  position: absolute;
  bottom: 10px;
  right: 50px;
  margin-bottom: 30px;
  margin-right: 140px;
  text-align: right;
  width: 140px;
}

/* 선택된 텍스트 입력 스타일 */
#point:focus {
  border-color: #3498db;
  outline: none;
  box-shadow: 0 0 5px #3498db;
}
    
#cpoint{
  padding: 10px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 5px;
  border: none;
  background-color: transparent; 
  position: absolute;
  bottom: 10px;
  right: 50px;
  margin-bottom: 30px;
  margin-right: 200px;
  text-align: right;
}

#cpointx{
  padding: 10px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 5px;
  border: none;
  background-color: transparent; 
  position: absolute;
  bottom: 10px;
  right: 50px;
  margin-bottom: 30px;
  margin-right: 250px;
  text-align: center;
  color: red;
  font-weight: bold;
}

#noMore{
  padding: 10px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 5px;
  border: none;
  background-color: transparent; 
  position: absolute;
  bottom: 10px;
  right: 50px;
  margin-bottom: 30px;
  margin-right: 500px;
  text-align: center;
  color: red;
  font-weight: bold; 
  width: 300px;
}

.button-container {
  position: relative;
  display: inline-block;
}

.select-button {
  position: absolute;
  bottom: 5px;
  left: 15px;
  width: 80px;
  height: 30px;
  font-size: 14px;
  border: none;
  border-radius: 5px;
  color: #fff;
  background-color: #dfa8df; /* 예시로 purple로 설정 */
  cursor: pointer;
}

.evolve-button {
  position: absolute;
  bottom: 5px;
  right: 5px;
  width: 80px;
  height: 30px;
  font-size: 14px;
  border: none;
  border-radius: 5px;
  color: #fff;
  background-color: pink;
  cursor: pointer;
}

.evolve-button:hover {
  background-color: #2980b9;
}

.select-button:hover {
  background-color: purple;
}
</style>

<script src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base-4b55f04bb2798d1f6aa4e078c0ad3504ef4993ad4123005ec35dde545e5788bd.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->

</head>
<jsp:include page="../main/header.jsp"></jsp:include>
<body class="hoian-kr">
<script type="text/javascript" src='/character/js/characterRandom.js'></script>
<!-- <script type="text/javascript" src='/character/js/characterGame.js'></script> -->
	<div class="__margin-top120px" >
		<form action="/character/random" name="characterFrm" id="characterFrm" method="post">
			<section class="_3nqg3y0" >
				<div class="_3nqg3y1 _1ff3f302"><img class='cat' src='/character/images/${member.selectCharacter}' id="cat"/><!-- 선택 캐릭터 움직이기 -->
					<div id="GameZone">
		                <!-- JSTL을 사용하여 4행 3열로 12개의 버튼을 생성 -->
		                <c:forEach var="characterDTO" items="${character}">
				            <div class="button-container">
				              <button type="button" class="game-button">
				                <input type="hidden" name="characterNo" value="${characterDTO.characterNo}" />
				                <img name="characterImg" src="/character/images/${characterDTO.characterImg}" alt="Character Image" class="isCharacter" />
				              </button>
				              <button type="button" class="select-button">
				                장 착
				              </button>
				              <button type="button" class="evolve-button">
				                진 화
				              </button>
				            </div>            
		                </c:forEach>
		                <input type="button" value="게임 시작" id="playGame"/>
		                <input type="hidden" readonly="readonly" id="noMore" value="캐릭터 수집 완료(진화시켜 주세요)" disabled="disabled"/>
		                <input type="hidden" readonly="readonly" id="cpointx" value="뽑기/진화 비용 10,000P" disabled="disabled"/>
		                <input type="text" readonly="readonly" id="cpoint" value="cpoint : " disabled="disabled"/>
		                <input type="text" readonly="readonly" name="cpoint" id="point" value="${cpoint}"/>
		                <input type="button" value="캐릭터 뽑기" id="selectImg"/>
		                <input type="hidden" name="id" value="${id}" id="id"/>
		                <input type="hidden" name="randomAnimal" id="randomAnimal" value="" />
		                <canvas width="400" height="700">	
					</div>
				</div>

			</section>
		</form>

	</div>
<script type="text/javascript">

$(function(){
	

	let canvasZone = document.getElementsByTagName('canvas')[0];
	let ctxBasic = canvasZone.getContext('2d');
	let backImg = new Image();
	backImg.src = "/character/images/pexels-mudassir-ali-2680270.jpg";
	backImg.onload = function () {
    	ctxBasic.drawImage(backImg, 0, 0, canvasZone.width, canvasZone.height);
    };	
    
    const selectedCharacterImg = '/character/images/${member.selectCharacter}';
    $('.button-container').each(function () {
        const buttonImgSrc = $(this).find('img[name="characterImg"]').attr('src');
        if (buttonImgSrc === selectedCharacterImg) {
          $(this).find('.game-button').css('background-color', '#3498db'); // 배경색을 변경하거나 원하는 스타일을 적용합니다.
        }
    });
});

//캐릭터 진화
$('.evolve-button').click(function () {
	if(parseInt($('#point').val(), 10) < 10000){
		$('#cpointx').attr('type', 'text');
	}else{
		$('#cpointx').attr('type', 'hidden');
		  // 진 화 버튼을 클릭한 버튼의 data-characterNo 속성 값을 가져옴
		  let characterNo = $(this).closest('.button-container').find('input[name="characterNo"]').val();
		  let imgSrcEvolve = $(this).closest('.button-container').find('img[name="characterImg"]').attr('src');
		  let filename = imgSrcEvolve.split('/').pop();
		  const lastIndexDot = filename.lastIndexOf('.');
		  imgSrcEvolve = filename.slice(0, lastIndexDot) + "2" + filename.slice(lastIndexDot);
		
		  $('.button-container').each(function () {
		        $(this).find('.game-button').css('background-color', 'white'); // 배경색을 변경하거나 원하는 스타일을 적용합니다.
		  });
		  const newSrc = '/character/images/'+imgSrcEvolve;
		  $(this).closest('.button-container').find('img[name="characterImg"]').attr('src', newSrc);
		  $(this).closest('.button-container').find('.game-button').css('background-color', '#3498db');  
		
		  let paramS = { id : $('#id').val(), selectCharacter : imgSrcEvolve, characterNo : characterNo, characterImg : imgSrcEvolve, cpoint : $('#point').val() }
		  $.ajax({
				type : 'post',
				data : paramS,
				url : '/character/evolveCharacter',
				dataType : 'text',
				success : function(result){
					$('#cat').attr('src', newSrc);
					$('#point').val(result);
				},
				error : function(err){
					console.log(err);
					alert('Error');
				}
			}); // ajax end      
	}
});




// 캐릭터 장착
$('.select-button').click(function(){
    let imgSrcSelect = $(this).closest('.button-container').find('img[name="characterImg"]').attr('src');
    imgSrcSelect = imgSrcSelect.split('/').pop();
    
	let paramS = { id : $('#id').val(), selectCharacter : imgSrcSelect }
	$.ajax({
		type : 'post',
		data : paramS,
		url : '/character/selectCharacter',
		dataType : 'text',
		success : function(result){
			const newSrc = '/character/images/'+result;
			$('#cat').attr('src', newSrc);
			
		    const selectedCharacterImg = newSrc;
		    $('.button-container').each(function () {
		        const buttonImgSrc = $(this).find('img[name="characterImg"]').attr('src');
		        if (buttonImgSrc === selectedCharacterImg) {
		          $(this).find('.game-button').css('background-color', '#3498db'); // 배경색을 변경하거나 원하는 스타일을 적용합니다.
		        }else{
		          $(this).find('.game-button').css('background-color', 'white'); // 배경색을 변경하거나 원하는 스타일을 적용합니다.		        	
		        }
		    });
			
		},
		error : function(err){
			console.log(err);
			alert('Error');
		}
	}); // ajax end
});

// 캐릭터 뽑기
$('#selectImg').click(function(event){
	event.preventDefault();
	let animalList = [ 'bear.png', 'calamari.png', 'cat.png', 'dog.png', 'dragon.png', 'koala.png', 'lobster.png', 'octopus.png', 'penguin.png', 'snake.png', 'turtle.png', 'whale.png'];
	let foundRandomAnimal = false;
	let imgSrcList = []; // 이미지 파일 이름들을 저장할 배열
	
	  $('.game-button').each(function () {
		    let imgSrc = $(this).find('img[name="characterImg"]').attr('src').split('/').pop();
		    imgSrcList.push(imgSrc);		    
	  });
	
	  if(parseInt($('#point').val(), 10) < 10000){
		  $('#cpointx').attr('type', 'text');
	  }else{ // 가챠 성공
		  $('#cpointx').attr('type', 'hidden');

		  animalList = animalList.filter(item => !imgSrcList.includes(item));

		    if (animalList.length > 0) {
		    	foundRandomAnimal = true;
		    	$('#noMore').attr('type', 'hidden');
			    let randomIndex = Math.floor(Math.random() * animalList.length);
			    let randomAnimal = animalList[randomIndex];
			    $('#randomAnimal').val(randomAnimal);
		    }else{
		    	$('#noMore').attr('type', 'text');
		    }
	  }

      if (foundRandomAnimal) {
        $('#characterFrm').submit();
      }
});


//게임 시작
$('#playGame').click(function(){
	
	$('canvas').remove();
	
	// 캔버스 세팅
	let canvas;
	let ctx;
	canvas = document.createElement("canvas")
	ctx = canvas.getContext("2d")
	canvas.width=400;
	canvas.height=700;
	let GameZone = document.getElementById('GameZone');
	GameZone.appendChild(canvas);

	let catImage, backgroundImage, bulletImage, enemyImage, gameOverImage, collisionImage;
	let gameOver=false; // true이면 게임이 끝남, false이면 게임이 안끝남
	let score=0;

	// 고양이 이미지 좌표
	let catX = canvas.width/2-13;
	let catY = canvas.height-26;

	//총알
	let bulletList = [] // 총알들을 저장하는 리스트
	// 총알
	function Bullet(){
		this.x=0;
		this.y=0;
		this.init=function(){
			this.x = catX+6;
			this.y = catY;
			this.alive=true; // true면 살아있는 총알 false면 죽은 총알			
			bulletList.push(this);
		}
		this.update = function(){
			this.y-=7; 
		}
		
		this.checkHit=function(){
			// 총알.y <= 쥐.y And
			// 총알.x >= 쥐.x and 총알.x <= 쥐.y + 쥐 가로사이즈
			for(let i=0; i<enemyList.length; i++){
				if(this.y <= enemyList[i].y && this.x >= enemyList[i].x && this.x <= enemyList[i].x+40){
					// 총알이 죽게됨, 적군의 쥐가 없어짐, 점수획득
					score++;
					this.alive=false; // 죽은 총알
					enemyList.splice(i, 1);
				}
			}
				
		}
	}

	function generateRandomValue(min,max){
		let randomNum = Math.floor(Math.random()*(max-min+1))+min;
		return randomNum;  
	}	

	// 적
	let enemyList=[];
	// 적
	function Enemy(){
		this.x=0;
		this.y=0;
		this.init=function(){
			this.y=0;
			this.x= generateRandomValue(0,canvas.width-48);
			enemyList.push(this);
		}
		this.update=function(){
			this.y += 2; // 적군의 속도 조절
			
			if(this.y >= canvas.height-48){
				gameOver = true;
				console.log("gameover");
			}
		}
	}

	function loadImage(){
		
		backgroundImage = new Image();
		backgroundImage.src = "/character/images/pexels-mudassir-ali-2680270.jpg";
		
		catImage = new Image();
		catImage.src="/character/images/icons8-cat-26.png";
		
		bulletImage = new Image();
		bulletImage.src="/character/images/icons8-bullet-16.png";
		
		enemyImage = new Image();
		enemyImage.src="/character/images/icons8-cute-mouse-48.png";
		
		gameOverImage = new Image();
		gameOverImage.src="/character/images/gameoverimages.jpg";
		
		collisionImage = new Image();
		collisionImage.src="/character/images/icons8-collision-48.png";
	}


	// 방향키를 누르면
	let keysDown={}
	//방향키를 누르면
	function setupKeyboardListener(){
		document.addEventListener("keydown",function(event){
			keysDown[event.keyCode] = true;
			console.log("키다운객체에 들어간 값은?",keysDown);
		});
		document.addEventListener("keyup",function(event){
			event.preventDefault();
			delete keysDown[event.keyCode];
			
			if(event.keyCode == 32){
				createBullet(); // 총알 생성
			}
			console.log("버튼 클릭후",keysDown);
		});
	}

	function createBullet(){
		console.log('총알 생성');
		let b = new Bullet(); // 총알 하나 생성
		b.init();
		console.log("새로운 총알 리스트", bulletList);
	}

	function createEnemy(){
		const interval = setInterval(function(){
			let e = new Enemy();
			e.init();
		},2000)
	}

	// 고양이 움직이기(xy좌표 변경)
	function update(){
		if( 39 in keysDown){
			catX += 5; // 고양이 속도
		} // right
		if( 37 in keysDown){
			catX -= 5; // 고양이 속도
		} // left
		
		// 고양이 좌표값을 캔버스 안에만 있게 하려면
		if(catX <=0){
			catX=0;
		}
		if(catX >= canvas.width-26){
			catX=canvas.width-26;
		}
		
		//총알의 y좌표 업데이트한 함수 호출
		for(let i=0; i<bulletList.length; i++){
			if(bulletList[i].alive){
				bulletList[i].update();
				bulletList[i].checkHit();
			}else{
	            // 총알이 화면을 벗어난 경우, 총알을 리스트에서 제거
	            bulletList.splice(i, 1);
	            i--; // splice로 인해 배열이 한 칸씩 앞으로 당겨지므로, 인덱스를 감소시켜 중복 확인을 피함
			}
		}
		
		for(let i=0; i<enemyList.length; i++){
			enemyList[i].update();
		}
	}

	function render(){
		ctx.drawImage(backgroundImage, 0, 0, canvas.width, canvas.height);
		ctx.drawImage(catImage, catX, catY);
		ctx.fillStyle="white";
		ctx.font="20px Arial";
		ctx.fillText(`Score:`+ score, 20, 20); //////////////////////////// 내부 스크립트와 외부 스크립트 변수값 가져오기 다름

		for(let i=0; i<bulletList.length; i++){
			if(bulletList[i].alive){
				ctx.drawImage(bulletImage, bulletList[i].x, bulletList[i].y);				
			}
		}
		for(let i=0; i<enemyList.length; i++){
			ctx.drawImage(enemyImage, enemyList[i].x, enemyList[i].y);
		}
	}

	function main(){
		if(!gameOver){
			update(); // 좌표값을 업데이트하고
			render(); // 그려주고
			console.log("animation calls main function")
			
			requestAnimationFrame(main);
		}else{
			ctx.drawImage(gameOverImage, 0, 100, 400, 400);
			// 게임오버시 포인트 변경
			let paramP = { id : $('#id').val(), cpoint : parseInt($('#point').val(), 10)+score }
			$.ajax({
				type : 'post',
				data : paramP,
				url : '/character/cpointupdate',
				dataType : 'text',
				success : function(result){
					$('#point').val(result);
					$('#point').focus();
				},
				error : function(err){
					console.log(err);
					alert('Error');
				}
			}); // ajax end
		}
	}

	
    loadImage();
    setupKeyboardListener();
    createEnemy();
    main();
});








</script>
</body>
</html>