package Parser;


import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.ParseException;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

public class Dust {

    public String urlDef = "http://apis.skplanetx.com/weather/dust";
    public String params = "?version=1";

    public String apiParserSearch(double a, double b) throws IOException {
        params += "&lat=" + Double.toString(a);
        params += "&lon=" + Double.toString(b);
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
        JSONArray arr = (JSONArray) res.get("dust");

        //System.out.println(arr.toString());
        JSONObject arr1 = (JSONObject) arr.get(0);

        JSONObject sky = (JSONObject) arr1.get("pm10");

        String s = (String) sky.get("grade");

        //String s = arr.getJSONObject(0).getJSONObject("sky").getString("name");
        System.out.println(s);

        return s;
    }
}