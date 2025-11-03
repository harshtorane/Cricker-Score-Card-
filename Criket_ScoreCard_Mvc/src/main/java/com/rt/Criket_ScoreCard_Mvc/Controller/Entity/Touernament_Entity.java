package com.rt.Criket_ScoreCard_Mvc.Controller.Entity;

public class Touernament_Entity {

    private String tournamentName;
    private String city;
    private String ground;
    private String organizerName;
    private String organizerNumber;
    private String organizerEmail;
    private String startDate;
    private String endDate;
    private String tournamentCategory;

    
    public String getTournamentName() { return tournamentName; }
    public void setTournamentName(String tournamentName) { this.tournamentName = tournamentName; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getGround() { return ground; }
    public void setGround(String ground) { this.ground = ground; }

    public String getOrganizerName() { return organizerName; }
    public void setOrganizerName(String organizerName) { this.organizerName = organizerName; }

    public String getOrganizerNumber() { return organizerNumber; }
    public void setOrganizerNumber(String organizerNumber) { this.organizerNumber = organizerNumber; }

    public String getOrganizerEmail() { return organizerEmail; }
    public void setOrganizerEmail(String organizerEmail) { this.organizerEmail = organizerEmail; }

    public String getStartDate() { return startDate; }
    public void setStartDate(String startDate) { this.startDate = startDate; }

    public String getEndDate() { return endDate; }
    public void setEndDate(String endDate) { this.endDate = endDate; }

    public String getTournamentCategory() { return tournamentCategory; }
    public void setTournamentCategory(String tournamentCategory) { this.tournamentCategory = tournamentCategory; }
}
