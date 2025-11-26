package com.rt.Criket_ScoreCard_Mvc.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.rt.Criket_ScoreCard_Mvc.Controller.Entity.MatchStart;
import com.rt.Criket_ScoreCard_Mvc.Controller.Entity.Schedule;

@Controller
public class MvcMatchController {

    RestTemplate rt = new RestTemplate();

    // ===================== LOAD START MATCH PAGE =====================
  
    		@GetMapping("/match/start")
    		public String startMatchPage(
    		        @RequestParam int id,
    		        @RequestParam int tournamentId,
    		        Model model) {

    		    // CORRECT API CALL (schedule by ID)
    		    Schedule schedule = rt.getForObject(
    		            "http://localhost:8080/api/schedule/getById/" + id,
    		            Schedule.class);

    		    model.addAttribute("schedule", schedule);
    		    model.addAttribute("scheduleId", id);
    		    model.addAttribute("tournamentId", tournamentId);

    		    return "StartMatch";
    		}



    // ===================== SUBMIT MATCH START DATA =====================
    		@PostMapping("/match/start/save")
    		public String saveMatchStart(MatchStart ms) {

    		    System.out.println("🔥 Saving Match Start:");
    		    System.out.println("ScheduleId = " + ms.getScheduleId());
    		    System.out.println("TournamentId = " + ms.getTournamentId());
    		    System.out.println("Toss Winner = " + ms.getTossWinner());
    		    System.out.println("Decision = " + ms.getChooseTo());

    		    rt.postForObject(
    		            "http://localhost:8080/api/startmatch",
    		            ms,
    		            MatchStart.class
    		    );

    		    // 🔥 SAFETY DELAY (DB लिहीण्याआधी GET call होऊ नये)
    		    try { Thread.sleep(300); } catch (Exception e) {}

    		    return "redirect:/match/live?scheduleId=" + ms.getScheduleId();
    		}

}
