package kosta.mvc.dto;

import java.time.LocalDate;
import java.util.List;


import kosta.mvc.domain.OrderLine;
import kosta.mvc.domain.Users;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class OrderDTO {

	private Long ordersId; //주문번호
	

	private Users user;
	private String ordersPayment; //카드,카카오페이,계좌이체
	
	private int ordersPrice;
	private String ordersBookName;
	private String ordersBookEmail;
	private int ordersBookPhone;

	private String ordersContent; //추가사항
	

	private LocalDate ordersDate;
	

	private List<OrderLine> ordersLineList;
}
