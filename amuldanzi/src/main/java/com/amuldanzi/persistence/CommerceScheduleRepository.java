package com.amuldanzi.persistence;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.amuldanzi.domain.AdvertisementDTO;
import com.amuldanzi.domain.CommerceScheduleDTO;

public interface CommerceScheduleRepository extends CrudRepository<CommerceScheduleDTO, Integer> {

}
