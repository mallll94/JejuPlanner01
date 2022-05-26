package kosta.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Board {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "board_bno_seq")
	@SequenceGenerator(sequenceName = "board_bno_seq",allocationSize = 1,name="board_bno_seq")
	private Long bno;
	
	@Column(nullable = false)
	private String title;
	private String writer;
	
	@Column(length = 500)
	private String content;
	
	@CreationTimestamp
	private LocalDateTime insertDate;
	
	@UpdateTimestamp
	private LocalDateTime updateDate;
}
