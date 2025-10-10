package com.rt.Criket_ScoreCard_Mvc.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {

    private final RestTemplate restTemplate = new RestTemplate();
    private static final String BOOT_URL = "http://localhost:8080"; // तुझ्या Boot app चा URL

    // Login page दाखवण्यासाठी
    @GetMapping("/login")
    public String showLoginPage() {
        return "Login";
    }

    // Login verify आणि session तयार करण्यासाठी
    @PostMapping("/login")
    public String doLogin(@RequestParam String name,
                          @RequestParam String password,
                          HttpSession session,
                          Model model) {

        try {
            Map<String, String> loginData = new HashMap<>();
            loginData.put("name", name);
            loginData.put("password", password);

            // Boot API call
            String response = restTemplate.postForObject(
                    BOOT_URL + "/api/user/login",
                    loginData,
                    String.class
            );

            if (response.toLowerCase().contains("success")) {
                // Session मध्ये user name साठवा
                session.setAttribute("loggedInUser", name);
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

    // Logout controller
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
