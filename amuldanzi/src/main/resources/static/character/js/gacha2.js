

		  
function startGacha() {
	  const characterImages = document.querySelectorAll('.isCharacter');
	  const randomIndex = Math.floor(Math.random() * characterImages.length);
	  const selectedCharacter = characterImages[randomIndex]; // 랜덤 선택 이미지 넣기

	  // 반복 횟수 설정 (10번 반복하려면 10으로 설정)
	  const repeatCount = 10;
	  // pang 애니메이션 10번 반복하는 함수 호출
	  repeatPangAnimation(selectedCharacter, repeatCount);

	  setTimeout(() => {
		
		  // 팝업 영역 가져오기
		  const selectedCharacterImage = document.getElementById('selectedCharacterImage');
		  const popupOverlay = document.getElementById('popupOverlay');

	
		  // 선택된 캐릭터 이미지 설정
		  selectedCharacterImage.src = selectedCharacter.src;
	
		  // 팝업 표시
		  popupOverlay.style.display = 'block';
	
		  // 캐릭터 이미지 팝업 후, 2초 후에 팝업을 닫습니다.
		  setTimeout(() => {
		    popupOverlay.style.display = 'none';
		  }, 1500);
		  
		}, 3000);		 
}

const positions = [
  { x: 50, y: 50 },  
  { x: 150, y: 50 },   
  { x: 50, y: 150 },
  { x: 250, y: 50 },
  { x: 50, y: 250 },
  { x: 350, y: 50 },
  { x: 50, y: 350 },
  { x: 100, y: 100 },
  { x: 200, y: 200 },
  { x: 300, y: 300 },      
];
function shufflePositions(array) {
  for (let i = array.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [array[i], array[j]] = [array[j], array[i]];
  }
}
shufflePositions(positions);
let currentPositionIndex = 0;

function repeatPangAnimation(selectedCharacter, count) {
	  if (count <= 0) {
	        setTimeout(() => {
		      selectedCharacter.classList.add('revealCharacter');
		    }, 500);
			return;		  
	  }
	  
  	  const pangEffect = document.createElement('div');
	  pangEffect.classList.add('pang');
	  document.body.appendChild(pangEffect);
	  

	  const rect = selectedCharacter.getBoundingClientRect();
	  const currentPosition = positions[currentPositionIndex];

	  pangEffect.style.left = `${currentPosition.x + rect.width / 2}px`;
	  pangEffect.style.top = `${currentPosition.y + rect.height / 2}px`;
	  
	  currentPositionIndex = (currentPositionIndex + 1) % positions.length;

	  pangEffect.addEventListener('animationend', () => {
	    document.body.removeChild(pangEffect);
    	// 반복 횟수 감소 및 다음 애니메이션 실행
	    repeatPangAnimation(selectedCharacter,count - 1);
	  });
	  
}