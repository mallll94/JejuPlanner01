package kosta.mvc.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.GoodsLine;
public interface GoodsLineRepository extends JpaRepository<GoodsLine, Long> {

}
