
package net.codetojoy;

import net.codetojoy.fortyfives.PingRemote;

import java.util.*;

public class Runner {
    void run() {
        var scheme = Constants.SCHEME;
        var host = Constants.FORTY_FIVES_HOST;
        var path = Constants.FORTY_FIVES_PING_PATH;

        var pingRemote = new PingRemote(scheme, host, path);
        System.out.println("TRACER ping: " + pingRemote.ping());
    }

    public static void main(String[] args) {
        new Runner().run();
        System.out.println("Ready.");
    }
}
