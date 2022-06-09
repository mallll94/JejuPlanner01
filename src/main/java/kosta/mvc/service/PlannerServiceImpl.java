package kosta.mvc.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.querydsl.core.BooleanBuilder;

import kosta.mvc.domain.Place;
import kosta.mvc.domain.Planner;
import kosta.mvc.domain.PlannerPlace;
import kosta.mvc.domain.QPlanner;
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
		Page<Planner> plist = plannerRep.findAll(builder,pageable);
		System.out.println("servie :: "+ plist.getSize());
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

		//PlannerPlaceDTO
		//List<PlannerPlace> list = dbplanner.getPlannerPlaceList();
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
		//planner insert
		plannerRep.save(planner);

		//diary insert
		/*if(planner.getPlannerName()==null) {
			diaryRep.save(new Diary(null, planner.getUser(), planner, null, DIARY_DEFAULT_NAME, planner.getPlannerType(), planner.getPlannerCount(),null));
		}else {
			diaryRep.save(new Diary(null, planner.getUser(), planner, null, planner.getPlannerName(), planner.getPlannerType(), planner.getPlannerCount(),null));
		}*/
		
		System.out.println("diary save완료");
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

	 }
	 
	 @Override
	public void updateDiary(Planner diary) {
		// TODO Auto-generated method stub
		
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
			System.out.println("service 다이어리 내용 등록");
		 
		 dbPlannerPlace.setDiaryLineContent(diaryLine.getDiaryLineContent());
		 dbPlannerPlace.setDiaryLinePrice(diaryLine.getDiaryLinePrice());
		 
		 return dbPlannerPlace.getPlanner();
		
	}
	 @Override
	public Planner updateDiaryLine(PlannerPlace diaryLine, String uploadPath) {
		 PlannerPlace dbPlannerPlace = plannerPlaceRep.findById(diaryLine.getPlannerPlaceId())
					.orElseThrow( ()-> new RuntimeException("플래너 일정을 찾을 수 없습니다."));
		
		 System.out.println("::파일::"+diaryLine.getFile()+"======");
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
	public Planner DeleteDiaryLine(Long diaryLineId) {
		return null;
		
	}
	 
	 @Override
	public void deleteDiary(Long plannerId) {
		// TODO Auto-generated method stub
		
	}
	
}
