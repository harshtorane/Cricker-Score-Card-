package com.rt.CricketScorecardBoot.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.rt.CricketScorecardBoot.entity.Schedule;

public interface ScheduleRepo extends JpaRepository<Schedule, Integer> {

    List<Schedule> findByTournamentId(int tournamentId);
}
