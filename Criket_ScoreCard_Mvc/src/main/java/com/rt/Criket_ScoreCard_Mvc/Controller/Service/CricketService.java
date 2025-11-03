package com.rt.Criket_ScoreCard_Mvc.Controller.Service;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.rt.Criket_ScoreCard_Mvc.Controller.Entity.Touernament_Entity;

@Service
public class CricketService {

    private final RestTemplate restTemplate = new RestTemplate();
    private final String BASE_URL = "http://localhost:8080/api/tournament";

   
    public String sendTournamentData(Touernament_Entity tournament) {
        try {
            String response = restTemplate.postForObject(
                    BASE_URL,
                    tournament,
                    String.class
            );
            return "✅ " + response;
        } catch (Exception e) {
            return "❌ Failed to send data: " + e.getMessage();
        }
    }

    
    public List<Touernament_Entity> getAllTournaments() {
        try {
            Touernament_Entity[] tournaments = restTemplate.getForObject(
                    BASE_URL,
                    Touernament_Entity[].class
            );
            return Arrays.asList(tournaments);
        } catch (Exception e) {
            System.out.println("Error fetching tournaments: " + e.getMessage());
            return List.of();
        }
    }
}
