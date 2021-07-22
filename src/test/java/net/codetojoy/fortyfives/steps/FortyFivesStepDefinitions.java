package net.codetojoy.fortyfives.steps;

import static net.codetojoy.Constants.*;
import net.codetojoy.utils.*;
import net.codetojoy.fortyfives.*;
import net.codetojoy.fortyfives.steps.impl.*;

import io.cucumber.java.en.*;

import java.time.*;
import java.util.*;

import static org.junit.Assert.*;

public class FortyFivesStepDefinitions {
    private RankSteps rankSteps = new RankSteps();
    private FilterSteps filterSteps = new FilterSteps();

    private static final String MODE_FILTER = "filter";
    private static final String MODE_RANK = "rank";
    private static final String MODE_UNKNOWN = "unknown";

    private String mode = MODE_UNKNOWN;

    static {
        var pingRemote = new PingRemote(SCHEME, FORTY_FIVES_HOST, FORTY_FIVES_PING_PATH);
        if (!pingRemote.ping()) {
           throw new IllegalStateException("server not running");
        }
    }

    @Given("trump: {string} leading: {string} cards: {string}")
    public void givenInitialInput(String trump,
                                  String leading,
                                  String cardsStr) {
        mode = MODE_RANK;
        rankSteps.givenInitialInput(trump, leading, cardsStr);
    }

    @Given("trump: {string} leading: {string} played: {} cards: {string}")
    public void givenInitialInput(String trump,
                                  String leading,
                                  boolean trumpPlayed,
                                  String cardsStr) {
        mode = MODE_FILTER;
        filterSteps.givenInitialInput(trump, leading, trumpPlayed, cardsStr);
    }

    @And("I shuffle")
    public void iShuffle() {
        if (mode.equals(MODE_RANK)) {
            rankSteps.iShuffle();
        } else if (mode.equals(MODE_FILTER)) {
            filterSteps.iShuffle();
        }
    }

    @When("I sort cards by rank")
    public void iSelectCard() {
        assertEquals((String) MODE_RANK, (String) mode);
        rankSteps.iSelectCard();
    }

    @When("I filter for candidates")
    public void iFilterCandidates() {
        assertEquals((String) MODE_FILTER, (String) mode);
        filterSteps.iFilterCandidates();
    }

    @Then("cards should be {string}")
    public void cardRankShouldBe(String expected) {
        if (mode.equals(MODE_RANK)) {
            rankSteps.cardRankShouldBe(expected);
        } else if (mode.equals(MODE_FILTER)) {
            filterSteps.cardRankShouldBe(expected);
        }
    }
}
