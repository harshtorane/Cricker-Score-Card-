package com.rt.CricketScorecardBoot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rt.CricketScorecardBoot.entity.Teams;
import com.rt.CricketScorecardBoot.entity.TournamentEntity;
import com.rt.CricketScorecardBoot.repository.TeamRepo;

@Service
public class TeamService {

	@Autowired
	TeamRepo TeamRepo;

	

	public void add(Teams et) {
		// TODO Auto-generated method stub
		TeamRepo.save(et);
	}



	public void Delete(int id) {
		
		TeamRepo.deleteById(id);
	}



	public void Update(int id, Teams et) {
		
		 if (TeamRepo.existsById(id)) {
		        et.setId(id); 
		        TeamRepo.save(et); 
		    }
		
	}
	



	public Optional <Teams> SelectId(int id) {
		// TODO Auto-generated method stub
		 return  TeamRepo.findById(id);
	}



	public List<Teams> selectAll() {
		    return TeamRepo.findAll();
		
		
	}
	public List<Teams> getTeamsByTournament(int tournamentId) {
	    return TeamRepo.findByTournamentId(tournamentId);
	}



	public Teams getTeamByName(String name){
	    return TeamRepo.findByTeamName(name);
	}


}
