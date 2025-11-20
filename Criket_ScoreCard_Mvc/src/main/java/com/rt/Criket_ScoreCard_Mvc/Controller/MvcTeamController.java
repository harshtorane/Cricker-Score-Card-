package com.rt.Criket_ScoreCard_Mvc.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.ui.Model;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import com.rt.CricketScorecardBoot.entity.Teams;
import com.rt.CricketScorecardBoot.entity.Player;

@Controller
@RequestMapping("/team")
public class MvcTeamController {

    RestTemplate rt = new RestTemplate();

    // ---------- 1️⃣ Add Team Page ----------
    @GetMapping("/add")
    public String addTeamPage(@RequestParam int tournamentId, Model model) {
        model.addAttribute("tournamentId", tournamentId);
        return "AddTeam";
    }

    // ---------- 2️⃣ Save Team ----------
    @PostMapping("/save")
    public String saveTeam(
            @RequestParam String teamName,
            @RequestParam String captainName,
            @RequestParam String monumber,
            @RequestParam int tournamentId) {

        Teams team = new Teams();
        team.setTeamName(teamName);
        team.setCaptainName(captainName);
        team.setMonumber(monumber);
        team.setTournamentId(tournamentId);

        rt.postForObject("http://localhost:8080/api/team", team, String.class);

        return "redirect:/team/list?tournamentId=" + tournamentId;
    }

    // ---------- 3️⃣ List Teams of Tournament ----------
    @GetMapping("/list")
    public String listTeams(@RequestParam int tournamentId, Model model) {

        Teams[] allTeams = rt.getForObject("http://localhost:8080/api/team", Teams[].class);

        List<Teams> filtered =
                Arrays.stream(allTeams == null ? new Teams[0] : allTeams)
                        .filter(t -> t.getTournamentId() == tournamentId)
                        .collect(Collectors.toList());

        model.addAttribute("teams", filtered);
        model.addAttribute("tournamentId", tournamentId);

        return "TeamList";
    }

    // ---------- 4️⃣ Delete Team ----------
    @GetMapping("/delete")
    public String deleteTeam(@RequestParam int id,
                             @RequestParam int tournamentId) {

        rt.delete("http://localhost:8080/api/team/" + id);

        return "redirect:/team/list?tournamentId=" + tournamentId;
    }

    // ---------- 5️⃣ Edit Team (Add Players Page) ----------
    @GetMapping("/edit")
    public String editTeam(@RequestParam int id,
                           @RequestParam int tournamentId,
                           Model model) {

        Teams team = rt.getForObject("http://localhost:8080/api/team/" + id, Teams.class);

        Player[] players = rt.getForObject(
                "http://localhost:8080/api/player/team/" + id,
                Player[].class
        );

        model.addAttribute("team", team);
        model.addAttribute("players",
                players == null ? Arrays.asList() : Arrays.asList(players));

        model.addAttribute("tournamentId", tournamentId);

        return "EditTeam";
    }

    // ---------- 6️⃣ Save Player ----------
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

        rt.postForObject("http://localhost:8080/api/player", p, String.class);

        return "redirect:/team/edit?id=" + teamId + "&tournamentId=" + tournamentId;
    }

    // ---------- 7️⃣ Delete Player ----------
    @GetMapping("/player/delete")
    public String deletePlayer(
            @RequestParam int id,
            @RequestParam int teamId,
            @RequestParam int tournamentId) {

        rt.delete("http://localhost:8080/api/player/" + id);

        return "redirect:/team/edit?id=" + teamId + "&tournamentId=" + tournamentId;
    }
    @GetMapping("/details")
    public String teamDetails(@RequestParam int id,
                              @RequestParam int tournamentId,
                              Model model) {

        // Fetch Team info
        Teams team = rt.getForObject("http://localhost:8080/api/team/" + id, Teams.class);

        // Fetch all players for this team
        Player[] players = rt.getForObject(
                "http://localhost:8080/api/player/team/" + id,
                Player[].class
        );

        model.addAttribute("team", team);
        model.addAttribute("players",
                players == null ? Arrays.asList() : Arrays.asList(players));
        model.addAttribute("tournamentId", tournamentId);

        return "TeamDetails";   // JSP page
    }

    @PostMapping("/player/update")
    public String updatePlayer(
            @RequestParam int id,
            @RequestParam String playerName,
            @RequestParam String role,
            @RequestParam int teamId,
            @RequestParam int tournamentId) {

        Player p = new Player();
        p.setId(id);
        p.setPlayerName(playerName);
        p.setRole(role);
        p.setTeamId(teamId);

        rt.put("http://localhost:8080/api/player/" + id, p);   // PUT update

        return "redirect:/team/details?id=" + teamId + "&tournamentId=" + tournamentId;
    }


}
