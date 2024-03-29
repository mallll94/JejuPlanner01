package kosta.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "goodsreply")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class GoodsReply{
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "goods_reply_seq")
	@SequenceGenerator(sequenceName = "goods_reply_seq", allocationSize = 1, name = "goods_reply_seq")
	private Long goodsReplyId; //상품후기번호
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "goods_fk")
	@JsonIgnore
	private Goods goods; //상품번호
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_fk")
	@JsonIgnore
	private Users user;
	
	@Column(length = 2000)
	private String goodsReplyContent;
	
	private String goodsReplyPhoto;
	private int goodsReplyStart; //별점
	

	@Transient
	private MultipartFile file;
	
	@CreationTimestamp
	private LocalDateTime goodsReplyRegdate;
	
    

}
