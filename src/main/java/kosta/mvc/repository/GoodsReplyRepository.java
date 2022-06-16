package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.data.repository.query.QueryByExampleExecutor;

import kosta.mvc.domain.Goods;
import kosta.mvc.domain.GoodsReply;

public interface GoodsReplyRepository extends JpaRepository<GoodsReply, Long>, QuerydslPredicateExecutor<GoodsReply> {
	
	/**
	 * Goods Id로 상품후기 조회하기 
	 * @param goodsId
	 * @return
	 */
	List<GoodsReply> findGoodsReplyByGoods(Goods goods);

}
