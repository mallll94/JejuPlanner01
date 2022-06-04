package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mvc.domain.PlanBoard;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class PlanBoardServiceImpl implements PlanBoardService {

	@Override
	public List<PlanBoard> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PlanBoard selectById(Long pboardId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PlanBoard> selectByUserId(Long userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertPlanBoard(PlanBoard board) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updatePlanBoard(PlanBoard board) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deletePlanBoard(Long pboardId) {
		// TODO Auto-generated method stub

	}

}
