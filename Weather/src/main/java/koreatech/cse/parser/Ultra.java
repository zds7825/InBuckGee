package koreatech.cse.parser;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.ParseException;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;

public class Ultra {

    public String urlDef = "http://apis.skplanetx.com/weather/windex/uvindex";
    public String params = "?version=1";

    public String apiParserSearch(double a, double b) throws IOException {
        System.out.println(a);
        System.out.println(b);
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
        JSONObject res1 = (JSONObject) res.get("wIndex");
        JSONArray arr = (JSONArray) res1.get("uvindex");

        //System.out.println(arr.toString());
        JSONObject arr1 = (JSONObject) arr.get(0);

        JSONObject sky = (JSONObject) arr1.get("day00");

        String s = (String) sky.get("index");
        s += (" " + (String) sky.get("comment"));

        //String s = arr.getJSONObject(0).getJSONObject("sky").getString("name");
        System.out.println(s);

        return s;
    }
}
