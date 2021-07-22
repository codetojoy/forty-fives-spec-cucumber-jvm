package net.codetojoy.fortyfives.steps;

import static net.codetojoy.Constants.*;
import net.codetojoy.fortyfives.*;
import net.codetojoy.fortyfives.steps.impl.*;

import io.cucumber.java.en.*;

public class FortyFivesStepDefinitions {
    private Steps steps;

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
        steps = new RankSteps();
        steps.givenInitialInput(trump, leading, cardsStr);
    }

    @Given("trump: {string} leading: {string} played: {} cards: {string}")
    public void givenInitialInput(String trump,
                                  String leading,
                                  boolean trumpPlayed,
                                  String cardsStr) {
        steps = new FilterSteps();
        steps.givenInitialInput(trump, leading, trumpPlayed, cardsStr);
    }

    @And("I shuffle")
    public void iShuffle() {
        steps.iShuffle();
    }

    @When("I sort cards by rank")
    public void iSelectCard() {
        steps.iSelectCard();
    }

    @When("I filter for candidates")
    public void iFilterCandidates() {
        steps.iFilterCandidates();
    }

    @Then("cards should be {string}")
    public void cardRankShouldBe(String expected) {
        steps.cardRankShouldBe(expected);
    }
}
