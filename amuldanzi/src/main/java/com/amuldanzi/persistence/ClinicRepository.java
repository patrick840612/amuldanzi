package com.amuldanzi.persistence;

import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.ClinicDTO;

public interface ClinicRepository extends CrudRepository<ClinicDTO, Integer> {

}
