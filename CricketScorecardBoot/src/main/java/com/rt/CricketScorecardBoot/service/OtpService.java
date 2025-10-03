package com.rt.CricketScorecardBoot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Service
public class OtpService {

    @Autowired
    private JavaMailSender mailSender;

    private Map<String, String> otpStore = new HashMap<>();

    // Send OTP
    public String sendOtp(String email) {
        String otp = String.format("%06d", new Random().nextInt(1_000_000));
        otpStore.put(email, otp);

        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(email);
            message.setSubject("ScoreCard - OTP Verification");
            message.setText("Your OTP is: " + otp);
            mailSender.send(message);
            System.out.println("DEV OTP for " + email + " = " + otp);
        } catch (Exception e) {
            System.out.println("Mail send failed: " + e.getMessage());
        }

        return "OTP sent successfully!";
    }

    // Verify OTP
    public boolean verifyOtp(String email, String otp) {
        String storedOtp = otpStore.get(email);
        return storedOtp != null && storedOtp.equals(otp);
    }

    // Send Credentials after registration
    public void sendCredentialsEmail(String email, String name, String password) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(email);
            message.setSubject("ScoreCard - Registration Successful ✅");
            message.setText(
                "Hi " + name + ",\n\n" +
                "Registration successful!\n" +
                "Username: " + name + "\n" +
                "Password: " + password + "\n\n" +
                "Team ScoreCard"
            );
            mailSender.send(message);
        } catch (Exception e) {
            System.out.println("Credential mail failed: " + e.getMessage());
        }
    }
}
