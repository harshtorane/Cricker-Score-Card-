package com.rt.CricketScorecardBoot.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Player {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String playerName;
    private String role;
    private int teamId;

    public Player(){}

    // getters & setters
    public int getId(){ return id; }
    public void setId(int id){ this.id = id; }

    public String getPlayerName(){ return playerName; }
    public void setPlayerName(String playerName){ this.playerName = playerName; }

    public String getRole(){ return role; }
    public void setRole(String role){ this.role = role; }

    public int getTeamId(){ return teamId; }
    public void setTeamId(int teamId){ this.teamId = teamId; }
}