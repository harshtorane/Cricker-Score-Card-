package com.rt.CricketScorecardBoot.entity;

import jakarta.persistence.*;

@Entity
public class Schedule {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private int tournamentId;
    private String matchTitle;
    private String ground;
    private String matchDate;
    private String matchTime;
    private String teamA;
    private String teamB;

    public Schedule() {}

    // ===================== GETTERS =====================

    public int getId() {
        return id;
    }

    public int getTournamentId() {
        return tournamentId;
    }

    public String getMatchTitle() {
        return matchTitle;
    }

    public String getGround() {
        return ground;
    }

    public String getMatchDate() {
        return matchDate;
    }

    public String getMatchTime() {
        return matchTime;
    }

    public String getTeamA() {
        return teamA;
    }

    public String getTeamB() {
        return teamB;
    }

    // ===================== SETTERS =====================

    public void setId(int id) {
        this.id = id;
    }

    public void setTournamentId(int tournamentId) {
        this.tournamentId = tournamentId;
    }

    public void setMatchTitle(String matchTitle) {
        this.matchTitle = matchTitle;
    }

    public void setGround(String ground) {
        this.ground = ground;
    }

    public void setMatchDate(String matchDate) {
        this.matchDate = matchDate;
    }

    public void setMatchTime(String matchTime) {
        this.matchTime = matchTime;
    }

    public void setTeamA(String teamA) {
        this.teamA = teamA;
    }

    public void setTeamB(String teamB) {
        this.teamB = teamB;
    }
}
