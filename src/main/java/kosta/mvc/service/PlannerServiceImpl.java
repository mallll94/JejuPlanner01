package kosta.mvc.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.querydsl.core.BooleanBuilder;

import kosta.mvc.domain.Place;
import kosta.mvc.domain.Planner;
import kosta.mvc.domain.PlannerPlace;
import kosta.mvc.domain.QPlanner;
import kosta.mvc.domain.QPlannerPlace;
import kosta.mvc.dto.PlannerPlaceDTO;
import kosta.mvc.repository.PlaceRepository;
import kosta.mvc.repository.PlannerPlaceRepository;
import kosta.mvc.repository.PlannerRepository;
import kosta.mvc.util.FileStore;
import lombok.RequiredArgsConstructor;


@Service
@Transactional
@RequiredArgsConstructor
public class PlannerServiceImpl implements PlannerService {

	private final PlannerRepository plannerRep;
	private final PlannerPlaceRepository plannerPlaceRep;
	private final PlaceRepository placeRep;
	private final FileStore fileStore;
	
	
	//private final static String DIARY_DEFAULT_NAME = "제주도";
	
	
	@Override
	public Page<Planner> selectAllByUserIdPageing(Pageable pageable,String userId) {
		//userId별 검색
		QPlanner planner = QPlanner.planner;
		BooleanBuilder builder = new BooleanBuilder();
		builder.and(planner.user.userId.eq(userId));
		//plannerState가 Y 인것만 검색 
		builder.and(planner.plannerState.eq("Y"));

		Page<Planner> plist = plannerRep.findAll(builder,pageable);
		System.out.println("servie :: "+ plist.getSize());
		return plist;
	}
	
	@Override
	public Page<Planner> selectAllDiaryPageing(Pageable pageable, String userId) {
		//userId별 검색
		QPlanner planner = QPlanner.planner;
		BooleanBuilder builder = new BooleanBuilder();
		builder.and(planner.user.userId.eq(userId));
		Page<Planner> plist = plannerRep.findAll(builder,pageable);
		return plist;
	}

