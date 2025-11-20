package com.rt.CricketScorecardBoot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.rt.CricketScorecardBoot.entity.MatchStart;

public interface MatchStartRepo extends JpaRepository<MatchStart, Integer> {

    MatchStart findByScheduleId(int scheduleId);
}
