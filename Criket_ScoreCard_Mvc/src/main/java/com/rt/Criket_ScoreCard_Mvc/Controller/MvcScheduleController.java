package com.rt.Criket_ScoreCard_Mvc.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import com.rt.Criket_ScoreCard_Mvc.Controller.Entity.Schedule;
import com.rt.Criket_ScoreCard_Mvc.Controller.Entity.TeamEntity;
import com.rt.Criket_ScoreCard_Mvc.Controller.Entity.TournamentEntity;

@Controller
@RequestMapping("/schedule")
public class MvcScheduleController {

    RestTemplate rt = new RestTemplate();

    // ==================== CREATE PAGE ====================
    @GetMapping("/create")
    public String createSchedulePage(@RequestParam int tournamentId, Model model) {

        // Tournament
        TournamentEntity tournament = rt.getForObject(
                "http://localhost:8080/api/tournament/" + tournamentId,
                TournamentEntity.class);

        model.addAttribute("tournament", tournament);
        model.addAttribute("tournamentId", tournamentId);

        // FETCH TEAMS
        TeamEntity[] teams = rt.getForObject(
                "http://localhost:8080/api/team/tournament/" + tournamentId,
                TeamEntity[].class);

        // ===================== DEBUG PRINT =====================
        System.out.println("======================================");
        System.out.println(" TEAM API DEBUG - tournamentId = " + tournamentId);
        System.out.println("======================================");

        if (teams == null) {
            System.out.println("⚠ TEAMS ARRAY IS NULL (RestTemplate failed)");
        } else if (teams.length == 0) {
            System.out.println("⚠ TEAMS ARRAY IS EMPTY (0 records)");
        } else {
            System.out.println("✔ Teams received: " + teams.length);
            for (TeamEntity t : teams) {
                System.out.println(" - " + t.getId() + " | " + t.getTeamName());
            }
        }

        System.out.println("======================================");
        // ======================================================

        model.addAttribute("teams", teams);

        return "CreateSchedule";
    }




    // ==================== SAVE ====================
    @PostMapping("/save")
    public String saveSchedule(
            @RequestParam int tournamentId,
            @RequestParam String matchTitle,
            @RequestParam String ground,
            @RequestParam String matchDate,
            @RequestParam String matchTime,
            @RequestParam String teamA,
            @RequestParam String teamB) {

        Schedule s = new Schedule();
        s.setTournamentId(tournamentId);
        s.setMatchTitle(matchTitle);
        s.setGround(ground);
        s.setMatchDate(matchDate);
        s.setMatchTime(matchTime);
        s.setTeamA(teamA);
        s.setTeamB(teamB);

        rt.postForObject("http://localhost:8080/api/schedule", s, String.class);

        return "redirect:/tournament/manage?id=" + tournamentId;
    }

    // ==================== DELETE ====================
    @GetMapping("/delete")
    public String delete(@RequestParam int id,
                         @RequestParam int tournamentId) {

        rt.delete("http://localhost:8080/api/schedule/" + id);

        return "redirect:/tournament/manage?id=" + tournamentId;
    }

    // ==================== UPDATE (POPUP EDIT) ====================
    @PostMapping("/update")
    public String updateSchedule(
            @RequestParam int id,
            @RequestParam int tournamentId,
            @RequestParam String matchTitle,
            @RequestParam String ground,
            @RequestParam String matchDate,
            @RequestParam String matchTime,
            @RequestParam String teamA,
            @RequestParam String teamB) {

        Schedule s = new Schedule();
        s.setMatchTitle(matchTitle);
        s.setGround(ground);
        s.setMatchDate(matchDate);
        s.setMatchTime(matchTime);
        s.setTeamA(teamA);
        s.setTeamB(teamB);

        rt.put("http://localhost:8080/api/schedule/" + id, s);

        return "redirect:/tournament/manage?id=" + tournamentId;
    }
}
