package net.codetojoy.utils;

import java.util.*;

public class Strings {
    private static final String COMMA = ",";

    public String shuffleCards(String s) {
        StringBuilder result = new StringBuilder();
        String[] tokens = s.split(COMMA);
        Collections.shuffle(Arrays.asList(tokens));

        var numTokens = tokens.length;
        var counter = 1;
        for (var token : tokens) {
            result.append(token);
            if (counter < numTokens) {
                result.append(COMMA);
            }
            counter++;
        }
        return result.toString();
    }
}
