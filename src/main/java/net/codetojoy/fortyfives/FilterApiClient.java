package net.codetojoy.fortyfives;

import net.codetojoy.Constants;
import net.codetojoy.http.Web;

import java.util.stream.*;
import java.io.IOException;
import java.net.URI;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.http.client.utils.URIBuilder;

public class FilterApiClient {
    private final String scheme;
    private final String host;
    private final String path;

    public FilterApiClient(String scheme, String host, String path) {
        this.scheme = scheme;
        this.host = host;
        this.path = path;
    }

    public String filterCandidates(String trump, String leading, boolean trumpPlayed, String cards) {
        var result = "";

        try {
             result = apiFilterCards(trump, leading, trumpPlayed, cards);
        } catch (Exception ex) {
            System.err.println("ERROR caught exception: " + ex.getMessage());
            result = ex.getMessage();
            // bail out for now
            // System.exit(-1);
        }

        return result;
    }

    private String apiFilterCards(String trump, String leading, boolean trumpPlayed, String cards) throws Exception {
        var uri = buildURI(trump, leading, trumpPlayed, cards);
        var result = new Web().get(uri);
        var apiResult = buildResult(result);
        var newCards = apiResult.getCards();

        return newCards;
    }

    private URI buildURI(String trump, String leading, boolean trumpPlayed, String cards) throws Exception {
        URIBuilder builder = new URIBuilder();

        builder.setScheme(scheme)
               .setHost(host)
               .setPath(path)
               .setParameter(Constants.TRUMP_PARAM, trump)
               .setParameter(Constants.LEADING_PARAM, leading)
               .setParameter(Constants.TRUMP_PLAYED_PARAM, "" + trumpPlayed)
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
