Feature: test rank

  Test the ranking of cards (either trump or otherwise)

  Scenario Outline: Clubs as Trump
    Given trump: <trump> leading: <leading> cards: <cards>
    And I shuffle
    When I sort cards by rank
    Then cards should be <expected>

    Examples:
    | trump | leading | cards         | expected |
    | "S"   | "U"     | "10H,9H,8H,7H,6H,5H,4H,3H,2H,AH,JH,QH,KH" | "AH,KH,QH,JH,10H,9H,8H,7H,6H,5H,4H,3H,2H" |
    | "S"   | "C"     | "10H,9H,8H,7H,6H,5H,4H,3H,2H,AH,JH,QH,KH" | "AH,KH,QH,JH,10H,9H,8H,7H,6H,5H,4H,3H,2H" |
    | "S"   | "D"     | "10H,9H,8H,7H,6H,5H,4H,3H,2H,AH,JH,QH,KH" | "AH,KH,QH,JH,10H,9H,8H,7H,6H,5H,4H,3H,2H" |
    | "S"   | "H"     | "10H,9H,8H,7H,6H,5H,4H,3H,2H,AH,JH,QH,KH" | "AH,KH,QH,JH,10H,9H,8H,7H,6H,5H,4H,3H,2H" |
    | "S"   | "S"     | "10H,9H,8H,7H,6H,5H,4H,3H,2H,AH,JH,QH,KH" | "AH,KH,QH,JH,10H,9H,8H,7H,6H,5H,4H,3H,2H" |
