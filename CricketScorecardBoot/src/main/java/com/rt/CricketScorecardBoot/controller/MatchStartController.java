package com.rt.CricketScorecardBoot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rt.CricketScorecardBoot.entity.MatchStart;
import com.rt.CricketScorecardBoot.repository.MatchStartRepo;

@RestController
@RequestMapping("/api/startmatch")
@CrossOrigin(origins = "http://localhost:8182")
public class MatchStartController {

    @Autowired
    private MatchStartRepo repo;

    @PostMapping
    public MatchStart save(@RequestBody MatchStart m) {

        // Already exists?
        MatchStart existing = repo.findByScheduleId(m.getScheduleId());

        if (existing != null) {
            // update same row instead of inserting new
            existing.setTossWinner(m.getTossWinner());
            existing.setChooseTo(m.getChooseTo());
            existing.setTournamentId(m.getTournamentId());
            existing.setTotalOvers(m.getTotalOvers());
            existing.setOversPerBowler(m.getOversPerBowler());

            return repo.save(existing);
        }

        // if not exist, create new
        return repo.save(m);
    }

    @GetMapping("/{scheduleId}")
    public MatchStart get(@PathVariable int scheduleId) {
        return repo.findByScheduleId(scheduleId);
    }
}