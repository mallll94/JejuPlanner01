package kosta.mvc.service;

import kosta.mvc.domain.OrderLine;
import kosta.mvc.repository.OrderLineRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderLineServiceImpl implements OrderLineService {

	OrderLineRepository orderLineRepository;

	@Override
	public void addOrderLine(OrderLine orderLine) {

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
