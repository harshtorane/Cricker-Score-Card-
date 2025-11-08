package com.rt.CricketScorecardBoot.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.rt.CricketScorecardBoot.entity.TournamentEntity;
import com.rt.CricketScorecardBoot.service.TouernamentService;

@CrossOrigin(origins = "http://localhost:8182")
@RestController
@RequestMapping("/api")
public class TouernamentController {

    @Autowired
    TouernamentService touernamentService;

    @PostMapping("/tournament")
    public String addTournament(@RequestBody TournamentEntity td) {
        touernamentService.Name(td);
        return "Data added successfully";
    }

    @GetMapping("/tournament")
    public List<TournamentEntity> selectAllTournaments() {
        return touernamentService.selectAll();
    }

    @GetMapping("/tournament/{id}")
    public Optional<TournamentEntity> selectTournamentById(@PathVariable int id) {
        return touernamentService.selectById(id);
    }

    @PutMapping("/tournament/{id}")
    public String updateTournament(@PathVariable int id, @RequestBody TournamentEntity td) {
        touernamentService.Update(id, td);
        return "Updated successfully";
    }

    @DeleteMapping("/tournament/{id}")
    public String deleteTournament(@PathVariable int id) {
        touernamentService.Delete(id);
        return "Deleted successfully";
    }
}
