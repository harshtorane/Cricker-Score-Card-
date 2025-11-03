package com.rt.CricketScorecardBoot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;




import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Service
public class OtpService {

    @Autowired
    private JavaMailSender mailSender;
    
    

    // Store OTPs per email
    private Map<String, String> otpStore = new HashMap<>();

    // ========================= SEND OTP =========================
    public String sendOtp(String email) {
        // Generate 6-digit random OTP
        String otp = String.format("%06d", new Random().nextInt(1_000_000));

        otpStore.put(email, otp); // Save OTP to memory

        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(email);
            message.setSubject("ScoreCard - OTP Verification");
            message.setText("Your OTP is: " + otp + "\n\nValid for 5 minutes.");

            mailSender.send(message);

            // Optional: Log OTP for testing
            System.out.println("[DEV] OTP for " + email + " is: " + otp);

            return "OTP sent successfully!";
        } catch (Exception e) {
            System.out.println("❌ Failed to send OTP email: " + e.getMessage());
            return "Failed to send OTP!";
        }
    }

    // ========================= VERIFY OTP =========================
    public boolean verifyOtp(String email, String otp) {
        String storedOtp = otpStore.get(email);
        return storedOtp != null && storedOtp.equals(otp);
    }

    // ========================= SEND CREDENTIALS =========================
    public void sendCredentialsEmail(String email, String name, String password) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(email);
            message.setSubject("ScoreCard - Registration Successful ✅");
            message.setText(
                "Hi " + name + ",\n\n" +
                "🎉 Registration successful!\n\n" +
                "Your credentials:\n" +
                "Username: " + name + "\n" +
                "Password: " + password + "\n\n" +
                "Thanks,\nTeam ScoreCard"
            );

            mailSender.send(message);
        } catch (Exception e) {
            System.out.println("❌ Failed to send credentials email: " + e.getMessage());
        }
    }

	


}
