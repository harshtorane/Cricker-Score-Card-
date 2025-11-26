package com.rt.CricketScorecardBoot.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.rt.CricketScorecardBoot.entity.Teams;
import com.rt.CricketScorecardBoot.service.TeamService;

@CrossOrigin(origins = "http://localhost:8182")
@RestController
@RequestMapping("/api")
public class TeamController {

    @Autowired
    private TeamService teamService;

    
    @PostMapping("/team")
    public String addTeam(@RequestBody Teams team) {
        teamService.add(team);
        return "Team added successfully";
    }

    
    @GetMapping("/team")
    public List<Teams> getAllTeams() {
        return teamService.selectAll();
    }

    
    @GetMapping("/team/{id}")
    public Optional<Teams> getTeamById(@PathVariable int id) {
        return teamService.SelectId(id);
    }

    
    @PutMapping("/team/{id}")
    public String updateTeam(@PathVariable int id, @RequestBody Teams team) {
        teamService.Update(id, team);
        return "Team updated successfully";
    }

    // ✅ DELETE - Delete team by ID
    @DeleteMapping("/team/{id}")
    public String deleteTeam(@PathVariable int id) {
        teamService.Delete(id);
        return "Team deleted successfully";
    }
    @GetMapping("/team/tournament/{tournamentId}")
    public List<Teams> getTeamsByTournament(@PathVariable int tournamentId) {
        return teamService.getTeamsByTournament(tournamentId);
    }
    @GetMapping("/team/name/{teamName}")
    public Teams getTeamByName(@PathVariable String teamName) {
        return teamService.getTeamByName(teamName);
    }


}
