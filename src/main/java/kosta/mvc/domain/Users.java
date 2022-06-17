package kosta.mvc.domain;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicInsert;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
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
	
	//front에서 회원가입폼에서 유효성체크하는지도 같이 확인하고 설정 넣기
	@Column(nullable = false)
	private String userName;
	@Column(nullable = false)
	private String userPassword;
	private int userPhone;
	
	@Column(unique = true, nullable = false)
	private String userEmail;
	
	@CreationTimestamp
	private LocalDateTime joinDate;
	
	@Column(columnDefinition = "varchar(20) default 'U'")
	private String userState; //U=활성유저, X=비활성,탈퇴유저
	private String userGender;
	
	//NOTNULL 해야함!!!
	@Column(nullable = false)
	private String role;
	
	private String kakaoId;


	
	/**AskBoard*/
	@OneToMany(mappedBy = "user",fetch = FetchType.LAZY, cascade = CascadeType.REMOVE  , orphanRemoval = true)
	@JsonIgnore
	private List<AskBoard> list;
	/**Cart*/
	@OneToMany(mappedBy = "user",fetch = FetchType.LAZY, cascade = CascadeType.REMOVE  , orphanRemoval = true)
	@JsonIgnore
	private List<Cart> cartlist;
	/**ChatBoard*/
	@OneToMany(mappedBy = "receiverUser",fetch = FetchType.LAZY, cascade = CascadeType.REMOVE  , orphanRemoval = true)
	@JsonIgnore
	private List<ChatBoard> receiverChatlist;
	/**ChatBoard*/
	@OneToMany(mappedBy = "senderUser",fetch = FetchType.LAZY, cascade = CascadeType.REMOVE  , orphanRemoval = true)
	@JsonIgnore
	private List<ChatBoard> senderChaelist;
	
	
	/**CrewBoard*/
	@OneToMany(mappedBy = "user",fetch = FetchType.LAZY, cascade = CascadeType.REMOVE  , orphanRemoval = true)
	@JsonIgnore
	private List<CrewBoard> crewBoardlist;
	/**FreeReply*/
	@OneToMany(mappedBy = "user",fetch = FetchType.LAZY, cascade = CascadeType.REMOVE  , orphanRemoval = true)
	@JsonIgnore
	private List<FreeBoard> freeBoardlist;
	/**FreeReply*/
	@OneToMany(mappedBy = "user",fetch = FetchType.LAZY, cascade = CascadeType.REMOVE  , orphanRemoval = true)
	@JsonIgnore
	private List<FreeReply> freeReplylist;

	/**GoodsReply*/
	@OneToMany(mappedBy = "user",fetch = FetchType.LAZY, cascade = CascadeType.REMOVE  , orphanRemoval = true)
	@JsonIgnore
	private List<GoodsReply> goodsReplylist;
	/**Likes*/
	@OneToMany(mappedBy = "user",fetch = FetchType.LAZY, cascade = CascadeType.REMOVE  , orphanRemoval = true)
	@JsonIgnore
	private List<Likes> likeslist;
	/**Orders*/
	@OneToMany(mappedBy = "user",fetch = FetchType.LAZY, cascade = CascadeType.REMOVE  , orphanRemoval = true)
	@JsonIgnore
	private List<Orders> orderslist;

	/**PlanBoard*/
	@OneToMany(mappedBy = "user",fetch = FetchType.LAZY, cascade = CascadeType.REMOVE  , orphanRemoval = true)
	@JsonIgnore
	private List<PlanBoard> planBoardlist;
	
	/**플래너*/
	@OneToMany(mappedBy = "user",fetch = FetchType.LAZY, cascade = CascadeType.REMOVE  , orphanRemoval = true)
	@JsonIgnore
	private List<Planner> plannerlist;
	/**PlannerPlace*/
	@OneToMany(mappedBy = "user",fetch = FetchType.LAZY, cascade = CascadeType.REMOVE  , orphanRemoval = true)
	@JsonIgnore
	private List<PlannerPlace> plannerPlacelist;
	/**PlanReply*/
	@OneToMany(mappedBy = "user",fetch = FetchType.LAZY, cascade = CascadeType.REMOVE  , orphanRemoval = true)
	@JsonIgnore
	private List<PlanReply> planReplylist;
	
	
	
	
}
