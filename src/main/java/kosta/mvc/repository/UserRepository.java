package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.Users;

public interface UserRepository extends JpaRepository<Users, String> {

}
