package com.rt.CricketScorecardBoot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rt.CricketScorecardBoot.entity.MatchLive;
import com.rt.CricketScorecardBoot.repository.MatchLiveRepo;
import com.rt.CricketScorecardBoot.service.ScoringService;

@RestController
@RequestMapping("/api/match")
@CrossOrigin(origins = "http://localhost:8182", allowCredentials = "true")
public class MatchLiveController {

    @Autowired
    private MatchLiveRepo liveRepo;

    @Autowired
    private ScoringService scoringService;


    @PostMapping("/{matchLiveId}/ball")
    public MatchLive addBall(
            @PathVariable Long matchLiveId,
            @RequestBody BallDto dto) {

        return scoringService.applyBall(
                matchLiveId,
                dto.getBatsmanId(),
                dto.getBowlerId(),
                dto.getType(),
                dto.getRuns()
        );
    }


    @GetMapping("/by-schedule/{scheduleId}")
    public MatchLive getBySchedule(@PathVariable int scheduleId) {
        return liveRepo.findByScheduleId(scheduleId);
    }


    public static class BallDto {

        private String type;
        private int runs;
        private Integer batsmanId;
        private Integer bowlerId;

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
