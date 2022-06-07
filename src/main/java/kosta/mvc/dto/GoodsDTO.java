package kosta.mvc.dto;

import kosta.mvc.domain.Place;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class GoodsDTO {


	private Long goodsId; //상품번호
	private Place place; //장소데이터 번호	
	//마이리얼트립 참고>> 애월, 제주시, 함덕/구좌, 성산/우도, 표선, 서귀포, 중문, 한림/협재
	private String goodsLocalCategory; //지역카테고리
	private String goodsCategory; //액티비티, 입장권, 스파/힐링, 대여 
	private String goodsName;
	private int goodsPrice;

	private String goodsContent;	
	private String goodsPhoto;
	private String goodsAddr;
	
	/** 상품후기 */
	//@OneToMany(mappedBy = "goods")
	//private List<GoodsReply> goodsReplyList;
	
	/** 상품상세 */
	//@OneToMany(mappedBy = "goods")
	//private List<GoodsLine> goodsLineList;
}
