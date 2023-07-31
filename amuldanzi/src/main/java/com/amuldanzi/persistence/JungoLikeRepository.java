package com.amuldanzi.persistence;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.amuldanzi.domain.JungoLikeDTO;

public interface JungoLikeRepository extends JpaRepository<JungoLikeDTO, Integer> {

	// 해당 커뮤니티 글에 해당하는 좋아요 정보 저장
	@Modifying
	@Query(value = "INSERT INTO jungo_like (like_date, goods_id, id) " + "SELECT sysdate(), :goodsId, :memberId "
			+ "FROM dual " + "WHERE NOT EXISTS "
			+ "(SELECT 1 FROM jungo_like WHERE id = :memberId AND goods_id = :goodsId)", nativeQuery = true)
	Integer saveLike(String goodsId, String memberId);

	// 좋아요 수 반환하는 쿼리
	@Query(value = "SELECT COUNT(*) FROM jungo_like WHERE goods_id = :goodsId", nativeQuery = true)
	Integer getLikeCount(Integer goodsId);

	// 해당 커뮤니티 글 번호에 해당하는 정보중 특정회원의 좋아요 삭제
	@Modifying
	@Query(value = "DELETE FROM jungo_like WHERE goods_Id = :goodsId AND id = :memberId", nativeQuery = true)
	void deleteJundgoUnlike(String goodsId, String memberId);
	
	@Query("SELECT j FROM JungoLikeDTO j WHERE j.MarketGoods.goodsId = :goodsId AND j.memberId.id = :memberId")
	JungoLikeDTO findByGoodsIdAndMemberId(Integer goodsId, Object memberId);

}