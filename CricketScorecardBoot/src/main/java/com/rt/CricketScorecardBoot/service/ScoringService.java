package com.rt.CricketScorecardBoot.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rt.CricketScorecardBoot.entity.*;
import com.rt.CricketScorecardBoot.repository.*;

@Service
public class ScoringService {

    private final MatchLiveRepo matchLiveRepo;
    private final BallEventRepo ballEventRepo;

    public ScoringService(MatchLiveRepo matchLiveRepo, BallEventRepo ballEventRepo){
        this.matchLiveRepo = matchLiveRepo;
        this.ballEventRepo = ballEventRepo;
    }

    @Transactional
    public MatchLive applyBall(Long matchLiveId, Integer batsmanId, Integer bowlerId, String type, int runs){

        MatchLive m = matchLiveRepo.findById(matchLiveId)
                                   .orElseThrow(() -> new RuntimeException("MatchLive Not Found"));

        // ⭐ EXTRAS: wide / no-ball → NO BALL COUNT INCREMENT ⭐
        if(type.equals("wide") || type.equals("noball")){

            m.setRuns(m.getRuns() + runs);     // runs add
            // no legal ball increment

            BallEvent be = new BallEvent();
            be.setMatchLiveId(m.getId());
            be.setEventType(type);
            be.setRuns(runs);
            be.setBatsmanId(batsmanId);
            be.setBowlerId(bowlerId);
            ballEventRepo.save(be);

            return matchLiveRepo.save(m);
        }

        // ⭐ LEGAL BALL ⭐
        m.setBalls(m.getBalls() + 1);

        if(type.equals("run")){
            m.setRuns(m.getRuns() + runs);
        }
        else if(type.equals("bye") || type.equals("lb")){
            m.setRuns(m.getRuns() + runs);
        }
        else if(type.equals("wicket")){
            m.setWickets(m.getWickets() + 1);
        }

        // ⭐ ODD RUN → STRIKE CHANGE ⭐
        if((type.equals("run") || type.equals("bye") || type.equals("lb")) && runs % 2 == 1){
            swapStrike(m);
        }

        // ⭐ END OF OVER → STRIKE CHANGE ⭐
        if(m.getBalls() % 6 == 0){
            swapStrike(m);
        }

        // ⭐ RECORD BALL EVENT ⭐
        BallEvent be = new BallEvent();
        be.setMatchLiveId(m.getId());

        int over = (m.getBalls() - 1) / 6;
        int ball = ((m.getBalls() - 1) % 6) + 1;

        be.setOverNo(over);
        be.setBallInOver(ball);

        be.setEventType(type);
        be.setRuns(runs);
        be.setBatsmanId(batsmanId);
        be.setBowlerId(bowlerId);

        ballEventRepo.save(be);

        return matchLiveRepo.save(m);
    }

    private void swapStrike(MatchLive m){
        Integer temp = m.getStrikerId();
        m.setStrikerId(m.getNonStrikerId());
        m.setNonStrikerId(temp);
    }
}
