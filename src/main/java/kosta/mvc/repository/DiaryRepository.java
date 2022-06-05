package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.mvc.domain.Diary;

public interface DiaryRepository extends JpaRepository<Diary, Long> {

	/**userId에 해당하는 다이어리 검색*/
	@Query("select d from Diary d where d.user.userId= ?1 order by d.diaryId asc")
	List<Diary> findByUserId(String userId);
	
}
