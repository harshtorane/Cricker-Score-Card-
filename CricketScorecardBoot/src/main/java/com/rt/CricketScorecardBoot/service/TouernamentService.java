package com.rt.CricketScorecardBoot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rt.CricketScorecardBoot.entity.TournamentEntity;
import  com.rt.CricketScorecardBoot.repository.TouernamentRepostry;

@Service
public class TouernamentService {
	
	@Autowired
	 TouernamentRepostry  TouernamentRepostry;
  
	public void Name(TournamentEntity td) {
		
		TouernamentRepostry.save(td);
	}

	
	


	public void Delete(int id) {
	
		TouernamentRepostry.deleteById(id);	
	}


	public void Update(int id, TournamentEntity td) {
		
		  if (TouernamentRepostry.existsById(id)) {
		        td.setId(id); 
		        TouernamentRepostry.save(td); 
		    }
		
	}





	public Optional<TournamentEntity> selectById(int id) {
	    return  TouernamentRepostry.findById(id);
	}





	public List<TournamentEntity> selectAll() {
	    return TouernamentRepostry.findAll();
	}


}
