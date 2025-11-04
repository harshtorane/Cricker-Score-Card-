package com.rt.Criket_ScoreCard_Mvc.Controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class DashboardController {

    @GetMapping("/dashboard")
    public String showDashboard(HttpSession session, Model model) {
        String userName = (String) session.getAttribute("loggedInUser");

        if (userName == null) {
            return "redirect:/login";
        }

        model.addAttribute("userName", userName); 
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
    public String Home() {
    	return "Dashboard";
    }
    
}
