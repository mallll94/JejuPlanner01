package kosta.mvc.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.querydsl.core.BooleanBuilder;

import kosta.mvc.domain.Place;
import kosta.mvc.domain.PlannerPlace;
import kosta.mvc.domain.QPlace;
import kosta.mvc.dto.PlaceDTO;
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
		Optional<Place> result = placeRep.findById(placeId);
		
		return result.orElse(null);
	}

	@Override
	public Optional<Place> selectByName(String placeName) {
		
		QPlace place = QPlace.place;
		BooleanBuilder builder = new BooleanBuilder();
		
		builder.and(place.placeName.contains(placeName));
		
		
		
		Optional<Place> selectPlace = placeRep.findOne(builder);
		
		
		return selectPlace;
	}
	
	@Override
	public void insertPlace(Place place) {
		placeRep.save(place);

	}

	@Override
	public void updatePlace(Place place) {
		
		Place result=placeRep.findById(place.getPlaceId()).orElse(null);
		result.setPlaceAddr(place.getPlaceAddr());
		result.setPlaceContent(place.getPlaceContent());
		result.setPlaceLatitude(place.getPlaceLatitude());
		result.setPlaceLongitude(place.getPlaceLongitude());
		result.setPlaceName(place.getPlaceName());
		result.setPlacePhoto(place.getPlacePhoto());
		result.setPlaceUrl(place.getPlaceUrl());

	}

	@Override
	public void deletePlace(Long placeId) {
		placeRep.deleteById(placeId);
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
	
	
	@Override
	public Page<Place> selectByKeyword(Pageable pageable, String keyword) {
		//keyword로 검색
		QPlace place = QPlace.place;
		BooleanBuilder builder = new BooleanBuilder();
		builder.and(place.placeName.contains(keyword));

		Page<Place> result = placeRep.findAll(builder, pageable);

		return result;
	}

	@Override
	public List<PlaceDTO> selectByPlanner(List<PlannerPlace> list) {
		List<PlaceDTO> result = new ArrayList<PlaceDTO>();
		
		for(PlannerPlace x :list) {
			
			
			result.add(new PlaceDTO(x.getPlace().getPlaceId(), x.getPlace().getPlaceCategory(),
					x.getPlace().getPlaceName(), x.getPlace().getPlaceAddr(),
					x.getPlace().getPlaceContent(), x.getPlace().getPlacePhoto(), x.getPlace().getPlaceUrl(),
					x.getPlace().getPlaceLatitude(), x.getPlace().getPlaceLongitude(), 0,x.getPlannerPlaceDate()));
			
		}
		
		return result;
	}
	

	
	
}
