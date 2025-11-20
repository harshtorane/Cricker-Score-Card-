package com.rt.Criket_ScoreCard_Mvc.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.rt.CricketScorecardBoot.entity.Teams;
import com.rt.Criket_ScoreCard_Mvc.Controller.Entity.MatchStart;
import com.rt.Criket_ScoreCard_Mvc.Controller.Entity.Schedule;

@Controller
public class MvcMatchController {

    RestTemplate rt = new RestTemplate();

    // LOAD START MATCH PAGE
    @GetMapping("/match/start")
    public String startMatchPage(@RequestParam int id,   // scheduleId
                                 @RequestParam int tournamentId,
                                 Model model) {

        // Get schedule
        Schedule schedule = rt.getForObject(
                "http://localhost:8080/api/schedule/" + tournamentId,
                Schedule[].class)[0];

        // Get all teams
        Teams[] teams = rt.getForObject(
                "http://localhost:8080/api/team",
                Teams[].class);

        model.addAttribute("scheduleId", id);
        model.addAttribute("tournamentId", tournamentId);
        model.addAttribute("teams", teams);
        model.addAttribute("schedule", schedule);

        return "StartMatch";   // JSP
    }

    // SUBMIT MATCH START DATA
    @PostMapping("/match/start/save")
    public String saveMatchStart(MatchStart ms) {

        rt.postForObject("http://localhost:8080/api/match/start", ms, String.class);

        return "redirect:/match/live?scheduleId=" + ms.getScheduleId();
    }
}