	@Override
	public List<PlannerPlace> selectPlaceBy(Long plannerId) {
		QPlannerPlace plannerPlace = QPlannerPlace.plannerPlace;
		BooleanBuilder builder = new BooleanBuilder();
		
		builder.and(plannerPlace.planner.plannerId.eq(plannerId));
		
		List<PlannerPlace> list = (List<PlannerPlace>) plannerPlaceRep.findAll(builder, Sort.by(Sort.Order.asc("plannerPlaceDate")));
		return list;
	}
	@Override
	public Planner selectBy(Long plannerId) {
		//QPlanner planner = QPlanner.planner;
		//BooleanBuilder builder = new BooleanBuilder();
		
		//builder.and(planner.plannerId.eq(plannerId));
		
		
		
		Planner planner = plannerRep.findById(plannerId)
				.orElseThrow(()-> new RuntimeException("존재하지 않는 플래너입니다."));
		System.out.println("planner = "+ planner);
		System.out.println("------------------------");
		
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

		List<PlannerPlace> list = plannerPlaceRep.findAllByPlannerIdByPlannerPlaceDateAsc(dbplanner.getPlannerId());
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
	public PlannerPlace selectPPbyPPId(Long plannerplaceId) {
		PlannerPlace dbPlannerPlace = plannerPlaceRep.findById(plannerplaceId)
				.orElseThrow(()-> new RuntimeException("플래너를 찾을 수 없습니다."));
		return dbPlannerPlace;
	}
	
	@Override
	public void updatePlan(Planner planner) {
		Planner dbPlanner = plannerRep.findById(planner.getPlannerId())
				.orElseThrow( ()-> new RuntimeException("플래너를 찾을 수 없습니다."));
		dbPlanner.setPlannerName(planner.getPlannerName());
	}
	
	@Override
	public void updatePlanStartdateAndEnddate(Planner planner) {
		Planner dbPlanner = plannerRep.findById(planner.getPlannerId())
				.orElseThrow( ()-> new RuntimeException("플래너를 찾을 수 없습니다."));
		dbPlanner.setPlannerStart(planner.getPlannerStart());
		dbPlanner.setPlannerEnd(planner.getPlannerEnd());
		
	}
	
	@Override
	public void deletePlan(Long plannerId) {
		Planner planner =plannerRep.findById(plannerId)
				.orElseThrow(()-> new RuntimeException("존재하지 않는 플래너입니다."));
		planner.setPlannerState("X");
		

	}

	@Override
	public void insertPlanPlace(PlannerPlace plannerPlace) {
		//place 담은수 증가
		Place place = placeRep.findById(plannerPlace.getPlace().getPlaceId())
				.orElseThrow( ()-> new RuntimeException("존재하지 않는 장소 정보입니다."));
		place.setPlaceSave(place.getPlaceSave()+1);

		plannerPlaceRep.save(plannerPlace);
		
	}

	@Override
	public void updatePlanPlace(PlannerPlace plannerPlace) {
		PlannerPlace dbplan = plannerPlaceRep.findById(plannerPlace.getPlannerPlaceId())
				.orElseThrow( ()-> new RuntimeException("플래너 일정을 찾을 수 없습니다."));
		dbplan.setPlannerPlaceDate(plannerPlace.getPlannerPlaceDate());
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
	public void PlannerShareBoard(Long placeId) {
		
		
		
	}

	@Override
	public void plannerTypeUpdate(String type,Long plannerId) {
		Planner planner =plannerRep.findById(plannerId)
				.orElseThrow(()-> new RuntimeException("존재하지 않는 플래너입니다."));
		planner.setPlannerType(type);
		
		System.out.println("성공 "+planner.getPlannerType());
		
	}


	 @Override 
	 public void plannerCountUpdate(int count, Long plannerId) {
		Planner planner =plannerRep.findById(plannerId)
				.orElseThrow(()-> new RuntimeException("존재하지 않는 플래너입니다."));
		planner.setPlannerCount(count);
		System.out.println("확인"+planner.getPlannerCount());
	 }
	 

	 @Override
	public Planner insertDiaryLine(PlannerPlace diaryLine, String uploadPath) {
		 
		 PlannerPlace dbPlannerPlace =plannerPlaceRep.findById(diaryLine.getPlannerPlaceId())
					.orElseThrow(()-> new RuntimeException("존재하지 않는 플래너입니다."));
		 
		 MultipartFile file = diaryLine.getFile();
			if(!file.isEmpty()) {
				if(file.getContentType().startsWith("image")==false) {
					throw new RuntimeException("이미지형식이 아닙니다.");
				}
				try {
					String storeFileName = fileStore.storeFile(uploadPath, file);
					dbPlannerPlace.setDiaryLinePhoto(storeFileName);
				}catch(IOException e) {
					throw new RuntimeException("파일을 업로드 하는 도중 문제가 발생했습니다.",e);
				}
			}
		 
		 dbPlannerPlace.setDiaryLineContent(diaryLine.getDiaryLineContent());
		 dbPlannerPlace.setDiaryLinePrice(diaryLine.getDiaryLinePrice());
		 
		 return dbPlannerPlace.getPlanner();
		
	}
	 @Override
	public Planner updateDiaryLine(PlannerPlace diaryLine, String uploadPath) {
		 PlannerPlace dbPlannerPlace = plannerPlaceRep.findById(diaryLine.getPlannerPlaceId())
					.orElseThrow( ()-> new RuntimeException("플래너 일정을 찾을 수 없습니다."));
		
		//파일이 없다면 null로 입력
		 if(diaryLine.getFile()==null) {
			 dbPlannerPlace.setDiaryLinePhoto(null);
		 }else {
			 MultipartFile file = diaryLine.getFile();
				
			 	//파일이 있다면 예전에 첨부한 파일삭제? 어떻게??
				if(!file.isEmpty()) {
					if(file.getContentType().startsWith("image")==false) {
						throw new RuntimeException("이미지형식이 아닙니다.");
					}
					try {
						String storeFileName = fileStore.storeFile(uploadPath, file);
						dbPlannerPlace.setDiaryLinePhoto(storeFileName);
					}catch(IOException e) {
						throw new RuntimeException("파일을 업로드 하는 도중 문제가 발생했습니다.",e);
					}
				} 
		 }
	
		 dbPlannerPlace.setDiaryLineContent(diaryLine.getDiaryLineContent());
		 dbPlannerPlace.setDiaryLinePrice(diaryLine.getDiaryLinePrice());
		 return dbPlannerPlace.getPlanner();
		
	}
	 
	@Override
	public Planner updateDiaryName(Planner diary) {
		Planner planner =plannerRep.findById(diary.getPlannerId())
				.orElseThrow(()-> new RuntimeException("존재하지 않는 플래너입니다."));
		planner.setDiaryTitle(diary.getDiaryTitle());
		return planner;
	}
	
	@Override
	public Planner updateCountAndType(Planner diary) {
		Planner planner =plannerRep.findById(diary.getPlannerId())
				.orElseThrow(()-> new RuntimeException("존재하지 않는 플래너입니다."));
		if(diary.getPlannerType().equals("none")) {
			planner.setPlannerCount(diary.getPlannerCount());
		}else {
			planner.setPlannerCount(diary.getPlannerCount());
			planner.setPlannerType(diary.getPlannerType());
		}
		return planner;
	}
	 
	 @Override
	public void deleteDiary(Long plannerId) {
		plannerRep.deleteById(plannerId);
		
	}

	@Override
	public List<Planner> selectByUserId(String userId) {
		QPlanner planner = QPlanner.planner;
		BooleanBuilder builder = new BooleanBuilder();
		
		builder.and(planner.user.userId.equalsIgnoreCase(userId));
		List<Planner> list=(List<Planner>) plannerRep.findAll(builder);

		return list;
	}

	
	
}
