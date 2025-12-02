package com.rt.Criket_ScoreCard_Mvc.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.rt.Criket_ScoreCard_Mvc.Controller.Entity.MatchLive;
import com.rt.Criket_ScoreCard_Mvc.Controller.Entity.MatchStart;
import com.rt.Criket_ScoreCard_Mvc.Controller.Entity.Player;
import com.rt.Criket_ScoreCard_Mvc.Controller.Entity.Schedule;
import com.rt.Criket_ScoreCard_Mvc.Controller.Entity.TeamEntity;

@Controller
public class LiveMatchController {

    RestTemplate rt = new RestTemplate();

    @GetMapping("/match/live")
    public String liveMatchPage(@RequestParam int scheduleId, Model model) {

        // 1️⃣ Load Schedule
        Schedule schedule = rt.getForObject(
            "http://localhost:8080/api/schedule/getById/" + scheduleId,
            Schedule.class);
        model.addAttribute("schedule", schedule);

        // 2️⃣ Load Match Start
        MatchStart matchStart = rt.getForObject(
            "http://localhost:8080/api/startmatch/" + scheduleId,
            MatchStart.class);
        model.addAttribute("matchStart", matchStart);

        int tournamentId = schedule.getTournamentId();

        // 3️⃣ Load Teams
        TeamEntity teamA = rt.getForObject(
            "http://localhost:8080/api/team/name/" + schedule.getTeamA() + "/" + tournamentId,
            TeamEntity.class);

        TeamEntity teamB = rt.getForObject(
            "http://localhost:8080/api/team/name/" + schedule.getTeamB() + "/" + tournamentId,
            TeamEntity.class);

        // 4️⃣ Load Players
        Player[] teamAPlayers = rt.getForObject(
            "http://localhost:8080/api/player/team/" + teamA.getId(),
            Player[].class);

        Player[] teamBPlayers = rt.getForObject(
            "http://localhost:8080/api/player/team/" + teamB.getId(),
            Player[].class);

        model.addAttribute("teamAPlayers", teamAPlayers);
        model.addAttribute("teamBPlayers", teamBPlayers);

        // 5️⃣ Load Live Match State
        MatchLive live = rt.getForObject(
            "http://localhost:8080/api/match/by-schedule/" + scheduleId,
            MatchLive.class);

        // ❗ जर live match नसला तर create करा (safety)
        if (live == null) {
            MatchLive payload = new MatchLive();
            payload.setScheduleId(scheduleId);
            payload.setTeamInning(schedule.getTeamA());
            payload.setStrikerId(teamAPlayers[0].getId());
            payload.setNonStrikerId(teamAPlayers[1].getId());
            payload.setBowlerId(teamBPlayers[0].getId());

            live = rt.postForObject(
                "http://localhost:8080/api/match/start/" + scheduleId,
                payload,
                MatchLive.class
            );
        }

        model.addAttribute("live", live);

        // 6️⃣ Convert IDs → Object
        Player striker = findPlayer(teamAPlayers, live.getStrikerId());
        Player nonStriker = findPlayer(teamAPlayers, live.getNonStrikerId());
        Player bowler = findPlayer(teamBPlayers, live.getBowlerId());

        // ❗ जर null असेल तर fallback द्या
        if (striker == null) striker = teamAPlayers[0];
        if (nonStriker == null) nonStriker = teamAPlayers[1];
        if (bowler == null) bowler = teamBPlayers[0];

        model.addAttribute("striker", striker);
        model.addAttribute("nonStriker", nonStriker);
        model.addAttribute("bowler", bowler);

        return "LiveMatch";
    }

    private Player findPlayer(Player[] players, Integer id) {
        if (id == null) return null;

        for (Player p : players) {
            if (p.getId() == id) return p;
        }
        return null;
    }
}
