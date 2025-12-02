package com.rt.Criket_ScoreCard_Mvc.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import com.rt.Criket_ScoreCard_Mvc.Controller.Entity.MatchStart;
import com.rt.Criket_ScoreCard_Mvc.Controller.Entity.Player;
import com.rt.Criket_ScoreCard_Mvc.Controller.Entity.Schedule;
import com.rt.Criket_ScoreCard_Mvc.Controller.Entity.TeamEntity;
import com.rt.Criket_ScoreCard_Mvc.Controller.Entity.MatchLive;

@Controller
public class MvcMatchController {

    RestTemplate rt = new RestTemplate();

    // STEP 1 → Load StartMatch.jsp
    @GetMapping("/match/start")
    public String startMatchPage(@RequestParam int id,
                                 @RequestParam int tournamentId,
                                 Model model) {

        Schedule schedule = rt.getForObject(
                "http://localhost:8080/api/schedule/getById/" + id,
                Schedule.class);

        model.addAttribute("schedule", schedule);
        model.addAttribute("scheduleId", id);
        model.addAttribute("tournamentId", tournamentId);

        return "StartMatch";
    }

    // STEP 2 → Save StartMatch + Go to SelectPlayers.jsp
    @PostMapping("/match/start/save")
    public String saveStartMatch(MatchStart ms, Model model) {

        // Save start match in Boot
        rt.postForObject(
                "http://localhost:8080/api/startmatch",
                ms,
                MatchStart.class);

        // Load schedule
        Schedule schedule = rt.getForObject(
                "http://localhost:8080/api/schedule/getById/" + ms.getScheduleId(),
                Schedule.class);

        int tournamentId = schedule.getTournamentId();

        // Load teams
        TeamEntity teamA = rt.getForObject(
                "http://localhost:8080/api/team/name/" + schedule.getTeamA() + "/" + tournamentId,
                TeamEntity.class);

        TeamEntity teamB = rt.getForObject(
                "http://localhost:8080/api/team/name/" + schedule.getTeamB() + "/" + tournamentId,
                TeamEntity.class);

        // Load players
        Player[] teamAPlayers = rt.getForObject(
                "http://localhost:8080/api/player/team/" + teamA.getId(),
                Player[].class);

        Player[] teamBPlayers = rt.getForObject(
                "http://localhost:8080/api/player/team/" + teamB.getId(),
                Player[].class);

        model.addAttribute("schedule", schedule);
        model.addAttribute("teamAPlayers", teamAPlayers);
        model.addAttribute("teamBPlayers", teamBPlayers);
        model.addAttribute("scheduleId", ms.getScheduleId());

        return "SelectPlayers";
    }

    // STEP 3 → After selecting striker/non-striker/bowler → CALL NEW API
    @PostMapping("/match/selectplayers/save")
    public String savePlayers(
            @RequestParam int scheduleId,
            @RequestParam int strikerId,
            @RequestParam int nonStrikerId,
            @RequestParam int bowlerId,
            Model model) {

        // Prepare payload
        StartMatchDTO dto = new StartMatchDTO();
        dto.setStrikerId(strikerId);
        dto.setNonStrikerId(nonStrikerId);
        dto.setBowlerId(bowlerId);

        // We don’t set toss here again → already saved in Step2
        dto.setTotalOvers(0);
        dto.setOversPerBowler(0);

        // ******** IMPORTANT ********
        // Hit NEW API → /api/match/start/{scheduleId}
        rt.postForObject(
                "http://localhost:8080/api/match/start/" + scheduleId,
                dto,
                MatchLive.class
        );

        return "redirect:/match/live?scheduleId=" + scheduleId;
    }

    // DTO used for Boot API
    public static class StartMatchDTO {
        private int strikerId;
        private int nonStrikerId;
        private int bowlerId;
        private String tossWinner;
        private String chooseTo;
        private int totalOvers;
        private int oversPerBowler;

        public int getStrikerId() { return strikerId; }
        public void setStrikerId(int strikerId) { this.strikerId = strikerId; }

        public int getNonStrikerId() { return nonStrikerId; }
        public void setNonStrikerId(int nonStrikerId) { this.nonStrikerId = nonStrikerId; }

        public int getBowlerId() { return bowlerId; }
        public void setBowlerId(int bowlerId) { this.bowlerId = bowlerId; }

        public String getTossWinner() { return tossWinner; }
        public void setTossWinner(String tossWinner) { this.tossWinner = tossWinner; }

        public String getChooseTo() { return chooseTo; }
        public void setChooseTo(String chooseTo) { this.chooseTo = chooseTo; }

        public int getTotalOvers() { return totalOvers; }
        public void setTotalOvers(int totalOvers) { this.totalOvers = totalOvers; }

        public int getOversPerBowler() { return oversPerBowler; }
        public void setOversPerBowler(int oversPerBowler) { this.oversPerBowler = oversPerBowler; }
    }
}
