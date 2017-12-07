package koreatech.cse.parser;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.ParseException;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

public class Home {
    public String urlDef = "http://apis.skplanetx.com/weather/current/minutely?" +
            "version=1&lat=36.7637768&lon=127.2816014&appKey=d1925a87-c06b-32d3-8be8-cffbe20c8eb8";

    public JSONObject apiParserSearch() throws IOException, ParseException {
        String name;
        String tc;
        String humidity;

        URL url = new URL(urlDef);

        InputStreamReader isr = new InputStreamReader(url.openConnection().getInputStream(), "UTF-8");

        JSONObject obj = (JSONObject) JSONValue.parseWithException(isr);

        JSONObject res = (JSONObject) obj.get("weather");

        JSONArray arr = (JSONArray) res.get("minutely");

        JSONObject arr1 = (JSONObject) arr.get(0);

        return arr1;
    }

}
