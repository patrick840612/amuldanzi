package com.amuldanzi.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.amuldanzi.domain.CartDTO;
import com.amuldanzi.domain.CommerceDTO;
import com.amuldanzi.domain.JungoLikeDTO;
import com.amuldanzi.domain.MarketGoodsDTO;
import com.amuldanzi.domain.MemberInfoDTO;
import com.amuldanzi.domain.OrderItemsDTO;
import com.amuldanzi.domain.OrdersDTO;

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
	void cartSave(CartDTO cart);
	boolean cartCheck(MemberInfoDTO memberInfo, CommerceDTO commerce);
	List<CartDTO> findCartById(Object id);
	void deleteCartByCartId(int cartId);
	Optional<CartDTO> findByMemberInfoAndCommerce(MemberInfoDTO member, CommerceDTO commerce);
	void cartDelete(int cartId);
	Integer ordersSave(OrdersDTO dto);
	void saveOrderItems(OrderItemsDTO dto);
	void updateCommerce(CommerceDTO commerce);
	void cartDeleteAll(String string);
	List<MarketGoodsDTO> getJunggoListRecent();
	List<CommerceDTO> getCommerceListRecent();
	List<CommerceDTO> findCommerceAsc();
	
}
