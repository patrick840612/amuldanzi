$(document).ready(function(){
	
})

	// 캔버스 세팅
	let canvas;
	let ctx;
	canvas = document.createElement("canvas")
	ctx = canvas.getContext("2d")
	canvas.width=400;
	canvas.height=700;
	document.body.appendChild(canvas);
	
	let catImage, backgroundImage;
	
	// 고양이 이미지 좌표
	let catX = canvas.width/2-13;
	let catY = canvas.height-26;
	
	function loadImage(){
		
		backgroundImage = new Image();
		backgroundImage.src = "/images.jpg";
		
		catImage = new Image();
		catImage.src="/icons8-cat-26.png";
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
			console.log("버튼 클릭후",keysDown);
		});
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
	}
	
	function render(){
		ctx.drawImage(backgroundImage, 0, 0, canvas.width, canvas.height);
		ctx.drawImage(catImage, catX, catY);
	}
	
	function main(){
		update(); // 좌표값을 업데이트하고
		render(); // 그려주고
		console.log("animation calls main function")
		requestAnimationFrame(main);
	}
	
	loadImage();
	setupKeyboardListener();
	main();