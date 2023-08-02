package com.amuldanzi.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.amuldanzi.domain.CommerceDTO;
import com.amuldanzi.domain.JungoLikeDTO;
import com.amuldanzi.domain.MarketGoodsDTO;

public interface MarketService {

	Page<MarketGoodsDTO> findMarketCate(Pageable paging);
	Page<MarketGoodsDTO> findDolbomiCate(Pageable paging);
	MarketGoodsDTO findById(Integer goodsId);
	void jungoSave(MarketGoodsDTO dto);
	void saveLike(String goodsId, String memberId);
    void deleteLike(String goodsId, String memberId);
    Integer getLikeCount(Integer goodsId);
	void plusLikeByPk(String goodsId);
	void minusLikeByPk(String goodsId);
	JungoLikeDTO findByGoodsIdAndMemberId(Integer goodsId, Object id);
	void save(MarketGoodsDTO result);
	List<CommerceDTO> findAllCommerce();
	CommerceDTO findByCommerceId(int commerceId);
	
	
}
