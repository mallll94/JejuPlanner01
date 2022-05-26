package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.Place;

public interface PlaceRepository extends JpaRepository<Place, Long> {

}
