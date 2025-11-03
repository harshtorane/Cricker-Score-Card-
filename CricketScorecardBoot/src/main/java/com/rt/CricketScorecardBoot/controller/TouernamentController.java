package com.rt.CricketScorecardBoot.controller;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rt.CricketScorecardBoot.entity.TournamentEntity;
import com.rt.CricketScorecardBoot.service.TouernamentService;


@CrossOrigin(origins = "http://localhost:8182")
@RestController
@RequestMapping("/api")
public class TouernamentController {
	
	@Autowired
	TouernamentService touernamentService;
	
	
	 @PostMapping("/tournament")
	    public String m1(@RequestBody TournamentEntity td) {
		 touernamentService.Name(td);  
	        return "Data added successfully";
	    }
	
	 
	 @DeleteMapping("/tournament/{id}")
	 public String deleteTournament(@PathVariable int id) {

		 touernamentService.Delete(id);  

	     return "Deleted successfully";
	 }


	 @PutMapping("/tournament/{id}")
	    public String UpdateTournament(@PathVariable int id, @RequestBody  TournamentEntity td ) {
		 touernamentService.Update(id, td);
			return "Update succsefully ";
	       
	    }
	 
	
	 @GetMapping("/tournament/{id}")
	 public Optional<TournamentEntity> selectTournamentById(@PathVariable int id) {
	     return touernamentService.selectById(id);
	 }
	 
	 @GetMapping("/tournament")
	 public List<TournamentEntity> selectAllTournaments() {
	     return touernamentService.selectAll();
	 }

	 

}

