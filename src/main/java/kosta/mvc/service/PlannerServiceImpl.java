package kosta.mvc.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.querydsl.core.BooleanBuilder;

import kosta.mvc.domain.Planner;
import kosta.mvc.domain.PlannerPlace;
//import kosta.mvc.domain.QPlanner;
import kosta.mvc.domain.Users;
import kosta.mvc.dto.PlannerPlaceDTO;
import kosta.mvc.repository.PlannerPlaceRepository;
import kosta.mvc.repository.PlannerRepository;


@Service
@Transactional
public class PlannerServiceImpl implements PlannerService {

	@Autowired
	private PlannerRepository plannerRep;
	@Autowired
	private PlannerPlaceRepository plannerPlaceRep;
	
	
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
	
	/**카테고리별 플래너 일정 검색*/
	@Override
	public List<PlannerPlaceDTO> selectPlaceByPlanner(List<PlannerPlace> list) {
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
	}

	@Override
	public void insertPlanPlace(PlannerPlace plannerPlace) {
		plannerPlaceRep.save(plannerPlace);

	}

	@Override
	public void updatePlan(Planner planner) {
		Planner dbPlanner = plannerRep.findById(planner.getPlannerId()).orElse(null);

		dbPlanner.setPlannerName(planner.getPlannerName());
		dbPlanner.setPlannerType(planner.getPlannerType());
		dbPlanner.setPlannerCount(planner.getPlannerCount());
		dbPlanner.setPlannerStart(planner.getPlannerStart());
		dbPlanner.setPlannerEnd(planner.getPlannerEnd());
		dbPlanner.setPlannerState(planner.getPlannerState());
	}

	@Override
	public void updatePlanPlace(PlannerPlace PlannerPlace) {
		PlannerPlace dbplan = plannerPlaceRep.findById(PlannerPlace.getPlannerPlaceId()).orElse(null);
		dbplan.setPlannerPlaceDate(PlannerPlace.getPlannerPlaceDate());

	}
	
	@Override
	public void deletePlanPlace(Long plannerPlaceId) {
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
