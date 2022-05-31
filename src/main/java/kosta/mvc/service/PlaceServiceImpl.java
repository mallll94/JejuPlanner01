package kosta.mvc.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.querydsl.QPageRequest;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.Place;
import kosta.mvc.repository.FreeBoardRepository;
import kosta.mvc.repository.PlaceRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
public class PlaceServiceImpl implements PlaceService {

	@Autowired
	private PlaceRepository placeRep;
	
	@Override
	public List<Place> selectAll() {
		
		return placeRep.findAll();
	}
	
	@Override
	public Page<Place> selectAll(Pageable page) {
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
		//placeRep.save(place);

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
	public List<Place> selectByCata(String filter, String placeCategory, int nowPage,int PageCount) {
		Pageable pageable = PageRequest.of((nowPage-1), PageCount, Direction.DESC, filter);
		
		List<Place> list =null;
		if(placeCategory.equals("selectAll")) {
			if(filter.equals("none")) {
				list=placeRep.findAllSort(pageable);		
			}else if(filter.equals("placeName")){
				pageable = PageRequest.of((nowPage-1), PageCount, Direction.ASC, filter);
				list=placeRep.findAllSort(pageable);
			}else{
				list=placeRep.findAllSort(pageable);
			}
		}else {
			if(filter.equals("none")) {
				list=placeRep.findbyPlaceCategory(placeCategory, null);	
			}else if(filter.equals("placeName")){
				pageable = PageRequest.of((nowPage-1), PageCount, Direction.ASC, filter);
				list=placeRep.findbyPlaceCategory(placeCategory,pageable);
			}else{
				list=placeRep.findbyPlaceCategory(placeCategory,pageable);	
			}
		}
		return list;
	}

	

}
