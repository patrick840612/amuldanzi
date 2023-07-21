package com.amuldanzi.persistence;

import org.springframework.data.repository.CrudRepository;

import com.amuldanzi.domain.AdvertisementDTO;

public interface AdvertisementRepository extends CrudRepository<AdvertisementDTO, Integer> {

}
