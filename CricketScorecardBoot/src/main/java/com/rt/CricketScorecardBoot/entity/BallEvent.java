package com.rt.CricketScorecardBoot.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "ball_event")
public class BallEvent {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long matchLiveId;

    private int overNo;

    private int ballInOver;

    private String eventType;   // run, wide, noball, bye, lb, wicket

    private int runs;

    private Integer batsmanId;

    private Integer bowlerId;

    private String extraInfo;

    private LocalDateTime createdAt;

    @PrePersist
    public void prePersist() {
        this.createdAt = LocalDateTime.now();
    }

    // ==================== GETTERS & SETTERS =======================

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getMatchLiveId() {
        return matchLiveId;
    }

    public void setMatchLiveId(Long matchLiveId) {
        this.matchLiveId = matchLiveId;
    }

    public int getOverNo() {
        return overNo;
    }

    public void setOverNo(int overNo) {
        this.overNo = overNo;
    }

    public int getBallInOver() {
        return ballInOver;
    }

    public void setBallInOver(int ballInOver) {
        this.ballInOver = ballInOver;
    }

    public String getEventType() {
        return eventType;
    }

    public void setEventType(String eventType) {
        this.eventType = eventType;
    }

    public int getRuns() {
        return runs;
    }

    public void setRuns(int runs) {
        this.runs = runs;
    }

    public Integer getBatsmanId() {
        return batsmanId;
    }

    public void setBatsmanId(Integer batsmanId) {
        this.batsmanId = batsmanId;
    }

    public Integer getBowlerId() {
        return bowlerId;
    }

    public void setBowlerId(Integer bowlerId) {
        this.bowlerId = bowlerId;
    }

    public String getExtraInfo() {
        return extraInfo;
    }

    public void setExtraInfo(String extraInfo) {
        this.extraInfo = extraInfo;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
