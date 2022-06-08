package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.GoodsReply;

public interface GoodsReplyRepository extends JpaRepository<GoodsReply, Long> {
	
	/**
	 * Goods Id로 상품후기 조회하기 
	 * @param goodsId
	 * @return
	 */
	List<GoodsReply> findGoodsReplyByGoodsId(Long goodsId);

}
