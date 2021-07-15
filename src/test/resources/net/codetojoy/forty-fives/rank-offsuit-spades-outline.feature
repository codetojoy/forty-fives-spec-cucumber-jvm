Feature: test rank

  Test the ranking of cards (either trump or otherwise)

  Scenario Outline: Clubs as Trump
    Given trump: <trump> leading: <leading> cards: <cards>
    And I shuffle
    When I sort cards by rank
    Then cards should be <expected>

    Examples:
    | trump | leading | cards         | expected |
    | "D"   | "U"     | "10S,9S,8S,7S,6S,5S,4S,3S,2S,AS,JS,QS,KS" | "KS,QS,JS,AS,2S,3S,4S,5S,6S,7S,8S,9S,10S" |
    | "D"   | "C"     | "10S,9S,8S,7S,6S,5S,4S,3S,2S,AS,JS,QS,KS" | "KS,QS,JS,AS,2S,3S,4S,5S,6S,7S,8S,9S,10S" |
    | "D"   | "D"     | "10S,9S,8S,7S,6S,5S,4S,3S,2S,AS,JS,QS,KS" | "KS,QS,JS,AS,2S,3S,4S,5S,6S,7S,8S,9S,10S" |
    | "D"   | "H"     | "10S,9S,8S,7S,6S,5S,4S,3S,2S,AS,JS,QS,KS" | "KS,QS,JS,AS,2S,3S,4S,5S,6S,7S,8S,9S,10S" |
    | "D"   | "S"     | "10S,9S,8S,7S,6S,5S,4S,3S,2S,AS,JS,QS,KS" | "KS,QS,JS,AS,2S,3S,4S,5S,6S,7S,8S,9S,10S" |
