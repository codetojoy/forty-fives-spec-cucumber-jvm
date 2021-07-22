package net.codetojoy.fortyfives.steps.impl;

import static net.codetojoy.Constants.*;
import net.codetojoy.utils.Strings;
import net.codetojoy.fortyfives.RankApiClient;

import static org.junit.Assert.*;

public class RankSteps implements Steps {
    private String trump;
    private String leading;
    private String cards;
    private String actual;

    private final Strings strings = new Strings();

    @Override
    public void givenInitialInput(String trump,
                                  String leading,
                                  String cardsStr) {
        this.trump = trump;
        this.leading = leading;
        this.cards = cardsStr;
    }

    @Override
    public void givenInitialInput(String trump, String leading, boolean trumpPlayed, String cardsStr) {
        throw new UnsupportedOperationException("4-param initial");
    }

    @Override
    public void iShuffle() {
        cards = strings.shuffleCards(cards);
    }

    @Override
    public void iSelectCard() {
        var apiClient = new RankApiClient(SCHEME, FORTY_FIVES_HOST, RANK_PATH);
        actual = apiClient.rankCards(trump, leading, cards);
    }

    @Override
    public void iFilterCandidates() {
        throw new UnsupportedOperationException("iFilterCandidates");
    }


    @Override
    public void cardRankShouldBe(String expected) {
        assertEquals((String) expected, (String) actual);
    }
}
