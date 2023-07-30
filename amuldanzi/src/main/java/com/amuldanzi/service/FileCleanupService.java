package com.amuldanzi.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.amuldanzi.dao.BusinessDAO;
import com.amuldanzi.dao.SitterDAO;
import com.amuldanzi.domain.BusinessDTO;
import com.amuldanzi.domain.SitterDTO;

@Service
public class FileCleanupService {

    private String filePath = "file:///" + System.getProperty("user.dir") + "/src/main/resources/static/images/mypage/"; // 웹 서버에 이미지가 저장된 경로

    // 데이터베이스와 상호작용하는 리포지토리 인스턴스들을 가정합니다.
    private final BusinessDAO businessDAO;
    private final SitterDAO sitterDAO;

    public FileCleanupService(BusinessDAO businessDAO, SitterDAO sitterDAO) {
        this.businessDAO = businessDAO;
        this.sitterDAO = sitterDAO;
    }

    // 정리 작업을 수행하는 메서드
    public void performFileCleanup() {
        List<BusinessDTO> businesses = convertIterableToList(businessDAO.findAll());
        List<SitterDTO> sitters = convertIterableToList(sitterDAO.findAll());

        Map<String, String> fileMap = new HashMap<>();

        for (BusinessDTO business : businesses) {
            String businessImg = business.getBusinessImg();
            if (businessImg != null) {
                fileMap.put(businessImg, filePath);
            }
        }

        for (SitterDTO sitter : sitters) {
            String sitterImg = sitter.getSitterImg();
            if (sitterImg != null) {
                fileMap.put(sitterImg, filePath);
            }
        }

        for (Map.Entry<String, String> entry : fileMap.entrySet()) {
            String fileName = entry.getKey();
            String fullImgPath = entry.getValue() + fileName;

            if (shouldDeleteImage(fullImgPath)) {
                deleteImage(fullImgPath);
            }
        }
    }

    private boolean shouldDeleteImage(String fullImgPath) {
        if (fullImgPath == null) {
            return false; // 파일 경로가 null이면 삭제하지 않음
        }

        File file = new File(fullImgPath);
        return !file.exists(); // 파일이 존재하지 않으면 삭제함
    }

    private void deleteImage(String filePath) {
        File file = new File(filePath);
        if (file.delete()) {
            // 필요에 따라 로그를 기록하거나 추가 동작을 수행할 수 있습니다.
        } else {
            // 파일 삭제가 실패한 경우, 로그를 남기거나 이에 맞는 처리를 해야합니다.
        }
    }
    
    // Iterable을 List로 변환하는 유틸리티 메서드
    private <T> List<T> convertIterableToList(Iterable<T> iterable) {
        List<T> list = new ArrayList<>();
        iterable.forEach(list::add);
        return list;
    }
}