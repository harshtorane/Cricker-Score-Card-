package com.rt.Criket_ScoreCard_Mvc.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Score_Card_controller {
    
    @RequestMapping("/")
    public String m1() {
        return "Login";
    }
    
    
    @RequestMapping("/tournament")
    public String tournamentPage() {
        return "Touernament";
    }
    
    
    @RequestMapping("/Dashboard")
    public String dashboardPage() {
        return "Dashboard";
    }
    
    // Login page mapping
    @RequestMapping("/Login")
    public String loginPage() {
        return "Login";
    }
    
  
    @RequestMapping("/Register")
    public String registerPage() {
        return "Register";
    }
    
    
    @RequestMapping("/index")
    public String indexPage() {
        return "index";
    }
    
    
    @RequestMapping("/AddTeam")
    public String addTeamPage() {
        return "AddTeam"; 
    }


    
    
    
    
}