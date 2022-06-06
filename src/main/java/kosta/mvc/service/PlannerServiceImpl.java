package kosta.mvc.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.querydsl.core.BooleanBuilder;

import kosta.mvc.domain.Diary;
import kosta.mvc.domain.Place;
import kosta.mvc.domain.Planner;
import kosta.mvc.domain.PlannerPlace;
//import kosta.mvc.domain.QPlanner;
import kosta.mvc.domain.Users;
import kosta.mvc.dto.PlannerPlaceDTO;
import kosta.mvc.repository.DiaryRepository;
import kosta.mvc.repository.PlaceRepository;
import kosta.mvc.repository.PlannerPlaceRepository;
import kosta.mvc.repository.PlannerRepository;
import lombok.RequiredArgsConstructor;


@Service
@Transactional
@RequiredArgsConstructor
public class PlannerServiceImpl implements PlannerService {

	private final PlannerRepository plannerRep;
	private final PlannerPlaceRepository plannerPlaceRep;
	private final PlaceRepository placeRep;
	private final DiaryRepository diaryRep;
	
	
	@Override
	public List<Planner> selectAll(String userId) {
			List<Planner> plist = plannerRep.selectByUserID(userId);
			
			return plist;
	}

	/*@Override
	public PlannerDTO selectBy(Long plannerId) {
		Planner planner = plannerRep.findById(plannerId).orElse(null);
		System.out.println("planner = "+ planner);
		System.out.println("------------------------");
		if(planner==null) throw new RuntimeException("해당 플래너 정보가 없습니다.");
		Users user =  planner.getUser();
		System.out.println(user);
		
		UserDTO userDto = new UserDTO(user.getUserId(), user.getUserName(), user.getUserPassword(), user.getUserPhone());
		PlannerDTO dto=new PlannerDTO(planner.getPlannerId(), userDto,  planner.getPlannerName(), planner.getPlannerType(), planner.getPlannerCount());
		
		return dto;
	}*/
	
	@Override
	public Planner selectBy(Long plannerId) {
		Planner planner = plannerRep.findById(plannerId).orElse(null);
		System.out.println("planner = "+ planner);
		System.out.println("------------------------");
		if(planner==null) throw new RuntimeException("해당 플래너 정보가 없습니다.");
		
		return planner;
	}

	@Override//일자별 플래너 검색
	public Planner selectByDay(Long plannerId, int day) {
		
		
		
		
		return null;
	}
	
	/**플래너 상세 일정 조회*/
	@Override
	public List<PlannerPlaceDTO> selectPlaceByPlanner(Long plannerId) {
		
		Planner dbplanner =plannerRep.findById(plannerId)
				.orElseThrow(()-> new RuntimeException("존재하지 않는 플래너입니다."));

		//PlannerPlaceDTO
		//List<PlannerPlace> list = dbplanner.getPlannerPlaceList();
		List<PlannerPlace> list = plannerPlaceRep.findAllByPlannerIdByPlannerPlaceDateAsc(plannerId);
		List<PlannerPlaceDTO> result = new ArrayList<PlannerPlaceDTO>();
		
		for(PlannerPlace x :list) {
			result.add(new PlannerPlaceDTO(x.getPlannerPlaceId(), x.getUser().getUserId(), x.getPlanner().getPlannerId(), x.getPlannerPlaceDate()
					, x.getPlace().getPlaceId(), x.getPlace().getPlaceCategory(), x.getPlace().getPlaceName(), x.getPlace().getPlaceLatitude(), x.getPlace().getPlaceLongitude()));
		}
		
		return result;
	}
	
	
	@Override
	public void insertPlan(Planner planner) {
		plannerRep.save(planner);
		diaryRep.save(new Diary(null, planner.getUser(), planner, null, planner.getPlannerName(), planner.getPlannerType(), planner.getPlannerCount(),null));
	}

	@Override
	public void insertPlanPlace(PlannerPlace plannerPlace) {
		//담은수 증가
		Place place = placeRep.findById(plannerPlace.getPlace().getPlaceId())
				.orElseThrow( ()-> new RuntimeException("존재하지 않는 장소 정보입니다."));
		place.setPlaceSave(place.getPlaceSave()+1);
		
		plannerPlaceRep.save(plannerPlace);

	}

	@Override
	public void updatePlan(Planner planner) {
		Planner dbPlanner = plannerRep.findById(planner.getPlannerId())
				.orElseThrow( ()-> new RuntimeException("플래너를 찾을 수 없습니다."));

		dbPlanner.setPlannerName(planner.getPlannerName());
		dbPlanner.setPlannerType(planner.getPlannerType());
		dbPlanner.setPlannerCount(planner.getPlannerCount());
		dbPlanner.setPlannerStart(planner.getPlannerStart());
		dbPlanner.setPlannerEnd(planner.getPlannerEnd());
		dbPlanner.setPlannerState(planner.getPlannerState());
	}

	@Override
	public void updatePlanPlace(PlannerPlace PlannerPlace) {
		PlannerPlace dbplan = plannerPlaceRep.findById(PlannerPlace.getPlannerPlaceId())
				.orElseThrow( ()-> new RuntimeException("플래너 일정을 찾을 수 없습니다."));
		dbplan.setPlannerPlaceDate(PlannerPlace.getPlannerPlaceDate());

	}
	
	@Override
	public void deletePlanPlace(Long plannerPlaceId) {
		PlannerPlace dbplan = plannerPlaceRep.findById(plannerPlaceId)
				.orElseThrow( ()-> new RuntimeException("플래너 일정을 찾을 수 없습니다."));
		
		//담은 수 감소
		Place place = placeRep.findById(dbplan.getPlace().getPlaceId())
				.orElseThrow( ()-> new RuntimeException("존재하지 않는 장소 정보입니다."));
		place.setPlaceSave(place.getPlaceSave()-1);
		
		plannerPlaceRep.deleteById(plannerPlaceId);
	}

	@Override
	public void deletePlan(Long plannerId) {
		
		plannerRep.deleteById(plannerId);
		

	}

	@Override
	public void PlannerShareBoard(Long placeId) {
		

		
	}


}
