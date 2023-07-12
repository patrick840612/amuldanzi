import socket
import numpy as np
from PIL import Image
import tensorflow as tf
from tensorflow import keras
import io
from PIL import ImageFile
# 서버 설정
host = '192.168.0.55'
port = 5000

# 학습시킨 keras 모델 불러오기
model = keras.models.load_model('emotion.h5')

# 소켓 객체를 생성 IPv4 주소체계, TCP 프로토콜 사용
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
# 서버의 IP 주소, 포트번호
server_socket.bind((host, port))
# 클라이언트 연결요청 수신대기 최대 1개의 연결 요청을 대기하도록 설정
server_socket.listen(1)

print('서버가 시작되었습니다.')

while True:
    # 클라이언트로부터 연결 요청 수락
    client_socket, addr = server_socket.accept()
    print('클라이언트가 연결되었습니다:', addr)

    # 클라이언트로 부터 이미지 수신
    image_data = client_socket.recv(1024*5)
    # 수신된 데이터 출력
    print('image_data:',image_data)


    # 바이트 형식의 이미지 데이터를 ByteIO 를 사용해 메모리에 파일형태로 열어줌
    image = Image.open(io.BytesIO(image_data))
    # 객체 출력
    print('2.image:', image)
    # 이미지를 로드 하는 동안 발생할 수 있는 잘린 이미지 오류 허용
    ImageFile.LOAD_TRUNCATED_IMAGES = True
    # 모델에 맞는 크기로 조정
    image = image.resize((224, 224))
    # 이미지 데이터를 NumPy 배열로 변환
    image = np.array(image) / 255.0
    # 이미지 배열의 차원 조정 RGB 채널만 유지 이미지 마다 형식이 달라 사용
    image = image[:, :, :3]
    # 모델의 입력형식에 맞추기위해 이미지 배열의 차원을 변경
    image = np.expand_dims(image, axis=0)


    # 이미지 분석 수행

    # 이미지 분석 결과를 %로 표현 [[]] 형태로 출력
    result = model.predict(image) * 100
    print(result[0][1]) # 42.16372
    # 예측 결과로 부터 가장 높은 확률을 가진 클래스의 인덱스 추출
    label = np.argmax(result)
    print(label) # 1 => sad

    # 분석 결과를 원하는 형태인 감정상태  +  예측 % 형태로 출력
    label_names = ['♥행복♥' + ' : ' +str(result[0][0]) + '%'  , 'π슬픔π' + ' : ' +str(result[0][1]) +'%', '♨화남♨'+ ' : ' +str(result[0][2]) + '%']  # 예시로 표정 레이블을 설정
    result_label = label_names[label]

    print("result_label:" + result_label)
    # 클라이언트에 분석 결과 전송
    client_socket.send(result_label.encode() + b'\n')
     #연결 종료
    client_socket.close()