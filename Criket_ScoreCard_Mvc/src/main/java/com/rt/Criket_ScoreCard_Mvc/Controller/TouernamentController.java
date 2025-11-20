package com.rt.Criket_ScoreCard_Mvc.Controller;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import com.rt.CricketScorecardBoot.entity.Schedule;
import com.rt.CricketScorecardBoot.entity.Teams;
import com.rt.Criket_ScoreCard_Mvc.Controller.Entity.Touernament_Entity;
import com.rt.Criket_ScoreCard_Mvc.Controller.Service.CricketService;

@Controller
@RequestMapping("/tournament")
public class TouernamentController {

    @Autowired
    private CricketService cricketService;

    @GetMapping
    public String tournamentPage(Model model) {
        model.addAttribute("tournament", new Touernament_Entity());
        return "Tournament";  
    }

    @PostMapping("/save")
    public String saveTournament(@ModelAttribute("tournament") Touernament_Entity tournament) {
        String response = cricketService.sendTournamentData(tournament);
        if (response != null && response.toLowerCase().contains("success")) {
            return "redirect:/dashboard";
        } else {
            return "Tournament";
        }
    }

    @GetMapping("/dashboard")
    public String tournamentDashboard(Model model) {
        List<Touernament_Entity> tournaments = cricketService.getAllTournaments();
        model.addAttribute("tournaments", tournaments);
        return "Dashboard";
    }

    @GetMapping("/manage")
    public String manageTournament(@RequestParam int id, Model model) {

        Touernament_Entity tournament = cricketService.getTournamentById(id);
        model.addAttribute("tournament", tournament);

        // =============== FETCH SCHEDULE LIST ===============
        RestTemplate rt = new RestTemplate();
        Schedule[] scheduleArr = rt.getForObject(
                "http://localhost:8080/api/schedule/" + id,
                Schedule[].class
        );
        model.addAttribute("scheduleList", scheduleArr);

        // =============== FETCH TEAMS FOR DROPDOWN ===============
        Teams[] allTeams = rt.getForObject(
                "http://localhost:8080/api/team",
                Teams[].class
        );

        List<Teams> filteredTeams = Arrays.stream(allTeams)
                .filter(t -> t.getTournamentId() == id)
                .collect(Collectors.toList());

        model.addAttribute("teams", filteredTeams);  // ******* MOST IMPORTANT *******

        return "TournamentManage";
    }

    @GetMapping("/poster")
    public String generatePoster(@RequestParam int id, Model model) {
        Touernament_Entity tournament = cricketService.getTournamentById(id);
        model.addAttribute("tournament", tournament);
        return "poster";
    }
}
