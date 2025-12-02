
package com.rt.CricketScorecardBoot.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "match_live")
public class MatchLive {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private int scheduleId;

    private int runs = 0;
    private int wickets = 0;
    private int balls = 0;

    private int strikerId;
    private int nonStrikerId;
    private int bowlerId;

    private int inningNumber = 1;
    private boolean isOver = false;

    private String lastEventType;  
    private int lastRuns;

    public MatchLive() {}

    // --------------------
    // Getters & Setters
    // --------------------

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(int scheduleId) {
        this.scheduleId = scheduleId;
    }

    public int getRuns() {
        return runs;
    }

    public void setRuns(int runs) {
        this.runs = runs;
    }

    public int getWickets() {
        return wickets;
    }

    public void setWickets(int wickets) {
        this.wickets = wickets;
    }

    public int getBalls() {
        return balls;
    }

    public void setBalls(int balls) {
        this.balls = balls;
    }

    public int getStrikerId() {
        return strikerId;
    }

    public void setStrikerId(int strikerId) {
        this.strikerId = strikerId;
    }

    public int getNonStrikerId() {
        return nonStrikerId;
    }

    public void setNonStrikerId(int nonStrikerId) {
        this.nonStrikerId = nonStrikerId;
    }

    public int getBowlerId() {
        return bowlerId;
    }

    public void setBowlerId(int bowlerId) {
        this.bowlerId = bowlerId;
    }

    public int getInningNumber() {
        return inningNumber;
    }

    public void setInningNumber(int inningNumber) {
        this.inningNumber = inningNumber;
    }

    public boolean isOver() {
        return isOver;
    }

    public void setOver(boolean over) {
        isOver = over;
    }

    public String getLastEventType() {
        return lastEventType;
    }

    public void setLastEventType(String lastEventType) {
        this.lastEventType = lastEventType;
    }

    public int getLastRuns() {
        return lastRuns;
    }

    public void setLastRuns(int lastRuns) {
        this.lastRuns = lastRuns;
    }
}
