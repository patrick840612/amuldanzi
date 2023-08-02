$(document).ready(function(){

	const cat = document.querySelector('.cat');
	const value = document.querySelector('.value');
	let yPos = 0;
	let rafId;
	
	function render(){
		//value.innerHTML = yPos;
		cat.style.transform = `translateY(${-yPos}px)`;
		yPos += 5;
		
		rafId = requestAnimationFrame(render);
			
		if(yPos > 500){
			cancelAnimationFrame(rafId);
		}
	}
	
	render();
	
	//window.addEventListener('click', () => {
	//	cancelAnimationFrame(rafId);
	//});
	
})


