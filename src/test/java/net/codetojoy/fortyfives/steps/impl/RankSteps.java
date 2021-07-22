package net.codetojoy.fortyfives.steps.impl;

import static net.codetojoy.Constants.*;
import net.codetojoy.utils.Strings;
import net.codetojoy.fortyfives.ApiClient;

import static org.junit.Assert.*;

public class RankSteps {
    private String trump;
    private String leading;
    private String cards;
    private String actual;

    private final Strings strings = new Strings();

    public void givenInitialInput(String trump,
                                  String leading,
                                  String cardsStr) {
        this.trump = trump;
        this.leading = leading;
        this.cards = cardsStr;
    }

    public void iShuffle() {
        cards = strings.shuffleCards(cards);
    }

    public void iSelectCard() {
        var apiClient = new ApiClient(SCHEME, FORTY_FIVES_HOST, RANK_PATH);
        actual = apiClient.rankCards(trump, leading, cards);
    }

    public void cardRankShouldBe(String expected) {
        assertEquals((String) expected, (String) actual);
    }
}
