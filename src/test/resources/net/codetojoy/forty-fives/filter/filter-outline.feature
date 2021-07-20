Feature: test get candidates

  Test "get candidates" in various forms

  Scenario Outline: Get Candidates for Hand
    Given trump: <trump> leading: <leading> played: <played> cards: <cards>
    And 2 I shuffle
    When I filter for candidates
    Then 2 cards should be <expected>

    Examples:
    | trump | leading | played | cards             | expected |
    | "C"   | "D"     | true   | "10C,9D,8D,7S,6H" | "10C,9D,8D" |
