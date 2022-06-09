package kosta.mvc.service;

import kosta.mvc.domain.GoodsLine;
import kosta.mvc.domain.OrderLine;
import kosta.mvc.domain.Orders;
import kosta.mvc.repository.OrderLineRepository;
import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Service;

import java.util.List;

import javax.transaction.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class OrderLineServiceImpl implements OrderLineService {

	private final OrderLineRepository orderLineRepository;

	
	@Override
	public void addOrderLine(Orders orders,List<GoodsLine> list, int orderLinePrice) {
	
		for(GoodsLine i : list) {
			OrderLine orderLine = new OrderLine(null, orders, i, list.size(), orderLinePrice, "BU");
			orderLineRepository.save(orderLine);
		}
		
	}

	@Override
	public void deleteOrderLine(Long orderLineId) {

	}

	@Override
	public List<OrderLine> getAllOrderLines() {
		List<OrderLine> orderLineList = orderLineRepository.findAll();
		return orderLineList;
	}

}
