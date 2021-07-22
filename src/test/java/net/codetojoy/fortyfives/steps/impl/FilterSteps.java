package net.codetojoy.fortyfives.steps.impl;

import static net.codetojoy.Constants.*;
import net.codetojoy.utils.Strings;
import net.codetojoy.fortyfives.FilterApiClient;

import static org.junit.Assert.*;

public class FilterSteps {
    private String trump;
    private String leading;
    private String cards;
    private boolean trumpPlayed;
    private String actual;

    private final Strings strings = new Strings();

    public void givenInitialInput(String trump,
                                  String leading,
                                  boolean trumpPlayed,
                                  String cardsStr) {
        this.trump = trump;
        this.leading = leading;
        this.trumpPlayed = trumpPlayed;
        this.cards = cardsStr;
    }

    public void iShuffle() {
        cards = strings.shuffleCards(cards);
    }

    public void iFilterCandidates() {
        var filterClient = new FilterApiClient(SCHEME, FORTY_FIVES_HOST, FILTER_PATH);
        actual = filterClient.filterCandidates(trump, leading, trumpPlayed, cards);
    }

    public void cardRankShouldBe(String expected) {
        assertEquals((String) expected, (String) actual);
    }
}
