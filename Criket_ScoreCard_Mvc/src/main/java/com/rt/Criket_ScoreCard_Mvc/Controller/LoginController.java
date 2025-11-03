package com.rt.Criket_ScoreCard_Mvc.Controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {

    private final RestTemplate restTemplate = new RestTemplate();
    private static final String BOOT_URL = "http://localhost:8080";

    @GetMapping("/login")
    public String showLoginPage() {
        return "Login";
    }

    @PostMapping("/login")
    public String doLogin(@RequestParam String name,
                          @RequestParam String password,
                          HttpSession session,
                          Model model) {

        try {
            Map<String, String> loginData = new HashMap<>();
            loginData.put("name", name);
            loginData.put("password", password);

            String response = restTemplate.postForObject(
                    BOOT_URL + "/api/user/login",
                    loginData,
                    String.class
            );

            if (response != null && response.toLowerCase().contains("success")) {
                session.setAttribute("loggedInUser", name); // ✅ Session set
                return "redirect:/dashboard";
            } else {
                model.addAttribute("error", "Invalid name or password!");
                return "Login";
            }

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Login failed! Please try again.");
            return "Login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
