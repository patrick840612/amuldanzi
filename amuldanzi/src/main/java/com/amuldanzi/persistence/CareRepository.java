package com.amuldanzi.persistence;

import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.CareDTO;

public interface CareRepository extends CrudRepository<CareDTO, Integer> {

}
