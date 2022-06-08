package kosta.mvc.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.Place;
import kosta.mvc.domain.Users;

public interface UserRepository extends JpaRepository<Users, String>/* , QuerydslPredicateExecutor<Users> */ {

	@Query("select u from Users u where u.userId =?1")
	Users selectUsersById(String id);
}
