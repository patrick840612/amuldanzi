$(document).ready(function(){
   document.addEventListener('DOMContentLoaded', function () {
	    const cat = document.querySelector('.cat');
	    let rafId;
	
	    function moveCat() {
	      const randomX = Math.random() * (window.innerWidth - 100); 
	      const randomY = Math.random() * (window.innerHeight - 100); 
	
	      cat.style.transform = `translate(${randomX}px, ${randomY}px)`;
	
	      rafId = requestAnimationFrame(moveCat);
	    }
	
	    moveCat();
	
	    window.addEventListener('click', () => {
	      cancelAnimationFrame(rafId);
	    });
	});
});