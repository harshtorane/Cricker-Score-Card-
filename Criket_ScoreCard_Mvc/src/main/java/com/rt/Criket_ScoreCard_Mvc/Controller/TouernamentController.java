package com.rt.Criket_ScoreCard_Mvc.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rt.Criket_ScoreCard_Mvc.Controller.Entity.Touernament_Entity;
import com.rt.Criket_ScoreCard_Mvc.Controller.Service.CricketService;

@Controller
@RequestMapping("/tournament")
public class TouernamentController {

    @Autowired
    private CricketService cricketService;

    // 🟢 Tournament Registration Page
    @GetMapping
    public String tournamentPage(Model model) {
        model.addAttribute("tournament", new Touernament_Entity());
        return "Touernament";  // JSP form page
    }

    // 🟢 Save Tournament and Redirect to Dashboard
    @PostMapping("/save")
    public String saveTournament(@ModelAttribute("tournament") Touernament_Entity tournament) {
        String response = cricketService.sendTournamentData(tournament);

        if (response != null && response.toLowerCase().contains("success")) {
            System.out.println("✅ Tournament added successfully!");
            // 👉 Save झाल्यावर direct dashboard वर जा
            return "redirect:/tournament/dashboard";
        } else {
            System.out.println("❌ Failed to add Tournament!");
            return "Touernament";
        }
    }

    // 🟢 Tournament Dashboard Page
    @GetMapping("/dashboard")
    public String tournamentDashboard(Model model) {
        List<Touernament_Entity> tournaments = cricketService.getAllTournaments();
        model.addAttribute("tournaments", tournaments);
        return "Dashboard"; // JSP file name
    }
}
