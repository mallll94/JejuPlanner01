package kosta.mvc.dto;

import javax.persistence.Column;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class PlaceDTO {

	private Long placeId; //장소데이터 번호
	private String placeCategory;
	private String placeName;
	private String placeAddr;
	private String placeContent;
	private String placePhoto;
	private String placeUrl;
	private String placeLatitude; //위도
	private String placeLongitude; //경도
	private int placeSave; //담은 개수
	private int day;
}
