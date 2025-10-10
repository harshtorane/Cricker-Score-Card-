package com.rt.Criket_ScoreCard_Mvc.Controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

@Controller
public class OtpMvcController {

    private final RestTemplate restTemplate = new RestTemplate();
    private final String BOOT_URL = "http://localhost:8080"; // Boot API base URL

    @GetMapping("/register")
    public String showRegister() {
        return "Register";
    }

    @PostMapping("/sendOtp")
    public String sendOtp(@RequestParam String email, Model model) {
        try {
            String response = restTemplate.postForObject(
                    BOOT_URL + "/api/otp/send-otp?email=" + email,
                    null,
                    String.class
            );
            model.addAttribute("email", email);
            model.addAttribute("otpMessage", response);
        } catch (Exception e) {
            model.addAttribute("otpMessage", "Failed to send OTP! Try again.");
        }
        return "Register";
    }

    @PostMapping("/verifyOtp")
    public String verifyOtp(@RequestParam String email,
                            @RequestParam String otp,
                            Model model) {
        try {
            String response = restTemplate.postForObject(
                    BOOT_URL + "/api/otp/verify-otp?email=" + email + "&otp=" + otp,
                    null,
                    String.class
            );

            if(response.toLowerCase().contains("success")) {
                model.addAttribute("verifyMessage", "OTP Verified ✅");
                model.addAttribute("email", email);
                return "Register"; // OTP verified → show password form
            } else {
                model.addAttribute("verifyMessage", "Invalid OTP ❌");
                model.addAttribute("email", email);
                return "Register";
            }
        } catch (Exception e) {
            model.addAttribute("verifyMessage", "Verification failed! Try again.");
            model.addAttribute("email", email);
            return "Register";
        }
    }

    // ✅ New: Register User to Boot DB
    @PostMapping("/registerUser")
    public String registerUser(@RequestParam String fullname,
                               @RequestParam String email,
                               @RequestParam String password,
                               Model model) {
        try {
            // Prepare UserEntity
            Map<String, Object> user = new HashMap<>();
            user.put("name", fullname);
            user.put("email", email);
            user.put("password", password);
            user.put("verified", true);

            // Call Boot API
            restTemplate.postForObject(
                BOOT_URL + "/api/user/register",
                user,
                String.class
            );

            // Redirect to login page after successful registration
            return "redirect:/Login";

        } catch (Exception e) {
            model.addAttribute("errorMsg", "Registration failed! Try again.");
            return "Register";
        }
    }
    
    @GetMapping("/otp-login")
    public String showLogin() {
        return "Login";  // Login.jsp
    }
}

