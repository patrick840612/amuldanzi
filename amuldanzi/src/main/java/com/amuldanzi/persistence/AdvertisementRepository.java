package com.amuldanzi.persistence;

import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.AdvertisementDTO;
import com.amuldanzi.domain.CareDTO;

public interface AdvertisementRepository extends CrudRepository<AdvertisementDTO, Integer> {

}
