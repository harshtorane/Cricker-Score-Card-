package com.rt.Criket_ScoreCard_Mvc.Controller.Entity;

public class MatchStart {

    private int id;
    private int scheduleId;
    private String tossWinner;
    private String chooseTo;
    private String striker;
    private String nonStriker;
    private String bowler;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public int getScheduleId() {
        return scheduleId;
    }
    public void setScheduleId(int scheduleId) {
        this.scheduleId = scheduleId;
    }

    public String getTossWinner() {
        return tossWinner;
    }
    public void setTossWinner(String tossWinner) {
        this.tossWinner = tossWinner;
    }

    public String getChooseTo() {
        return chooseTo;
    }
    public void setChooseTo(String chooseTo) {
        this.chooseTo = chooseTo;
    }

    public String getStriker() {
        return striker;
    }
    public void setStriker(String striker) {
        this.striker = striker;
    }

    public String getNonStriker() {
        return nonStriker;
    }
    public void setNonStriker(String nonStriker) {
        this.nonStriker = nonStriker;
    }

    public String getBowler() {
        return bowler;
    }
    public void setBowler(String bowler) {
        this.bowler = bowler;
    }
}
