package kosta.mvc.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class PlannerPlaceDTO {

	private Long plannerPlaceId; //사용자플래너장소 번호
	private String userId;
	private Long plannerId;  //사용자플래너 번호
	private int plannerPlaceDate; //1DAY ,2DAY....
	
	private Long placeId; //장소데이터 번호
	private String placeCategory;
	private String placeName; //장소데이터 이름
	private String placeLatitude; //위도
	private String placeLongitude; //경도
	
}
