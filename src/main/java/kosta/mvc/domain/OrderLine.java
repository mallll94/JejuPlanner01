package kosta.mvc.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "orderline")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class OrderLine {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "order_line_seq")
	@SequenceGenerator(sequenceName = "order_line_seq", allocationSize = 1, name = "order_line_seq")
	@NonNull
	private Long orderLineId; //주문상세번호
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "order_fk")
	private Orders order; //주문번호
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "goodsline_fk")
	private GoodsLine goodsLine; //상품상세번호
	
	private int orderLineAmount;
	private int orderLinePrice;
	
	@Column(columnDefinition = "varchar2(20) default 'BU'")
	private String orderLineState; //사용전(BU) 사용완료(CU) 기간만료(EX) 환불(RF) 
	
}
