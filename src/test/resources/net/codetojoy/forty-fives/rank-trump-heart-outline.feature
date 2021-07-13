Feature: test rank

  Test the ranking of cards (either trump or otherwise)

  Scenario Outline: Hearts as Trump
    Given trump: <trump> leading: <leading> cards: <cards>
    And I shuffle
    When I sort cards by rank
    Then cards should be <expected>

    Examples:
    | trump | leading | cards         | expected |
    | "H"   | "U"     | "10H,9H,8H,7H,6H,5H,4H,3H,2H,AH,JH,QH,KH" | "5H,JH,AH,KH,QH,10H,9H,8H,7H,6H,4H,3H,2H" | 
