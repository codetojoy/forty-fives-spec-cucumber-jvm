Feature: test rank

  Test the ranking of cards (either trump or otherwise)

  Scenario Outline: Spades as Trump
    Given trump: <trump> leading: <leading> cards: <cards>
    And I shuffle
    When I sort cards by rank
    Then cards should be <expected>

    Examples:
    | trump | leading | cards         | expected |
    | "S"   | "U"     | "10S,9S,8S,7S,6S,5S,4S,3S,2S,AS,JS,QS,KS,AH" | "5S,JS,AH,AS,KS,QS,2S,3S,4S,6S,7S,8S,9S,10S" |
