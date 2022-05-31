package kosta.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.mvc.domain.Planner;
import kosta.mvc.domain.PlannerPlace;
import kosta.mvc.repository.PlannerRepository;

@Service
@Transactional
public class PlannerServiceImpl implements PlannerService {

	@Autowired
	private PlannerRepository plannerRep;
	
	
	@Override
	public List<Planner> selectAll(String userId) {
			List<Planner> plist = plannerRep.selectByUserID(userId);		
			return plist;
	}

	@Override
	public Planner selectBy(Long plannerId) {
		Planner planner = plannerRep.findById(plannerId).orElse(null);
		if(planner==null) throw new RuntimeException("해당 플래너 정보가 없습니다.");
		return planner;
	}

	@Override
	public void insertPlan(Planner planner) {
		// TODO Auto-generated method stub

	}

	@Override
	public void insertPlanPlace(PlannerPlace PlannerPlace) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updatePlan(Planner planner) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updatePlanPlace(PlannerPlace PlannerPlace) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deletePlan(Long plannerId) {
		// TODO Auto-generated method stub

	}

}
