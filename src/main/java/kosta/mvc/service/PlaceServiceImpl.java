package kosta.mvc.service;

import java.util.ArrayList;
import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.querydsl.core.BooleanBuilder;

import kosta.mvc.domain.Place;
import kosta.mvc.domain.QPlace;

import kosta.mvc.repository.PlaceRepository;
import lombok.RequiredArgsConstructor;


@Service
@Transactional
@RequiredArgsConstructor
public class PlaceServiceImpl implements PlaceService {

	
	private final PlaceRepository placeRep;
	
	@Override
	public List<Place> selectAll() {
		
		return placeRep.findAll();
	}
	
	@Override
	public Page<Place> selectAll(int nowPage,int PAGE_COUNT) {

		Pageable page = PageRequest.of((nowPage-1), PAGE_COUNT, Direction.DESC, "placeId");
		
		Page<Place> pageList = placeRep.findAll(page);
		return pageList;
	}

	@Override
	public Place selectById(Long placeId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertPlace(Place place) {
		placeRep.save(place);

	}

	@Override
	public void updatePlace(Place place) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deletePlace(Long placeId) {
		// TODO Auto-generated method stub

	}

	@Override//Sort.by(Sort.Order.asc(filter))
	public Page<Place> selectByCata(String filter, String placeCategory, int nowPage,int PageCount) {
		QPlace place = QPlace.place;
		BooleanBuilder builder = new BooleanBuilder();
		Pageable pageable = PageRequest.of((nowPage-1), PageCount, Direction.DESC, filter);
		
		if((filter.equals("none")|| filter==null)) {
			pageable = PageRequest.of((nowPage-1), PageCount);

		}else if(filter.equals("placeName")){
			pageable = PageRequest.of((nowPage-1), PageCount, Direction.ASC, filter);
		}
		

		if(!placeCategory.equals("selectAll")) {
			builder.and(place.placeCategory.contains(placeCategory));
		}

		Page<Place> result = placeRep.findAll(builder, pageable);

		return result;
	}
	
}
