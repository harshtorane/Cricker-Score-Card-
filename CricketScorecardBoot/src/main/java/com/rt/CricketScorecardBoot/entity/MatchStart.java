package com.rt.CricketScorecardBoot.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class MatchStart {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private int scheduleId;
    private int tournamentId;

    private String teamA;
    private String teamB;

    private String tossWinner;
    private String tossDecision;

    private String striker;
    private String nonStriker;
    private String bowler;

    private String playingXI_A;  
    private String playingXI_B;

    // GETTERS + SETTERS
}
