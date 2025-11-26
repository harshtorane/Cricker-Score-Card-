package com.rt.CricketScorecardBoot.controller;

import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;

import com.rt.CricketScorecardBoot.entity.MatchLive;
import com.rt.CricketScorecardBoot.service.ScoringService;
import com.rt.CricketScorecardBoot.repository.MatchLiveRepo;

@RestController
@RequestMapping("/api/match")
@CrossOrigin(origins = "*")
public class MatchLiveController {

    private final MatchLiveRepo matchLiveRepo;
    private final ScoringService scoringService;

    public MatchLiveController(MatchLiveRepo matchLiveRepo, ScoringService scoringService){
        this.matchLiveRepo = matchLiveRepo;
        this.scoringService = scoringService;
    }

    // ====================== START MATCH ======================
    @PostMapping("/start/{scheduleId}")
    public ResponseEntity<MatchLive> startMatch(
            @PathVariable int scheduleId,
            @RequestBody MatchLive payload) {

        MatchLive m = matchLiveRepo.findByScheduleId(scheduleId);

        if (m == null) {
            m = new MatchLive();
            m.setScheduleId(scheduleId);
            m.setTeamInning(payload.getTeamInning());
            m.setStrikerId(payload.getStrikerId());
            m.setNonStrikerId(payload.getNonStrikerId());
            m.setBowlerId(payload.getBowlerId());

            matchLiveRepo.save(m);
        }

        return ResponseEntity.ok(m);
    }

    // ====================== BALL EVENT ======================
    @PostMapping("/{matchLiveId}/ball")
    public ResponseEntity<MatchLive> addBall(
            @PathVariable Long matchLiveId,
            @RequestBody BallDto dto) {

        MatchLive m = scoringService.applyBall(
                matchLiveId,
                dto.getBatsmanId(),
                dto.getBowlerId(),
                dto.getType(),
                dto.getRuns()
        );

        return ResponseEntity.ok(m);
    }

    // ====================== FIND MATCH BY SCHEDULE ======================
    @GetMapping("/by-schedule/{scheduleId}")
    public ResponseEntity<MatchLive> getBySchedule(@PathVariable int scheduleId) {
        MatchLive m = matchLiveRepo.findByScheduleId(scheduleId);
        if (m == null) return ResponseEntity.notFound().build();
        return ResponseEntity.ok(m);
    }

    // ====================== DTO CLASS ======================
    public static class BallDto {
        private String type;
        private int runs;
        private Integer batsmanId;
        private Integer bowlerId;

        public BallDto(){}

        public String getType() {
            return type;
        }
        public void setType(String type) {
            this.type = type;
        }

        public int getRuns() {
            return runs;
        }
        public void setRuns(int runs) {
            this.runs = runs;
        }

        public Integer getBatsmanId() {
            return batsmanId;
        }
        public void setBatsmanId(Integer batsmanId) {
            this.batsmanId = batsmanId;
        }

        public Integer getBowlerId() {
            return bowlerId;
        }
        public void setBowlerId(Integer bowlerId) {
            this.bowlerId = bowlerId;
        }
    }
}
