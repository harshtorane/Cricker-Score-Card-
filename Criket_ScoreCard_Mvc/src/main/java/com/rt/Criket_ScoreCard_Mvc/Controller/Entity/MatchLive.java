package com.rt.Criket_ScoreCard_Mvc.Controller.Entity;

public class MatchLive {

    private Long id;
    private Integer scheduleId;
    private String teamInning;

    private int runs;
    private int wickets;
    private int balls;

    private Integer strikerId;
    private Integer nonStrikerId;
    private Integer bowlerId;

    private int inningNumber;
    private boolean isOver;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Integer getScheduleId() { return scheduleId; }
    public void setScheduleId(Integer scheduleId) { this.scheduleId = scheduleId; }

    public String getTeamInning() { return teamInning; }
    public void setTeamInning(String teamInning) { this.teamInning = teamInning; }

    public int getRuns() { return runs; }
    public void setRuns(int runs) { this.runs = runs; }

    public int getWickets() { return wickets; }
    public void setWickets(int wickets) { this.wickets = wickets; }

    public int getBalls() { return balls; }
    public void setBalls(int balls) { this.balls = balls; }

    public Integer getStrikerId() { return strikerId; }
    public void setStrikerId(Integer strikerId) { this.strikerId = strikerId; }

    public Integer getNonStrikerId() { return nonStrikerId; }
    public void setNonStrikerId(Integer nonStrikerId) { this.nonStrikerId = nonStrikerId; }

    public Integer getBowlerId() { return bowlerId; }
    public void setBowlerId(Integer bowlerId) { this.bowlerId = bowlerId; }

    public int getInningNumber() { return inningNumber; }
    public void setInningNumber(int inningNumber) { this.inningNumber = inningNumber; }

    public boolean isOver() { return isOver; }
    public void setOver(boolean over) { isOver = over; }
}
