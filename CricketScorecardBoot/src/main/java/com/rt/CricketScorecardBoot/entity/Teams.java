package com.rt.CricketScorecardBoot.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Teams{
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int  id;
    private String teamName;
    private String captainName;
    private String  Monumber;
    
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getTeamName() {
		return teamName;
	}


	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}


	public String getCaptainName() {
		return captainName;
	}


	public void setCaptainName(String captainName) {
		this.captainName = captainName;
	}


	public String getMonumber() {
		return Monumber;
	}


	public Teams(int id, String teamName, String captainName, String monumber) {
		super();
		this.id = id;
		this.teamName = teamName;
		this.captainName = captainName;
		Monumber = monumber;
	}


	public void setMonumber(String monumber) {
		Monumber = monumber;
	}


	public  Teams() {
		
	}
    
    

}
