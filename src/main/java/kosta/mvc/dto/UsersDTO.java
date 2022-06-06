package kosta.mvc.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class UsersDTO {

	private String userId;
	private String userName;
	private String userPassword;
	private int userPhone;
	private String userEmail;
	private LocalDateTime joinDate;
	private String userState; //U=활성유저, X=비활성,탈퇴유저
	private String userGender;
	private String role;
}
