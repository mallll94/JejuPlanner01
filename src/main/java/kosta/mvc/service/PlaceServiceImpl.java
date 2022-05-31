package kosta.mvc.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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

	@Override
	public List<Place> selectByCata(String filter, String placeCategory) {
		List<Place> list =null;
		if(placeCategory.equals("selectAll")) {
			if(filter.equals("none")) {
				list=placeRep.findAllSort(null);		
			}else if(filter.equals("placeName")){
				list=placeRep.findAllSort(Sort.by(Sort.Order.asc(filter)));
			}
			else{
				list=placeRep.findAllSort(Sort.by(Sort.Order.desc(filter)));
			}
		}else {
			if(filter.equals("none")) {
				list=placeRep.findbyPlaceCategory(placeCategory, null);	
			}else if(filter.equals("placeName")){
				list=placeRep.findbyPlaceCategory(placeCategory,Sort.by(Sort.Order.asc(filter)));
			}else{
				list=placeRep.findbyPlaceCategory(placeCategory, Sort.by(Sort.Order.desc(filter)));	
			}
		}
		return list;
	}

	

}
