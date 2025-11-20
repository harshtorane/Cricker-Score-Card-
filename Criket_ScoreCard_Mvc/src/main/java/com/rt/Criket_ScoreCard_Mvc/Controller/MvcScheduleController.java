package com.rt.Criket_ScoreCard_Mvc.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import com.rt.Criket_ScoreCard_Mvc.Controller.Entity.Schedule;
import com.rt.Criket_ScoreCard_Mvc.Controller.Entity.TournamentEntity;

@Controller
@RequestMapping("/schedule")
public class MvcScheduleController {

    RestTemplate rt = new RestTemplate();

    // ==================== CREATE PAGE ====================
    @GetMapping("/create")
    public String createSchedulePage(@RequestParam int tournamentId, Model model) {

        TournamentEntity tournament = rt.getForObject(
                "http://localhost:8080/api/tournament/" + tournamentId,
                TournamentEntity.class);

        model.addAttribute("tournament", tournament);
        model.addAttribute("tournamentId", tournamentId);

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
