package com.amuldanzi.socket;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;
import java.nio.file.Files;
import java.nio.file.Paths;

import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
 
// 파이썬과 연결되는 클라이언트
public class Client { 
	public static String check(String filePath) {
	try {  

            // 이미지 파일을 바이트 배열로 읽기
            byte[] imageData = Files.readAllBytes(Paths.get(filePath)); 
            // 서버 정보 설정
            String serverHost = "192.168.0.55";
            int serverPort = 5000;

            // 소켓 연결
            Socket socket = new Socket(serverHost, serverPort);

            // 이미지 데이터 전송
            OutputStream outputStream = socket.getOutputStream();
            outputStream.write(imageData);
            // 추가 데이터를 기록하거나 다른작업을 수행할 준비
            outputStream.flush();

            // 바이트 스트림과 문자 스트림간의 연결 담당
            BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            // 입력 스트림에서 한줄의 텍스트를 읽어냄
            String response = reader.readLine();
            // 분석결과 출력
            System.out.println("이미지 분석 결과: " + response);
 
            // 연결 종료
            socket.close();
            
            // 결과값 매개인자 filePath에 저장
            return response;
            
        } catch (IOException e) {
        	
            e.printStackTrace();
            return null;
        }
	
    }
	
}