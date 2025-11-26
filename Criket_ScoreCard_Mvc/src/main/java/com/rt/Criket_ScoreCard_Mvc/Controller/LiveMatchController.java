package com.rt.Criket_ScoreCard_Mvc.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.rt.Criket_ScoreCard_Mvc.Controller.Entity.MatchStart;
import com.rt.Criket_ScoreCard_Mvc.Controller.Entity.Player;
import com.rt.Criket_ScoreCard_Mvc.Controller.Entity.Schedule;
import com.rt.Criket_ScoreCard_Mvc.Controller.Entity.TeamEntity;

import java.util.ArrayList;
import java.util.List;

@Controller
public class LiveMatchController {

    RestTemplate rt = new RestTemplate();

    @GetMapping("/match/live")
    public String liveMatchPage(@RequestParam int scheduleId, Model model) {

        // 1️⃣ Load Schedule
        Schedule schedule = rt.getForObject(
                "http://localhost:8080/api/schedule/getById/" + scheduleId,
                Schedule.class);

        if (schedule == null) {
            model.addAttribute("error", "Schedule not found!");
            return "LiveMatch";
        }
        model.addAttribute("schedule", schedule);

        int tournamentId = schedule.getTournamentId();

        // 2️⃣ Load Match Start / Toss Details
        MatchStart match = rt.getForObject(
                "http://localhost:8080/api/startmatch/" + scheduleId,
                MatchStart.class);

        if (match == null) match = new MatchStart();
        model.addAttribute("match", match);

        // 3️⃣ Team A Entity
        TeamEntity teamA = rt.getForObject(
                "http://localhost:8080/api/team/name/" + schedule.getTeamA() + "/" + tournamentId,
                TeamEntity.class);

        // 4️⃣ Team B Entity
        TeamEntity teamB = rt.getForObject(
                "http://localhost:8080/api/team/name/" + schedule.getTeamB() + "/" + tournamentId,
                TeamEntity.class);

        if (teamA == null || teamB == null) {
            model.addAttribute("error", "Teams not found!");
            return "LiveMatch";
        }

        // 5️⃣ Load All Players of Team A (BATSMEN + BOWLERS + ALLROUNDERS)
        Player[] teamAPlayers = rt.getForObject(
                "http://localhost:8080/api/player/team/" + teamA.getId(),
                Player[].class);

        // 6️⃣ Load All Players of Team B
        Player[] teamBPlayers = rt.getForObject(
                "http://localhost:8080/api/player/team/" + teamB.getId(),
                Player[].class);

        // 7️⃣ Team A → ALL PLAYERS (Striker + Non-Striker)
        model.addAttribute("teamAPlayers", teamAPlayers);

        // 8️⃣ Team B → ONLY BOWLERS FOR BOWLING
        List<Player> bowlers = new ArrayList<>();
        for (Player p : teamBPlayers) {
            if (!p.getRole().equalsIgnoreCase("batsman")) {
                bowlers.add(p);
            }
        }
        model.addAttribute("teamBPlayers", bowlers);

        return "LiveMatch";
    }
}
