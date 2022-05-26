package kosta.mvc.domain;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "orders")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class Orders {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "order_seq")
	@SequenceGenerator(sequenceName = "order_seq", allocationSize = 1, name = "order_seq")
	@NonNull
	private Long orderId; //주문번호
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_fk")
	private Users user;
	
	@Column(nullable = false)
	private String orderPayment;
	
	private int orderPrice;
	private String orderBookName;
	private String orderBookEmail;
	private int orderBookPhone;
	
	@Column(length = 300)
	private String orderContent; //추가사항
	
	@CreationTimestamp
	private LocalDate orderDate;
	
	/** 주문상세 */
	@OneToMany(mappedBy = "order")
	private List<OrderLine> orderLineList;
	
	
	/** 핫딜상세 */
	@OneToMany(mappedBy = "order")
	private List<TimeOrderLine> timeOrderLineList;
	
}
