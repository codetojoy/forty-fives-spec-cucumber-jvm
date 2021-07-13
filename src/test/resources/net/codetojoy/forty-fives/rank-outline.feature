Feature: test rank

  Test the ranking of cards (either trump or otherwise)

  Scenario Outline: Cucumber Data Table
    Given trump: <trump> leading: <leading> cards: <cards>
    And I shuffle
    When I sort cards by rank
    Then cards should be <expected>

    Examples:
    | trump | leading | cards         | expected |
    | "C"   | "C"     | "2C,3C,4C,5C" | "5C,2C,3C,4C" |
