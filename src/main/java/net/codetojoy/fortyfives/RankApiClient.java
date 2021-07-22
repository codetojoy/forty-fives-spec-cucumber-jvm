package net.codetojoy.fortyfives;

import net.codetojoy.Constants;
import net.codetojoy.http.Web;

import java.util.stream.*;
import java.io.IOException;
import java.net.URI;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.http.client.utils.URIBuilder;

public class RankApiClient {
    private final String scheme;
    private final String host;
    private final String path;

    public RankApiClient(String scheme, String host, String path) {
        this.scheme = scheme;
        this.host = host;
        this.path = path;
    }

    public String rankCards(String trump, String leading, String cards) {
        var result = "";

        try {
             result = apiRankCards(trump, leading, cards);
        } catch (Exception ex) {
            System.err.println("ERROR caught exception: " + ex.getMessage());
            result = ex.getMessage();
            // bail out for now
            // System.exit(-1);
        }

        return result;
    }

    private String apiRankCards(String trump, String leading, String cards) throws Exception {
        var uri = buildURI(trump, leading, cards);
        var result = new Web().get(uri);
        var apiResult = buildResult(result);
        var newCards = apiResult.getCards();

        return newCards;
    }

    private URI buildURI(String trump, String leading, String cards) throws Exception {
        URIBuilder builder = new URIBuilder();

        builder.setScheme(scheme)
               .setHost(host)
               .setPath(path)
               .setParameter(Constants.TRUMP_PARAM, trump)
               .setParameter(Constants.LEADING_PARAM, leading)
               .setParameter(Constants.CARDS_PARAM, cards);

        URI uri = builder.build();

        return uri;
    }

    protected ApiResult buildResult(String str) throws Exception {
        ObjectMapper mapper = new ObjectMapper();
        ApiResult result = mapper.readValue(str, ApiResult.class);
        return result;
    }
}
