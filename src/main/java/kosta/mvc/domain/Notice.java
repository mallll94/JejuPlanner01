package kosta.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE , generator = "notice_seq" )
	@SequenceGenerator(sequenceName = "notice_seq" , allocationSize = 1 , name="notice_seq" )
	private Long noticeId;
	
	private String noticeTitle;
	
	@Column(length=2000)
	private String noticeContent;
	
	@CreationTimestamp
	@Column(updatable = false)
	private LocalDateTime noticeRegdate;
	
	private String noticeAttach;
	
	@Transient
	private MultipartFile file;
	

}
