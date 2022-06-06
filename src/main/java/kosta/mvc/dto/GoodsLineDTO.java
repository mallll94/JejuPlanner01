package kosta.mvc.dto;

import java.time.LocalDate;

import kosta.mvc.domain.Goods;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class GoodsLineDTO {

	private Long goodsLineId; //상품상세 번호
	private Goods goods; //상품번호
	private int goodsLineAmount;
    private LocalDate goodsLineDate;
}
