Feature: test rank

  Test the ranking of cards (either trump or otherwise)

  Scenario Outline: Random mixed cards
    Given trump: <trump> leading: <leading> cards: <cards>
    And I shuffle
    When I sort cards by rank
    Then cards should be <expected>

    Examples:
    | trump | leading | cards             | expected |
    | "C"   | "U"     | "QD,10S,AD,2C,5H" | "2C,QD,5H,AD,10S" |
    | "C"   | "D"     | "QD,10S,AD,2C,5H" | "2C,QD,AD,5H,10S" |
    | "D"   | "H"     | "QD,10S,AD,2C,5H" | "AD,QD,5H,2C,10S" |
    | "H"   | "S"     | "QD,10S,AD,2C,5H" | "5H,10S,QD,2C,AD" |
    | "S"   | "U"     | "QD,10S,AD,2C,5H" | "10S,QD,2C,5H,AD" |
#
    | "S"   | "U"     | "8H,8C,2H,AD,AS"  | "AS,8H,8C,2H,AD" |
    | "S"   | "C"     | "8H,8C,2H,AD,AS"  | "AS,8C,8H,2H,AD" |
    | "S"   | "D"     | "8H,8C,2H,AD,AS"  | "AS,AD,8H,8C,2H" |
    | "S"   | "H"     | "8H,8C,2H,AD,AS"  | "AS,8H,2H,8C,AD" |
    | "D"   | "U"     | "8H,8C,2H,AD,AS"  | "AD,AS,8H,8C,2H" |
