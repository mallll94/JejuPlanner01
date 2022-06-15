package kosta.mvc.service;

import kosta.mvc.domain.GoodsLine;
import kosta.mvc.domain.OrderLine;
import kosta.mvc.domain.Orders;
import kosta.mvc.domain.QOrderLine;
import kosta.mvc.repository.OrderLineRepository;
import lombok.RequiredArgsConstructor;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.querydsl.core.BooleanBuilder;

import java.time.LocalDate;
import java.time.Month;
import java.util.List;
import java.util.Map;

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
		OrderLine orderLine=orderLineRepository.findById(orderLineId).orElse(null);
		orderLine.setOrderLineState("RF");
		
	}

	@Override
	public List<OrderLine> getAllOrderLines() {
		List<OrderLine> orderLineList = orderLineRepository.findAll();
		return orderLineList;
	}

	@Override
	public Map<String, Object> cataOrderLines(String cata) {
		QOrderLine orderLine = QOrderLine.orderLine;
		BooleanBuilder builder = new BooleanBuilder();
		
		LocalDate now = LocalDate.now();
		
		builder.and(orderLine.goodsLine.goods.goodsCategory.contains(cata));
		
		
		
		return null;
	}

	@Override
	public OrderLine selectById(Long orderLineId) {
		OrderLine orderLine=orderLineRepository.findById(orderLineId).orElse(null);
		
		
		return orderLine;
	}

	@Override
	public void deleteOrder(Long orderLineId) {
		orderLineRepository.deleteById(orderLineId);
		
	}

	

}
