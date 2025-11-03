package com.rt.CricketScorecardBoot.repository;

import org.hibernate.type.descriptor.converter.spi.JpaAttributeConverter;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.rt.CricketScorecardBoot.entity.TournamentEntity;


@Repository
public interface TouernamentRepostry extends JpaRepository<TournamentEntity , Integer>{


}
