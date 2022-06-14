package kosta.mvc.dto;


import kosta.mvc.domain.GoodsLine;
import kosta.mvc.domain.Orders;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class OrderLineDTO {

	
	private Long orderLineId; //주문상세번호

	private Orders order; //주문번호
	

	private GoodsLine goodsLine; //상품상세번호
	
	private int orderLineAmount;
	private int orderLinePrice;
	
	private String orderLineState; //사용전(BU) 사용완료(
}
