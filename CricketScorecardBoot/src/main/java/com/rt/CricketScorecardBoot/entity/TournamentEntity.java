package com.rt.CricketScorecardBoot.entity;

import java.time.LocalDate;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data  
@NoArgsConstructor  
@AllArgsConstructor
@Table(name = "tournament")  
public class TournamentEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int  id;


    private String tournamentName;
    private String city;
    private String ground;
    private String organizerName;
    private String organizerNumber;
    private String organizerEmail;
    private boolean emailUpdates;
    private LocalDate startDate;
    private LocalDate endDate;
    private String category;
    
    public  TournamentEntity() {
    	
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTournamentName() {
		return tournamentName;
	}

	public void setTournamentName(String tournamentName) {
		this.tournamentName = tournamentName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getGround() {
		return ground;
	}

	public void setGround(String ground) {
		this.ground = ground;
	}

	public String getOrganizerName() {
		return organizerName;
	}

	public void setOrganizerName(String organizerName) {
		this.organizerName = organizerName;
	}

	public String getOrganizerNumber() {
		return organizerNumber;
	}

	public void setOrganizerNumber(String organizerNumber) {
		this.organizerNumber = organizerNumber;
	}

	public String getOrganizerEmail() {
		return organizerEmail;
	}

	public void setOrganizerEmail(String organizerEmail) {
		this.organizerEmail = organizerEmail;
	}

	public boolean isEmailUpdates() {
		return emailUpdates;
	}

	public void setEmailUpdates(boolean emailUpdates) {
		this.emailUpdates = emailUpdates;
	}

	public LocalDate getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}

	public LocalDate getEndDate() {
		return endDate;
	}

	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public TournamentEntity(int id, String tournamentName, String city, String ground, String organizerName,
			String organizerNumber, String organizerEmail, boolean emailUpdates, LocalDate startDate, LocalDate endDate,
			String category) {
		super();
		this.id = id;
		this.tournamentName = tournamentName;
		this.city = city;
		this.ground = ground;
		this.organizerName = organizerName;
		this.organizerNumber = organizerNumber;
		this.organizerEmail = organizerEmail;
		this.emailUpdates = emailUpdates;
		this.startDate = startDate;
		this.endDate = endDate;
		this.category = category;
	}
    
    
    
}
