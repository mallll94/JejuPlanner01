package kosta.mvc.domain;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "timedeal")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class TimeDeal {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "time_deal_seq")
	@SequenceGenerator(sequenceName = "time_deal_seq", allocationSize = 1, name = "time_deal_seq")
	@NonNull
	private Long timeDealId; //핫딜번호
	
	private String timeDealName;
	private int timeDealPrice;
	private int DiscountPrice; //할인가
	private int timeDealAmount;
	
	@Column(length = 2000)
	private String timeDealContent;
	
	private String timeDealPhoto;
	private LocalDate UseStartDate; //사용가능한 시작일
	private LocalDate UseEndDate; //사용가능한 마지막일 
	private String timeDealAddr;

}
