package com.rt.Criket_ScoreCard_Mvc.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.rt.CricketScorecardBoot.entity.Player;
@Controller
public class MvcPlayerController {

	@PostMapping("/player/save")
	public String savePlayer(
	        @RequestParam String playerName,
	        @RequestParam String role,
	        @RequestParam int teamId,
	        @RequestParam int tournamentId) {

	    Player p = new Player();
	    p.setPlayerName(playerName);
	    p.setRole(role);
	    p.setTeamId(teamId);

	    RestTemplate rt = new RestTemplate();
	    rt.postForObject("http://localhost:8080/api/player", p, String.class);

	    return "redirect:/team/edit?id=" + teamId + "&tournamentId=" + tournamentId;
	}

}
