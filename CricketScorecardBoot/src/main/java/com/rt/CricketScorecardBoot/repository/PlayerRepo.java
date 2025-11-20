package com.rt.CricketScorecardBoot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.rt.CricketScorecardBoot.entity.Player;

@Repository
public interface PlayerRepo extends JpaRepository<Player, Integer> {

    // GET all players of specific team
    List<Player> findByTeamId(int teamId);

}
