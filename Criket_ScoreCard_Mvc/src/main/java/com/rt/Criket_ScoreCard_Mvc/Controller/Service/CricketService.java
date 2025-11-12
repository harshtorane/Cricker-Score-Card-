package com.rt.Criket_ScoreCard_Mvc.Controller.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
            String response = restTemplate.postForObject(BASE_URL, tournament, String.class);
            System.out.println("✅ Tournament POST Response: " + response);
            return response;
        } catch (Exception e) {
            e.printStackTrace();
            return "❌ Failed to send data: " + e.getMessage();
        }
    }

   
    public List<Touernament_Entity> getAllTournaments() {
        try {
            Touernament_Entity[] tournaments = restTemplate.getForObject(BASE_URL, Touernament_Entity[].class);
            System.out.println("🎯 Data fetched successfully from Boot: " + Arrays.toString(tournaments));
            return Arrays.asList(tournaments);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("❌ Error fetching tournaments: " + e.getMessage());
            return List.of();
        }
    }

   
    public LocalDate parseDate(String dateStr) {
        try {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            return LocalDate.parse(dateStr, formatter);
        } catch (Exception e) {
            return null;
        }
    }
    public Touernament_Entity getTournamentById(int id) {
        return restTemplate.getForObject(BASE_URL + "/" + id, Touernament_Entity.class);
    }

}
