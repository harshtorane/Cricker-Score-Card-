package com.rt.CricketScorecardBoot.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import com.rt.CricketScorecardBoot.entity.MatchLive;
public interface MatchLiveRepo extends JpaRepository<MatchLive, Long> {
    MatchLive findByScheduleId(Integer scheduleId);
}
