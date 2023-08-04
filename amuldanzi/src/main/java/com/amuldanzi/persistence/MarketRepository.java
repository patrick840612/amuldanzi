package com.amuldanzi.persistence;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.amuldanzi.domain.MarketGoodsDTO;

public interface MarketRepository extends CrudRepository<MarketGoodsDTO, Integer>{
	
	@Query("SELECT m FROM MarketGoodsDTO m WHERE m.marketCate.cateId = 1")
	Page<MarketGoodsDTO> findMarketCate(Pageable paging);
	
	@Query("SELECT m FROM MarketGoodsDTO m WHERE m.marketCate.cateId = 2")
	Page<MarketGoodsDTO> findDolbomiCate(Pageable paging);
	
	@Modifying
	@Query(value = "UPDATE marketgoods  SET likes_count = likes_count + 1 WHERE goods_id = :goodsId", nativeQuery = true)
	void plusLikeByPk(String goodsId);
	
	@Modifying
	@Query(value = "UPDATE marketgoods  SET likes_count = likes_count - 1 WHERE goods_id = :goodsId", nativeQuery = true)
	void minusLikeByPk(String goodsId);
	
	@Query("SELECT m FROM MarketGoodsDTO m WHERE m.marketCate.cateId = 1 ORDER BY m.goodsDate DESC")
	List<MarketGoodsDTO> getJunggoListRecent();
	
}
