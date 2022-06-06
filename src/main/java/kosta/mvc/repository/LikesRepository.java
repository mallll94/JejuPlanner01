package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.Likes;

public interface LikesRepository extends JpaRepository<Likes, Long> {

}
