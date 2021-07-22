package net.codetojoy.fortyfives.steps.impl;

public interface Steps {
    void givenInitialInput(String trump, String leading, boolean trumpPlayed, String cardsStr);

    void givenInitialInput(String trump, String leading, String cardsStr);

    void iShuffle();
    void iSelectCard();
    void iFilterCandidates();

    void cardRankShouldBe(String expected);
}
