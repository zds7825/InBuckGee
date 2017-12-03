package koreatech.cse.parser;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.ParseException;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

public class Weather {

    public String urlDef = "http://apis.skplanetx.com/weather/forecast/3days";
    public String params = "?version=1";

    public JSONObject apiParserSearch(String a, String b) throws IOException {
        params += "&lat=" + a;
        params += "&lon=" + b;
        params += "&appKey=" + "500f2b80-1f13-3f58-9ff8-e109bcd884a6";
        urlDef += params;
        URL url = null;
        url = new URL(urlDef);
        InputStreamReader isr = null;
        isr = new InputStreamReader(url.openConnection().getInputStream(), "UTF-8");
        JSONObject obj = null;
        try {
            obj = (JSONObject) JSONValue.parseWithException(isr);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        //JSONObject obj = (JSONObject)parser.parse(json);
        //System.out.println(obj.toString());
        JSONObject res = (JSONObject) obj.get("weather");

        //System.out.println(res.toString());
        JSONArray arr = (JSONArray) res.get("forecast3days");

        //System.out.println(arr.toString());
        JSONObject arr1 = (JSONObject) arr.get(0);



        return arr1;
    }
}