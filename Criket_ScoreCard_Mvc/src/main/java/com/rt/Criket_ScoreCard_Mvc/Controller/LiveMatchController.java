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

@Controller
public class LiveMatchController {

    RestTemplate rt = new RestTemplate();

    @GetMapping("/match/live")
    public String liveMatchPage(@RequestParam int scheduleId, Model model) {

        // 1️⃣ Get Schedule
        Schedule schedule = rt.getForObject(
                "http://localhost:8080/api/schedule/getById/" + scheduleId,
                Schedule.class);

        if (schedule == null) {
            model.addAttribute("error", "Schedule not found!");
            return "LiveMatch";
        }

        model.addAttribute("schedule", schedule);

        // 2️⃣ Toss & Match Start Details
        MatchStart match = rt.getForObject(
                "http://localhost:8080/api/startmatch/" + scheduleId,
                MatchStart.class);

        if (match == null) {
            match = new MatchStart(); // avoid null pointer
        }

        model.addAttribute("match", match);

        // 3️⃣ Team Details (by team name)
        TeamEntity teamA = rt.getForObject(
                "http://localhost:8080/api/team/name/" + schedule.getTeamA(),
                TeamEntity.class);

        TeamEntity teamB = rt.getForObject(
                "http://localhost:8080/api/team/name/" + schedule.getTeamB(),
                TeamEntity.class);

        if (teamA == null || teamB == null) {
            model.addAttribute("error", "Teams not found!");
            return "LiveMatch";
        }

        int teamAId = teamA.getId();
        int teamBId = teamB.getId();

        // 4️⃣ Get Players of Both Teams
        Player[] teamAPlayers = rt.getForObject(
                "http://localhost:8080/api/player/team/" + teamAId,
                Player[].class);

        Player[] teamBPlayers = rt.getForObject(
                "http://localhost:8080/api/player/team/" + teamBId,
                Player[].class);

        model.addAttribute("teamAPlayers", teamAPlayers);
        model.addAttribute("teamBPlayers", teamBPlayers);

        return "LiveMatch";
    }
}
