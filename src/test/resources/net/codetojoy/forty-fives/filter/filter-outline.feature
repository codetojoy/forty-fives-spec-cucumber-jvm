Feature: test get candidates

  Test "get candidates" in various forms

  Scenario Outline: Get Candidates for Hand
    Given trump: <trump> leading: <leading> played: <played> cards: <cards>
    And I shuffle
    When I filter for candidates
    Then cards should be <expected>

    Examples:
    | trump | leading | played  | cards             | expected          |
    | "C"   | "D"     | true    | "10C,9D,8D,7S,6H" | "10C,9D,8D"       |
    | "D"   | "U"     | false   | "10C,9D,8D,7S,6H" | "9D,8D,6H,7S,10C" |
    | "H"   | "D"     | true    | "10C,9D,8D,7S,6H" | "6H,9D,8D"        |
    | "S"   | "C"     | true    | "10C,9D,8D,7S,6H" | "7S,10C"          |
#
