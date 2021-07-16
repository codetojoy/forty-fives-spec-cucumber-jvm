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
#
    | "H"   | "U"     | "2D,5C,8H,AS,KC"  | "8H,KC,AS,5C,2D" |
    | "H"   | "C"     | "2D,5C,8H,AS,KC"  | "8H,KC,5C,AS,2D" |
    | "H"   | "D"     | "2D,5C,8H,AS,KC"  | "8H,2D,KC,AS,5C" |
    | "H"   | "S"     | "2D,5C,8H,AS,KC"  | "8H,AS,KC,5C,2D" |
    | "C"   | "U"     | "2D,5C,8H,AS,KC"  | "5C,KC,AS,8H,2D" |
#
    | "H"   | "U"     | "5H,AH,5D,AD,JH"  | "5H,JH,AH,5D,AD" |
    | "H"   | "C"     | "5H,AH,5D,AD,JH"  | "5H,JH,AH,5D,AD" |
    | "H"   | "D"     | "5H,AH,5D,AD,JH"  | "5H,JH,AH,5D,AD" |
    | "H"   | "S"     | "5H,AH,5D,AD,JH"  | "5H,JH,AH,5D,AD" |
    | "D"   | "U"     | "5H,AH,5D,AD,JH"  | "5D,AH,AD,JH,5H" |
#
    | "S"   | "U"     | "4H,8D,10C,9D,8S" | "8S,9D,8D,4H,10C" |
    | "S"   | "C"     | "4H,8D,10C,9D,8S" | "8S,10C,9D,8D,4H" |
    | "S"   | "D"     | "4H,8D,10C,9D,8S" | "8S,9D,8D,4H,10C" |
    | "S"   | "H"     | "4H,8D,10C,9D,8S" | "8S,4H,9D,8D,10C" |
    | "H"   | "U"     | "4H,8D,10C,9D,8S" | "4H,9D,8D,8S,10C" |









