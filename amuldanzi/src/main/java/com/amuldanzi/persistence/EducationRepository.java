package com.amuldanzi.persistence;

import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.EducationDTO;

public interface EducationRepository extends CrudRepository<EducationDTO, Integer> {

}
