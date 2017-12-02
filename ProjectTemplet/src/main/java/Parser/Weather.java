package Parser;


import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.ParseException;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.*;

public class Weather {

    public String urlDef = "http://apis.skplanetx.com/weather/current/minutely";
    public String params = "?version=1";

    public String apiParserSearch() throws IOException {
        params += "&lat=" + Double.toString(37.11);
        params += "&lon=" + Double.toString(128.22);
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
        JSONArray arr = (JSONArray) res.get("minutely");

        //System.out.println(arr.toString());
        JSONObject arr1 = (JSONObject) arr.get(0);

        JSONObject sky = (JSONObject) arr1.get("sky");

        String s = (String) sky.get("name");

        //String s = arr.getJSONObject(0).getJSONObject("sky").getString("name");
        //System.out.println(s);

        return s;
    }
}