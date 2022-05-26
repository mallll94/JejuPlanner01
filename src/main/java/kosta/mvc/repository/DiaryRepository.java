package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.Diary;

public interface DiaryRepository extends JpaRepository<Diary, Long> {

}
