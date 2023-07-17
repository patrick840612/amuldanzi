package com.amuldanzi.persistence;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.CareDTO;

public interface CareRepository extends JpaRepository<CareDTO, Integer> {

	Optional<CareDTO> findById(Integer careId);

}
