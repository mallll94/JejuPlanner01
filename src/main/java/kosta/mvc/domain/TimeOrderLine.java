package kosta.mvc.domain;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "timeorderline")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class TimeOrderLine {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "time_order_line_seq")
	@SequenceGenerator(sequenceName = "time_order_line_seq", allocationSize = 1, name = "time_order_line_seq")
	@NonNull
	private Long timeOrderLineId; //핫딜상세번호
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "timedeal_fk")
	private TimeDeal timeDeal; //핫딜번호
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "order_fk")
	private Orders order; //주문번호
	
	private int timeOrderLineAmount;
	private int timeOrderLinePrice;

}
