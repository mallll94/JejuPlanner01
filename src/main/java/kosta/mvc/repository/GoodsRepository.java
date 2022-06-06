package kosta.mvc.repository;

import kosta.mvc.domain.Goods;
import kosta.mvc.domain.Place;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodsRepository extends JpaRepository<Goods, Long> {

	/**
	 * 플래너 기반 상품 검색
	 *
	 * @param place
	 * @return
	 */
	List<Goods> findAllGoodsByPlace(Place place);

	/**
	 * 카테고리별 상품 검색
	 * @param category
	 * @return
	 */
	@Query("select goods from Goods goods where goods.goodsCategory = ?1")
	List<Goods> findAllGoodsByCategory(String category);

	/**
	 * 로컬 카테고리별 상품 검색
	 *
	 * @param localCategory
	 * @return
	 */
	@Query("select goods from Goods goods where goods.goodsLocalCategory = ?1")
	List<Goods> findAllGoodsByLocalCategory(String localCategory);
}
