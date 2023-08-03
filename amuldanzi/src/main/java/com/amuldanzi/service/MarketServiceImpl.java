package com.amuldanzi.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.amuldanzi.domain.CartDTO;
import com.amuldanzi.domain.CommerceDTO;
import com.amuldanzi.domain.JungoLikeDTO;
import com.amuldanzi.domain.MarketGoodsDTO;
import com.amuldanzi.domain.MemberInfoDTO;
import com.amuldanzi.persistence.CartRepository;
import com.amuldanzi.persistence.CommerceRepository;
import com.amuldanzi.persistence.JungoLikeRepository;
import com.amuldanzi.persistence.MarketRepository;

import jakarta.transaction.Transactional;

@Service("marketService")
public class MarketServiceImpl implements MarketService {

	@Autowired
	private MarketRepository marketRepo;

	@Autowired
	private JungoLikeRepository jungoLikeRepository;
	
	@Autowired
	private CommerceRepository commerceRepo;
	
	@Autowired
	private CartRepository cartRepo;

	@Override
	public Page<MarketGoodsDTO> findMarketCate(Pageable paging) {
		return marketRepo.findMarketCate(paging);
	}

	@Override
	public Page<MarketGoodsDTO> findDolbomiCate(Pageable paging) {
		return marketRepo.findDolbomiCate(paging);
	}

	@Override
	public MarketGoodsDTO findById(Integer goodsId) {
		return marketRepo.findById(goodsId).get();
	}

	@Override
	public void jungoSave(MarketGoodsDTO dto) {
		marketRepo.save(dto);
	}

	@Transactional
	@Override
	public void saveLike(String goodsId, String memberId) {

		jungoLikeRepository.saveLike(goodsId,memberId);
	}

	@Transactional
	@Override
	public void deleteLike(String goodsId, String memberId) {
		jungoLikeRepository.deleteJundgoUnlike(goodsId, memberId);
	}

	@Transactional
	@Override
	public Integer getLikeCount(Integer goodsId) {
		return jungoLikeRepository.getLikeCount(goodsId);
	}

	@Override
	public void plusLikeByPk(String goodsId) {
		marketRepo.plusLikeByPk(goodsId);
	}

	@Override
	public void minusLikeByPk(String goodsId) {
		marketRepo.minusLikeByPk(goodsId);
	}

	@Override
	public JungoLikeDTO findByGoodsIdAndMemberId(Integer goodsId, Object id) {
		return jungoLikeRepository.findByGoodsIdAndMemberId(goodsId, id);
	}

	@Override
	public void save(MarketGoodsDTO result) {
		marketRepo.save(result);
		
	}

	@Override
	public List<CommerceDTO> findAllCommerce() {
		return (List<CommerceDTO>) commerceRepo.findAll();
	}

	@Override
	public CommerceDTO findByCommerceId(int commerceId) {
		return commerceRepo.findById(commerceId).get();
	}

	@Override
	public void cartSave(CartDTO cart) {
		cartRepo.save(cart);
	}

	@Override
	public boolean cartCheck(MemberInfoDTO memberInfo, CommerceDTO commerce) {
		return cartRepo.findByMemberInfoAndCommerce(memberInfo, commerce).isPresent();
	}

	@Override
	public List<CartDTO> findCartById(Object id) {
		return cartRepo.findByMemberInfo_Id(id);
		
	}

	@Override
	public void deleteCartByCartId(int cartId) {
		cartRepo.deleteById(cartId);
	}

	@Override
	public Optional<CartDTO> findByMemberInfoAndCommerce(MemberInfoDTO member, CommerceDTO commerce) {
		return cartRepo.findByMemberInfoAndCommerce(member, commerce);
	}

	@Override
	public void cartDelete(int cartId, String userId) {
		cartRepo.cartDelete(cartId,userId);
	}





}
