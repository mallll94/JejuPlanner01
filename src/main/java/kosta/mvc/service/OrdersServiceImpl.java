package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.querydsl.core.BooleanBuilder;

import kosta.mvc.domain.GoodsLine;
import kosta.mvc.domain.OrderLine;
import kosta.mvc.domain.Orders;
import kosta.mvc.domain.QOrderLine;
import kosta.mvc.domain.QOrders;
import kosta.mvc.domain.Users;
import kosta.mvc.repository.OrderLineRepository;
import kosta.mvc.repository.OrdersRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class OrdersServiceImpl implements OrdersService {
	
	private final OrdersRepository ordersRep;
	private final OrderLineRepository orderLineRep;
	private final OrderLineService orderLineService;
	

	@Override
	public Long addOrders(List<GoodsLine> list ,String name, String email, String phone,int totalPrice,Users users,String text,String type) {

	Orders orders = new Orders(null, users, type, totalPrice, name, email, Integer.parseInt(phone), text, null,	null);
	Orders order=ordersRep.save(orders);
	orderLineService.addOrderLine(order,list, totalPrice);
		return order.getOrdersId();
	}

	@Override
	public void deleteOrders(Long ordersId) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Orders> getOrders() {
		
		return ordersRep.findAll();
	}

	@Override
	public List<Orders> getOrdersByUserId() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Orders getOrdersByOrdersId() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderLine> getOrdersByCatagory(String catagory) {
		QOrders orders = QOrders.orders;
		QOrderLine orderLine = QOrderLine.orderLine;
		BooleanBuilder builder = new BooleanBuilder();
		
		builder.and(orderLine.goodsLine.goods.goodsCategory.contains(catagory));
		List<OrderLine> orderLines=(List<OrderLine>) orderLineRep.findAll(builder);
		
		
		
		
		return orderLines;
	}

	@Override
	public Page<Orders> selectByCata(String filter, int nowPage, int PageCount) {
	
		Pageable pageable = PageRequest.of((nowPage-1), PageCount);	
		Page<Orders> result =  ordersRep.findAll(pageable);
		

		return result;
	}

}
