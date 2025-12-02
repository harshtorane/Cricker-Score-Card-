
package com.rt.CricketScorecardBoot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
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
        MatchStart existing = repo.findByScheduleId(m.getScheduleId());
        if (existing != null) {
            existing.setTossWinner(m.getTossWinner());
            existing.setChooseTo(m.getChooseTo());
            existing.setTournamentId(m.getTournamentId());
            existing.setTotalOvers(m.getTotalOvers());
            existing.setOversPerBowler(m.getOversPerBowler());
            return repo.save(existing);
        }
        return repo.save(m);
    }

    @GetMapping("/{scheduleId}")
    public MatchStart get(@PathVariable int scheduleId) {
        return repo.findByScheduleId(scheduleId);
    }
}
