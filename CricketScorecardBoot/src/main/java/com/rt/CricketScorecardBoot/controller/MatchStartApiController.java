package com.rt.CricketScorecardBoot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rt.CricketScorecardBoot.entity.MatchLive;
import com.rt.CricketScorecardBoot.entity.MatchStart;
import com.rt.CricketScorecardBoot.repository.MatchLiveRepo;
import com.rt.CricketScorecardBoot.repository.MatchStartRepo;

@RestController
@RequestMapping("/api/match")
@CrossOrigin(origins = "http://localhost:8182", allowCredentials = "true")

public class MatchStartApiController {

    @Autowired
    private MatchStartRepo startRepo;

    @Autowired
    private MatchLiveRepo liveRepo;

    // ========== START MATCH API ==========
    @PostMapping("/start/{scheduleId}")
    public ResponseEntity<?> startMatch(
            @PathVariable int scheduleId,
            @RequestBody StartMatchDTO dto) {

        // --- Save or Update MatchStart ---
        MatchStart ms = startRepo.findByScheduleId(scheduleId);
        if (ms == null) {
            ms = new MatchStart();
            ms.setScheduleId(scheduleId);
        }

        ms.setTossWinner(dto.getTossWinner());
        ms.setChooseTo(dto.getChooseTo());
        ms.setTotalOvers(dto.getTotalOvers());
        ms.setOversPerBowler(dto.getOversPerBowler());
        startRepo.save(ms);

        // --- Create MatchLive if not exists ---
        MatchLive live = liveRepo.findByScheduleId(scheduleId);
        if (live == null) {
            live = new MatchLive();
            live.setScheduleId(scheduleId);
            live.setRuns(0);
            live.setWickets(0);
            live.setBalls(0);
            live.setStrikerId(dto.getStrikerId());
            live.setNonStrikerId(dto.getNonStrikerId());
            live.setBowlerId(dto.getBowlerId());
            liveRepo.save(live);
        }

        return ResponseEntity.ok(live);
    }
}

