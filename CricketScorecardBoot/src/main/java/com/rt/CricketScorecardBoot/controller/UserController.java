package com.rt.CricketScorecardBoot.controller;

import com.rt.CricketScorecardBoot.entity.UserEntity;
import com.rt.CricketScorecardBoot.repository.UserRepository;
import com.rt.CricketScorecardBoot.service.OtpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@CrossOrigin(origins = "http://localhost:8181")
@RestController
@RequestMapping("/api")
public class UserController {

    @Autowired
    private OtpService otpService;

    @Autowired
    private UserRepository userRepository;

    // ================= OTP APIs =================
    @PostMapping("/otp/send-otp")
    public String sendOtp(@RequestParam String email) {
        return otpService.sendOtp(email);
    }

    @PostMapping("/otp/verify-otp")
    public String verifyOtp(@RequestParam String email,
                            @RequestParam String otp) {
        boolean isValid = otpService.verifyOtp(email, otp);
        return isValid ? "OTP verified successfully!" : "Invalid OTP!";
    }

    // ================= User Registration =================
    @PostMapping("/user/register")
    public String registerUser(@RequestBody Map<String,Object> userMap){
        try {
            String name = (String) userMap.get("name");
            String email = (String) userMap.get("email");
            String password = (String) userMap.get("password");

            if(userRepository.findByEmail(email) != null){
                return "Email already registered!";
            }

            UserEntity user = new UserEntity();
            user.setName(name);
            user.setEmail(email);
            user.setPassword(password);
            user.setVerified(true);
            userRepository.save(user);

            // Send credentials email
            otpService.sendCredentialsEmail(email, name, password);

            return "User registered successfully!";
        } catch(Exception e){
            e.printStackTrace();
            return "Registration failed!";
        }
    }

}
