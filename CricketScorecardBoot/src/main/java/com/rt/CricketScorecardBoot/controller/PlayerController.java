package com.rt.CricketScorecardBoot.controller;

import java.util.List;   // ✅ Correct import
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.rt.CricketScorecardBoot.entity.Player;
import com.rt.CricketScorecardBoot.repository.PlayerRepo;


@CrossOrigin(origins = "http://localhost:8182")
@RestController
@RequestMapping("/api")
public class PlayerController {

    @Autowired
    private PlayerRepo playerRepo;

    // ---------- Save Player ----------
    @PostMapping("/player")
    public String savePlayer(@RequestBody Player p) {
        playerRepo.save(p);
        return "Player Added";
    }

    // ---------- Get All Players of Team ----------
    @GetMapping("/player/team/{teamId}")
    public List<Player> getPlayers(@PathVariable int teamId) {
        return playerRepo.findByTeamId(teamId);
    }

    // ---------- Delete Player ----------
    @DeleteMapping("/player/{id}")
    public String deletePlayer(@PathVariable int id) {
        playerRepo.deleteById(id);
        return "Player Deleted";
    }
    @PutMapping("/player/{id}")
    public String updatePlayer(@PathVariable int id, @RequestBody Player p) {

        Player existing = playerRepo.findById(id).orElse(null);
        if(existing == null){
            return "Player Not Found";
        }

        existing.setPlayerName(p.getPlayerName());
        existing.setRole(p.getRole());
        existing.setTeamId(p.getTeamId());

        playerRepo.save(existing);

        return "Player Updated";
    }

}
