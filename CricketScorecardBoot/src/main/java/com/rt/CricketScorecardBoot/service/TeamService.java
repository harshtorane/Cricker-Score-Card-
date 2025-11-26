package com.rt.CricketScorecardBoot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rt.CricketScorecardBoot.entity.Teams;
import com.rt.CricketScorecardBoot.repository.TeamRepo;

@Service
public class TeamService {

    @Autowired
    private TeamRepo repo;

    // Save
    public void add(Teams t) {
        repo.save(t);
    }

    // Get All
    public List<Teams> selectAll() {
        return repo.findAll();
    }

    // Get by Id
    public Teams SelectId(int id) {
        return repo.findById(id).orElse(null);
    }

    // Update
    public void Update(int id, Teams data) {
        Teams t = repo.findById(id).orElse(null);
        if (t != null) {
            t.setTeamName(data.getTeamName());
            t.setCaptainName(data.getCaptainName());
            t.setMonumber(data.getMonumber());
            repo.save(t);
        }
    }

    // Delete
    public void Delete(int id) {
        repo.deleteById(id);
    }

    // Get teams by tournament
    public List<Teams> getTeamsByTournament(int tid) {
        return repo.findByTournamentId(tid);
    }

    //  *** NEW FIXED METHOD ***
    public Teams getTeamByNameAndTournament(String teamName, int tournamentId) {
        return repo.findByTeamNameAndTournamentId(teamName, tournamentId);
    }
}
