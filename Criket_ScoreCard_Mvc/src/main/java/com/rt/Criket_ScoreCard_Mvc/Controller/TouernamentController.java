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


    @GetMapping
    public String tournamentPage(Model model) {
        model.addAttribute("Tournament", new Touernament_Entity());
        return "Tournament";  
    }

    
    @PostMapping("/save")
    public String saveTournament(@ModelAttribute("tournament") Touernament_Entity tournament) {
        String response = cricketService.sendTournamentData(tournament);

        if (response != null && response.toLowerCase().contains("success")) {
            System.out.println("✅ Tournament added successfully!");
           
            return "redirect:/Tournament/dashboard";
        } else {
            System.out.println("❌ Failed to add Tournament!");
            return "Tournament";
        }
    }

    
    @GetMapping("/dashboard")
    public String tournamentDashboard(Model model) {
        List<Touernament_Entity> Tournament = cricketService.getAllTournaments();
        model.addAttribute("Tournament", Tournament);
        return "Dashboard"; 
    }
}
