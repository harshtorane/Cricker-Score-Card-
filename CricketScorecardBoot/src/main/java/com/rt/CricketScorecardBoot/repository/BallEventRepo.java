package com.rt.CricketScorecardBoot.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import com.rt.CricketScorecardBoot.entity.BallEvent;
import java.util.List;
public interface BallEventRepo extends JpaRepository<BallEvent, Long> {
    List<BallEvent> findByMatchLiveIdOrderByCreatedAtAsc(Long matchLiveId);
}
