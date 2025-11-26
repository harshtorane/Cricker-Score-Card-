package com.rt.Criket_ScoreCard_Mvc.Controller.Entity;

public class Player {

    private int id;
    private String playerName;
    private String role;
    private int teamId;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getPlayerName() { return playerName; }
    public void setPlayerName(String playerName) { this.playerName = playerName; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public int getTeamId() { return teamId; }
    public void setTeamId(int teamId) { this.teamId = teamId; }
}
