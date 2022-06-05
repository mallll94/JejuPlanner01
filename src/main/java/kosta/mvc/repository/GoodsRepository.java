package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import kosta.mvc.domain.Goods;

@Repository
public interface GoodsRepository extends JpaRepository<Goods, Long> {

	
//	@Query("select from goods ")
//	List<Goods> getAllGoodsOrderBySalesAmount();
}
