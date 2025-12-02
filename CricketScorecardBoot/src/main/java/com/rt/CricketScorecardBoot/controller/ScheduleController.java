package com.rt.CricketScorecardBoot.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.rt.CricketScorecardBoot.entity.Schedule;
import com.rt.CricketScorecardBoot.repository.ScheduleRepo;

@RestController
@RequestMapping("/api/schedule")
@CrossOrigin(origins = "http://localhost:8182")
public class ScheduleController {

    @Autowired
    private ScheduleRepo repo;

   
    @PostMapping
    public String save(@RequestBody Schedule s) {
        repo.save(s);
        return "Schedule Saved";
    }

    
    @GetMapping("/{tournamentId}")
    public List<Schedule> get(@PathVariable int tournamentId) {
        return repo.findByTournamentId(tournamentId);
    }

    @DeleteMapping("/{id}")
    public String delete(@PathVariable int id) {
        repo.deleteById(id);
        return "Deleted";
    }

    
    @PutMapping("/{id}")
    public String update(@PathVariable int id, @RequestBody Schedule newData) {

        Schedule old = repo.findById(id).orElse(null);

        if (old == null) {
            return "Schedule Not Found";
        }

        old.setMatchTitle(newData.getMatchTitle());
        old.setGround(newData.getGround());
        old.setMatchDate(newData.getMatchDate());
        old.setMatchTime(newData.getMatchTime());
        old.setTeamA(newData.getTeamA());
        old.setTeamB(newData.getTeamB());

        repo.save(old);

        return "Updated Successfully";
    }

    @GetMapping("/getById/{id}")
    public Schedule getById(@PathVariable int id) {
        return repo.findById(id).orElse(null);
    }

}
