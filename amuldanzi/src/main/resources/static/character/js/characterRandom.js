$(document).ready(function(){

		let moveStop = true;
	    const cat = document.querySelector('.cat');
	    let yPos = 0;
	    let xPos = 0;
	    let rafId;
		  let randomX = 2; 
		  let randomY = 2;	
	
	setInterval(() => {
  		  randomX = Math.random() * 14 - 7;
		  randomY = Math.random() * 14 - 7;	
	}, 1000);	
	
	    function moveCat() {

	      yPos += randomX;
	      xPos += randomY;
	     
          // 브라우저 창의 크기 안에서 움직이도록 제한
          const maxX = window.innerWidth - cat.clientWidth;
          const maxY = window.innerHeight - cat.clientHeight;	     
          xPos = Math.min(Math.max(xPos, 0), maxX);
          yPos = Math.min(Math.max(yPos, 0), maxY);        
        
	      cat.style.transform = `translate(${xPos}px, ${-yPos}px)`;
		 
          rafId = requestAnimationFrame(moveCat);

	    }
	
	    moveCat();
	
		$('#cat').click(function(){
			if(moveStop){
				cancelAnimationFrame(rafId);
				moveStop = false;	
				
			}else{
				moveCat();
				moveStop = true;
			}

		});
});
