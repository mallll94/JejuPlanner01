package kosta.mvc.domain;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "goodsline")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class GoodsLine {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "goods_line_seq")
	@SequenceGenerator(sequenceName = "goods_line_seq", allocationSize = 1, name = "goods_line_seq")
	private Long goodsLineId; //상품상세 번호
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "goods_fk")
	private Goods goods; //상품번호
    
	private int goodsLineAmount;
    private LocalDate goodsLineDate;

}
