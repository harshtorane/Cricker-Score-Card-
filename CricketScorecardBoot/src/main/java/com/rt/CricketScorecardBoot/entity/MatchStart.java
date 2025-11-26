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

    private String tossWinner;
    private String chooseTo;

    private int totalOvers;        // NEW
    private int oversPerBowler;    // NEW

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getScheduleId() { return scheduleId; }
    public void setScheduleId(int scheduleId) { this.scheduleId = scheduleId; }

    public int getTournamentId() { return tournamentId; }
    public void setTournamentId(int tournamentId) { this.tournamentId = tournamentId; }

    public String getTossWinner() { return tossWinner; }
    public void setTossWinner(String tossWinner) { this.tossWinner = tossWinner; }

    public String getChooseTo() { return chooseTo; }
    public void setChooseTo(String chooseTo) { this.chooseTo = chooseTo; }

    public int getTotalOvers() { return totalOvers; }
    public void setTotalOvers(int totalOvers) { this.totalOvers = totalOvers; }

    public int getOversPerBowler() { return oversPerBowler; }
    public void setOversPerBowler(int oversPerBowler) { this.oversPerBowler = oversPerBowler; }
}
