package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mvc.domain.Planner;
import kosta.mvc.domain.PlannerPlace;
import kosta.mvc.repository.PlannerRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class PlannerServiceImpl implements PlannerService {

	private final PlannerRepository plannerRep;
	
	@Override
	public List<Planner> selectAll(String userId) {
		List<Planner> plist = plannerRep.selectByUserID(userId);
		return plist;
	}

	@Override
	public Planner selectBy(Long plannerId) {
		// TODO Auto-generated method stub
		return null;
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
