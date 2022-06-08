package kosta.mvc.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.querydsl.core.BooleanBuilder;

import kosta.mvc.domain.Place;
import kosta.mvc.domain.PlannerPlace;
//import kosta.mvc.domain.QPlace;
import kosta.mvc.dto.PlaceDTO;
import kosta.mvc.repository.PlaceRepository;
import kosta.mvc.util.FileStore;
import lombok.RequiredArgsConstructor;


@Service
@Transactional
@RequiredArgsConstructor
public class PlaceServiceImpl implements PlaceService {

	
	private final PlaceRepository placeRep;
	private final FileStore fileStore;
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
		
		//QPlace place = QPlace.place;
		BooleanBuilder builder = new BooleanBuilder();
		
		//builder.and(place.placeName.contains(placeName));
		
		
		
		Optional<Place> selectPlace = placeRep.findOne(builder);
		
		
		return selectPlace;
	}
	
	@Override
	public void insertPlace(Place place, String uploadPath) {
		System.out.println("3번문제");
		Place savePlace = placeRep.save(place);
		System.out.println("4번문제");
		MultipartFile file = place.getFile();
		
		if (!file.isEmpty()) {
			if (file.getContentType().startsWith("image") == false) {
				throw new RuntimeException("이미지형식이 아닙니다.");
			}
			
			try {
				System.out.println("5번문제");
				String storeFIleName = fileStore.storeFile(uploadPath, file);
				savePlace.setPlacePhoto(storeFIleName);
			} catch (IOException e) {
				throw new RuntimeException("저장중에 문제가 발생하였습니다.", e);
			}
		}
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
		//QPlace place = QPlace.place;
		BooleanBuilder builder = new BooleanBuilder();
		Pageable pageable = PageRequest.of((nowPage-1), PageCount, Direction.DESC, filter);
		
		if((filter.equals("none")|| filter==null)) {
			pageable = PageRequest.of((nowPage-1), PageCount);

		}else if(filter.equals("placeName")){
			pageable = PageRequest.of((nowPage-1), PageCount, Direction.ASC, filter);
		}
		

		if(!placeCategory.equals("selectAll")) {
			//builder.and(place.placeCategory.contains(placeCategory));
		}

		//Page<Place> result = placeRep.findAll(builder, pageable);

		//return result;
		return null;
	}
	
	
	@Override
	public Page<Place> selectByKeyword(Pageable pageable, String keyword) {
		//keyword로 검색
		//QPlace place = QPlace.place;
		BooleanBuilder builder = new BooleanBuilder();
		//builder.and(place.placeName.contains(keyword));

		//Page<Place> result = placeRep.findAll(builder, pageable);

		//return result;
		return null;
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
