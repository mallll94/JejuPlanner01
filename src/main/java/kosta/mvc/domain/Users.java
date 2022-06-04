package kosta.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicInsert;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@DynamicInsert
@NoArgsConstructor
@AllArgsConstructor
public class Users {

	@Id
	private String userId;
	
	private String userName;
	private String userPassword;
	private int userPhone;
	
	@Column(unique = true)
	private String userEmail;
	
	@CreationTimestamp
	private LocalDateTime joinDate;
	
	@Column(columnDefinition = "varchar(20) default 'U'")
	private String userState; //U=활성유저, X=비활성,탈퇴유저
	private String userGender;
	
	

	
	
	
}
