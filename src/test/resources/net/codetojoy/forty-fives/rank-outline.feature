Feature: test rank

  boilerplate here

  Scenario Outline: Cucumber Data Table
    Given trump: <trump> leading: <leading> cards: <cards>
    When I sort cards by rank
    Then cards should be <expected>

    Examples:
    | trump | leading | cards         | expected |
    | "C"   | "C"     | "2C,3C,4C,5C" | "5C,2C,3C,4C" |
