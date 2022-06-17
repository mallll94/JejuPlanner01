package kosta.mvc.service;

import kosta.mvc.domain.Goods;
import kosta.mvc.domain.GoodsReply;
import kosta.mvc.domain.OrderLine;
import kosta.mvc.domain.Place;
import kosta.mvc.domain.PlannerPlace;
import kosta.mvc.domain.QGoods;
import kosta.mvc.domain.QPlannerPlace;
import kosta.mvc.domain.Users;
import kosta.mvc.repository.FreeBoardRepository;
import kosta.mvc.repository.GoodsReplyRepository;
import kosta.mvc.repository.GoodsRepository;
import kosta.mvc.repository.OrderLineRepository;
import kosta.mvc.repository.PlannerPlaceRepository;
import kosta.mvc.repository.UserRepository;
import kosta.mvc.util.FileStore;
import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.google.common.collect.Lists;
import com.querydsl.core.BooleanBuilder;

import java.io.IOException;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class GoodsServiceImpl implements GoodsService {

	
	private final GoodsRepository goodsRepository;
	private final OrderLineRepository orderLineRepository;
	private final GoodsReplyRepository goodsReplyRepository;
	private final PlannerPlaceRepository plannerPlaceRep;
	
	private final FileStore fileStore;

	@Override
	@Transactional
	public void addGoods(Goods goods, String uploadPath) {
		
		MultipartFile file = goods.getFile();
		if(!file.isEmpty()) {
			if(file.getContentType().startsWith("image")==false) {
				throw new RuntimeException("이미지형식이 아닙니다.");
			}
			try {
				String storeFileName = fileStore.storeFile(uploadPath, file);
				goods.setGoodsPhoto(storeFileName);
			}catch(IOException e) {
				throw new RuntimeException("파일을 업로드 하는 도중 문제가 발생했습니다.",e);
			}
		}
		
		goodsRepository.save(goods);
	}

	@Override
	@Transactional
	public void updateGoods(Goods goods, String uploadPath) {
		
		MultipartFile file = goods.getFile();
		if(!file.isEmpty()) {
			if(file.getContentType().startsWith("image")==false) {
				throw new RuntimeException("이미지형식이 아닙니다.");
			}
			try {
				String storeFileName = fileStore.storeFile(uploadPath, file);
				goods.setGoodsPhoto(storeFileName);
			}catch(IOException e) {
				throw new RuntimeException("파일을 업로드 하는 도중 문제가 발생했습니다.",e);
			}
		}
		
		goodsRepository.save(goods);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Goods> getAllGoods() {
		List<Goods> goodsList = goodsRepository.findAll();
		return goodsList;
	}

	@Override
	@Transactional
	public void deleteGoods(Long goodsId) {
		goodsRepository.deleteById(goodsId);
	}

	@Override
	@Transactional(readOnly = true)
	public Goods getGoodsByGoodsId(Long goodsId) {
		Goods goods = goodsRepository.findById(goodsId)
				.orElseThrow(()-> new RuntimeException("상품을 찾을 수 없습니다."));
		return goods;
	}
	/**
	 * goods이름으로 상품 조회
	 */
	@Override
	@Transactional(readOnly = true)
	public List<Goods> getGoodsByGoodsName(String goodsName) throws Exception {
		List<Goods> goodsList = goodsRepository.findAllGoodsByGoodsName(goodsName);
		return goodsList;
	}
	/**
	 *goods 판매량순으로 상품 조회
	 */
	@Override
	@Transactional(readOnly = true)
	public List<Goods> getAllGoodsOrderBySalesAmount() {
		List<OrderLine> orderLineList = orderLineRepository.findAll();
		return orderLineList.stream()
				.collect(Collectors.groupingBy(orderLine -> orderLine.getGoodsLine().getGoods().getGoodsId(), Collectors.summingInt(OrderLine::getOrderLineAmount)))
				.entrySet()
				.stream()
				.sorted(Map.Entry.comparingByValue(Comparator.reverseOrder()))
				.map(item -> getGoodsByGoodsId(item.getKey()))
				.collect(Collectors.toList());
	}

//	@Override
//	@Transactional(readOnly = true)
//	public List<Goods> getAllGoodsOrderByStars() {
//		List<GoodsReply> goodsReplyList = goodsReplyRepository.findAll();
//		return goodsReplyList.stream()
//				.collect(Collectors.groupingBy(goodsReply -> goodsReply.getGoods(), Collectors.averagingDouble(GoodsReply::getGoodsReplyStart)))
//				.entrySet()
//				.stream()
//				.sorted(Map.Entry.comparingByValue(Comparator.reverseOrder()))
//				.map(item -> item.getKey())
//				.collect(Collectors.toList());
//	}

	@Override
	@Transactional(readOnly = true)
	public List<Goods> getAllGoodsByPlanner(Users users) {
		QPlannerPlace plannerPlace = QPlannerPlace.plannerPlace;
		QGoods goods = QGoods.goods;
		BooleanBuilder builder = new BooleanBuilder();
		BooleanBuilder builder2 = new BooleanBuilder();
		builder.and(plannerPlace.user.userId.equalsIgnoreCase(users.getUserId()));	
		Iterable<PlannerPlace> lt=plannerPlaceRep.findAll(builder);
		List<PlannerPlace> list= Lists.newArrayList(lt);
		
		if(list.size()!=0) {
			System.out.println("플래너 기반 ");
			list.forEach(b->builder2.or(goods.goodsAddr.contains(b.getPlace().getPlaceAddr().split(" ")[0]+" "+b.getPlace().getPlaceAddr().split(" ")[1]+" "+b.getPlace().getPlaceAddr().split(" ")[2])));
			Iterable<Goods> lt2 =goodsRepository.findAll(builder2);
			List<Goods> list2= Lists.newArrayList(lt2);
			list2.forEach(c->System.out.println("이름 상품"+c.getGoodsName()+"상품 가격"+c.getGoodsPrice()+"상품 아이디"+c.getGoodsId()));
			
			return list2;
		}else {
			System.out.println("전체");
			List<Goods> goodsList = goodsRepository.findAll();
			return goodsList;
		}

	}

	@Override
	@Transactional(readOnly = true)
	public List<Goods> getAllGoodsByCategory(String category) {
		if (category.equals("전체보기")) {
			return goodsRepository.findAll();
		}
		return goodsRepository.findAllGoodsByCategory(category);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Goods> getAllGoodsByLocalCategory(String localCategory) {
		List<Goods> goodsList = goodsRepository.findAllGoodsByLocalCategory(localCategory);
		return goodsList;
	}

	@Override
	public List<Goods> searchByGoods(String keyWord) {
		
		QGoods goods = QGoods.goods;
		BooleanBuilder builder = new BooleanBuilder();
		
		builder.or(goods.goodsAddr.contains(keyWord));
		builder.or(goods.goodsCategory.contains(keyWord));
		builder.or(goods.goodsContent.contains(keyWord));
		builder.or(goods.goodsName.contains(keyWord));
		
		List<Goods> list=(List<Goods>) goodsRepository.findAll(builder);
		
		
		return list;
	}



}
