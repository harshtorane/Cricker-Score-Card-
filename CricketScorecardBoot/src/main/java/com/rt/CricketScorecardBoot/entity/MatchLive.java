package com.rt.CricketScorecardBoot.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "match_live")
public class MatchLive {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Integer scheduleId;

    private String teamInning;

    private int runs = 0;
    private int wickets = 0;

    private int balls = 0;

    private Integer strikerId;
    private Integer nonStrikerId;

    private Integer bowlerId;

    private int inningNumber = 1;

    private boolean isOver = false;

    private LocalDateTime createdAt;

    @PrePersist
    public void prePersist() {
        this.createdAt = LocalDateTime.now();
    }

    // ========= GETTERS & SETTERS ==========

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(Integer scheduleId) {
        this.scheduleId = scheduleId;
    }

    public String getTeamInning() {
        return teamInning;
    }

    public void setTeamInning(String teamInning) {
        this.teamInning = teamInning;
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

    public Integer getStrikerId() {
        return strikerId;
    }

    public void setStrikerId(Integer strikerId) {
        this.strikerId = strikerId;
    }

    public Integer getNonStrikerId() {
        return nonStrikerId;
    }

    public void setNonStrikerId(Integer nonStrikerId) {
        this.nonStrikerId = nonStrikerId;
    }

    public Integer getBowlerId() {
        return bowlerId;
    }

    public void setBowlerId(Integer bowlerId) {
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

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
