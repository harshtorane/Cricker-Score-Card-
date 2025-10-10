package com.rt.Criket_ScoreCard_Mvc.Controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    @GetMapping("/dashboard")
    public String showDashboard(HttpSession session, Model model) {
        String userName = (String) session.getAttribute("loggedInUser");

        if (userName == null) {
            return "redirect:/login";
        }

        model.addAttribute("userName", userName);
        return "Dashboard"; // Dashboard.jsp
    }
}
