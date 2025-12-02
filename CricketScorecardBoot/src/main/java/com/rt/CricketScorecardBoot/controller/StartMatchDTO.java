package com.rt.CricketScorecardBoot.controller;

public class StartMatchDTO {

    private int strikerId;
    private int nonStrikerId;
    private int bowlerId;

    private String tossWinner;
    private String chooseTo;

    private int totalOvers;
    private int oversPerBowler;

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

    public int getTotalOvers() {
        return totalOvers;
    }

    public void setTotalOvers(int totalOvers) {
        this.totalOvers = totalOvers;
    }

    public int getOversPerBowler() {
        return oversPerBowler;
    }

    public void setOversPerBowler(int oversPerBowler) {
        this.oversPerBowler = oversPerBowler;
    }
}
