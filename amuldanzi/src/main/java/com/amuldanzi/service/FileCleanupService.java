package com.amuldanzi.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amuldanzi.dao.BusinessDAO;
import com.amuldanzi.dao.QnaDAO;
import com.amuldanzi.dao.SitterDAO;
import com.amuldanzi.domain.BusinessDTO;
import com.amuldanzi.domain.QnaDTO;
import com.amuldanzi.domain.SitterDTO;

@Service
public class FileCleanupService {

    private String filePath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\images\\mypage\\"; // 웹 서버에 이미지가 저장된 경로

    // 데이터베이스와 상호작용하는 리포지토리 인스턴스들을 가정합니다.
    @Autowired
    private final BusinessDAO businessDAO;
    @Autowired
    private final SitterDAO sitterDAO;
    @Autowired
    private final QnaDAO qnaDAO;

    public FileCleanupService(BusinessDAO businessDAO, SitterDAO sitterDAO, QnaDAO qnaDAO) {
        this.businessDAO = businessDAO;
        this.sitterDAO = sitterDAO;
        this.qnaDAO = qnaDAO;
    }

    // 정리 작업을 수행하는 메서드
    public void performFileCleanup() {
        List<String> dbImgList = new ArrayList<>();
        List<String> serverImgList = new ArrayList<>();

        List<BusinessDTO> businesses = convertIterableToList(businessDAO.findAll());
        List<SitterDTO> sitters = convertIterableToList(sitterDAO.findAll());
        List<QnaDTO> qnas = convertIterableToList(qnaDAO.findAll());
        
        // DB의 img 값을 하나의 리스트에 추가
        for (BusinessDTO business : businesses) {
            String businessImg = business.getBusinessImg();
            if (businessImg != null) {
                dbImgList.add(businessImg);
            }
        }

        for (SitterDTO sitter : sitters) {
            String sitterImg = sitter.getSitterImg();
            if (sitterImg != null) {
                dbImgList.add(sitterImg);
            }
        }
        
        for (QnaDTO qna : qnas) {
            String qnaImg = qna.getQnaImg();
            if (qnaImg != null && !qnaImg.isEmpty()) {
                dbImgList.add(qnaImg);
            }
        }

        // 웹 서버의 파일명을 다른 리스트에 추가
        File folder = new File(filePath);
        File[] files = folder.listFiles();
        if (files != null) {
            for (File file : files) {
                if (file.isFile()) {
                    serverImgList.add(file.getName());
                }
            }
        }

        // 서버에 남아있는 파일 중 DB에 없는 파일 삭제
        for (String serverImg : serverImgList) {
            if (!dbImgList.contains(serverImg)) {
                deleteImage(filePath + serverImg);
            }
        }
        
        System.out.println(dbImgList);
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

