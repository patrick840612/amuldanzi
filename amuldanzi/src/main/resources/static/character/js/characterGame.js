$(document).ready(function(){
	


	// 캔버스 세팅
	let canvas;
	let ctx;
	canvas = document.createElement("canvas")
	ctx = canvas.getContext("2d")
	canvas.width=400;
	canvas.height=700;
  let GameZone = document.getElementById('GameZone');
  GameZone.appendChild(canvas);
	//document.body.appendChild(canvas);
	
	let catImage, backgroundImage, bulletImage, enemyImage, gameOverImage, collisionImage;
	let gameOver=false; // true이면 게임이 끝남, false이면 게임이 안끝남
	let score=0;
	
	// 고양이 이미지 좌표
	let catX = canvas.width/2-13;
	let catY = canvas.height-26;
	
	let bulletList = [] // 총알들을 저장하는 리스트
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
	
	let enemyList=[];
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
	function setupKeyboardListener(){
		document.addEventListener("keydown",function(event){
			keysDown[event.keyCode] = true;
			console.log("키다운객체에 들어간 값은?",keysDown);
		});
		document.addEventListener("keyup",function(event){
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
		},1000)
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
			}
		}
		
		for(let i=0; i<enemyList.length; i++){
			enemyList[i].update();
		}
	}
	
	function render(){
		ctx.drawImage(backgroundImage, 0, 0, canvas.width, canvas.height);
		ctx.drawImage(catImage, catX, catY);
		ctx.fillText(`Score:${score}`, 20, 20);
		ctx.fillStyle="white";
		ctx.font="20px Arial";
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
		}
	}
	
	loadImage();
	setupKeyboardListener();
	createEnemy();
	main();
	
});