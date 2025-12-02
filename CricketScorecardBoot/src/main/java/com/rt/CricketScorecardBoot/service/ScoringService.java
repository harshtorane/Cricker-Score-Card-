package com.rt.CricketScorecardBoot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rt.CricketScorecardBoot.entity.MatchLive;
import com.rt.CricketScorecardBoot.repository.MatchLiveRepo;

@Service
public class ScoringService {

    @Autowired
    private MatchLiveRepo liveRepo;

    public MatchLive applyBall(Long matchLiveId, Integer batsmanId, Integer bowlerId, String type, int runs) {

        MatchLive live = liveRepo.findById(matchLiveId)
                .orElseThrow(() -> new RuntimeException("Match Live Not Found"));

        // set last event data
        live.setLastEventType(type);
        live.setLastRuns(runs);

        live.setStrikerId(batsmanId);
        live.setBowlerId(bowlerId);

        switch (type.toLowerCase()) {

            case "run":
                live.setRuns(live.getRuns() + runs);
                live.setBalls(live.getBalls() + 1);
                break;

            case "wicket":
                live.setWickets(live.getWickets() + 1);
                live.setBalls(live.getBalls() + 1);
                break;

            case "wide":
            case "noball":
                live.setRuns(live.getRuns() + runs);
                break;

            case "bye":
            case "lb":
                live.setRuns(live.getRuns() + runs);
                live.setBalls(live.getBalls() + 1);
                break;
        }

        return liveRepo.save(live);
    }
}


