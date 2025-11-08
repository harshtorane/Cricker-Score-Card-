package com.rt.Criket_ScoreCard_Mvc.Controller;

import com.rt.Criket_ScoreCard_Mvc.Controller.Entity.Touernament_Entity;
import com.rt.Criket_ScoreCard_Mvc.Controller.Service.CricketService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
public class DashboardController {

    @Autowired
    private CricketService cricketService;

    @GetMapping("/dashboard")
    public String showDashboard(HttpSession session, Model model) {
        String userName = (String) session.getAttribute("loggedInUser");

        if (userName == null) {
            return "redirect:/login";
        }

        // ✅ Tournament data fetch करा
        List<Touernament_Entity> tournaments = cricketService.getAllTournaments();

        // ✅ Current date आणि time format करा
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("EEEE, dd MMM yyyy");
        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("hh:mm a");

        String currentDate = now.format(dateFormatter);
        String currentTime = now.format(timeFormatter);

        
        model.addAttribute("userName", userName);
        model.addAttribute("tournaments", tournaments);
        model.addAttribute("currentDate", currentDate);
        model.addAttribute("currentTime", currentTime);

        return "Dashboard";
    }

    @ModelAttribute
    public void globalUserName(HttpSession session, Model model) {
        String userName = (String) session.getAttribute("loggedInUser");
        if (userName != null) {
            model.addAttribute("userName", userName);
        }
    }

    @GetMapping("/home")
    public String homeRedirect() {
        return "redirect:/dashboard";
    }
}
