package com.rt.Criket_ScoreCard_Mvc.Controller.Entity;

public class TeamEntity {

    private int id;
    private String teamName;
    private String captainName;
    private String monumber;
    private int tournamentId;

    public TeamEntity() {
    }

    public TeamEntity(int id, String teamName, String captainName, String monumber, int tournamentId) {
        this.id = id;
        this.teamName = teamName;
        this.captainName = captainName;
        this.monumber = monumber;
        this.tournamentId = tournamentId;
    }

    // GETTERS
    public int getId() {
        return id;
    }

    public String getTeamName() {
        return teamName;
    }

    public String getCaptainName() {
        return captainName;
    }

    public String getMonumber() {
        return monumber;
    }

    public int getTournamentId() {
        return tournamentId;
    }

    // SETTERS
    public void setId(int id) {
        this.id = id;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public void setCaptainName(String captainName) {
        this.captainName = captainName;
    }

    public void setMonumber(String monumber) {
        this.monumber = monumber;
    }

    public void setTournamentId(int tournamentId) {
        this.tournamentId = tournamentId;
    }
}
