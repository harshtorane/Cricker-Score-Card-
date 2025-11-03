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
        List<Touernament_Entity> tournaments = cricketService.getAllTournaments();
        model.addAttribute("tournaments", tournaments);
        model.addAttribute("tournament", new Touernament_Entity());
        return "Touernament";
    }

   
    @PostMapping("/save")
    public String saveTournament(@ModelAttribute("tournament") Touernament_Entity tournament, Model model) {
        String response = cricketService.sendTournamentData(tournament);

        if (response != null && response.toLowerCase().contains("success")) {
            model.addAttribute("message", "✅ Tournament added successfully!");
        } else {
            model.addAttribute("message", "❌ Failed to add Tournament. Try again!");
        }

        
        List<Touernament_Entity> tournaments = cricketService.getAllTournaments();
        model.addAttribute("tournaments", tournaments);

      
        return "Touernament";
    }
}
