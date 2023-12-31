$(function(){
    const animalList = [ 'bear.png', 'calamari.png', 'cat.png', 'dog.png', 'dragon.png', 'koala.png', 'lobster.png', 'octopus.png', 'penguin.png', 'snake.png', 'turtle.png', 'whale.png'];

    // 이미지 태그를 동적으로 생성하여 반환하는 함수
    function createImageTag(imageName) {
        const img = document.createElement('img');
        img.src = `/character/images/${imageName}`;
        img.alt = imageName;
        img.classList.add('atCharacter'); // 이미지 태그에 class="atCharacter" 속성 추가
        // 이미지 태그의 추가적인 속성 및 스타일 설정 가능
        return img;
    }

    // 이미지를 출력할 영역의 ID를 지정
    const imageContainer = document.getElementById('imageContainer');

    // animalList 배열에 있는 각 이미지 파일 이름에 대해 이미지 태그 생성 및 출력
    animalList.forEach((imageName) => {
        const imgTag = createImageTag(imageName);
        imageContainer.appendChild(imgTag);
    });
    
    $('#imageContainer').hide();
});		  
function startGacha() {
	
	  const characterImages = document.querySelectorAll('.atCharacter');
	  const randomIndex = Math.floor(Math.random() * characterImages.length);
	  const selectedCharacter = characterImages[randomIndex]; // 랜덤 선택 이미지 넣기

	  // 반복 횟수 설정 (10번 반복하려면 10으로 설정)
	  const repeatCount = 7;
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

		  // 캐릭터 이미지 팝업 후, 1초 후에 팝업을 닫습니다.
		  setTimeout(() => {
			    popupOverlay.style.display = 'none';
		  }, 1000);
			  
	  }, 3000);	
	  return selectedCharacter;	 
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