package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mvc.domain.GoodsLine;
import kosta.mvc.domain.OrderLine;
import kosta.mvc.domain.Orders;
import kosta.mvc.domain.Users;
import kosta.mvc.repository.OrdersRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class OrdersServiceImpl implements OrdersService {
	
	private final OrdersRepository ordersRep;
	
	private final OrderLineService orderLineService;
	

	@Override
	public void addOrders(List<GoodsLine> list ,String name, String email, String phone,int totalPrice,Users users,String text,String type) {

	Orders orders = new Orders(null, users, type, totalPrice, name, email, Integer.parseInt(phone), text, null,	null);
	
	orderLineService.addOrderLine(ordersRep.save(orders),list, totalPrice);

	}

	@Override
	public void deleteOrders(Long ordersId) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Orders> getOrders() {
		// TODO Auto-generated method stub
		return null;
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

}
