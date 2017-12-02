package koreatech.cse.controller.rest;

import jdk.nashorn.internal.parser.JSONParser;
import jdk.nashorn.internal.parser.Scanner;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.*;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.print.DocFlavor;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.*;
import java.nio.Buffer;

@RestController
@RequestMapping("/weather")
public class WeatherController {


    //void todayWeather(double lat, double lon, String appKey){

    @RequestMapping
    public String home() {
        String urlDef = "http://apis.skplanetx.com/weather/current/minutely";
        String params = "?version=1";

        params += "&lat=" + Double.toString(37.11);
        params += "&lon=" + Double.toString(128.22);
        params += "&appKey=" + "500f2b80-1f13-3f58-9ff8-e109bcd884a6";

        urlDef += params;

        try {

            /*
            String json;
            BufferedReader br;
            URL url;
            HttpURLConnection conn;
            String protocol = "GET";

            url = new URL(urlDef);
            conn = (HttpURLConnection)url.openConnection();
            conn.setRequestMethod(protocol);
            br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            json = br.readLine();

            org.json.simple.parser.JSONParser parser = new org.json.simple.parser.JSONParser();

            */

            /*
            URL url = new URL(urlDef);


            //BufferedReader input = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
/*
            HttpURLConnection conn = (HttpURLConnection)new URL(urlDef) .openConnection();
            BufferedReader input = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));


            while((line=input.readLine())!=null){

            }

            java.util.Scanner scan = new java.util.Scanner(url.openStream());
            String str = new String();
            while(scan.hasNext())
                str += scan.nextLine();
            scan.close();*/


           //org.json.JSONObject obj = //new org.json.JSONObject(str);

            URL url = new URL(urlDef);

            InputStreamReader isr = new InputStreamReader(url.openConnection().getInputStream(), "UTF-8");

            JSONObject obj = (JSONObject)JSONValue.parseWithException(isr);
            //JSONObject obj = (JSONObject)parser.parse(json);

            System.out.println(obj.toString());
            JSONObject res = (JSONObject)obj.get("weather");

            System.out.println(res.toString());
            JSONArray arr = (JSONArray)res.get("minutely");

            System.out.println(arr.toString());
            JSONObject arr1 = (JSONObject) arr.get(0);

            JSONObject sky = (JSONObject)arr1.get("sky");

            String s = (String)sky.get("name");

            //String s = arr.getJSONObject(0).getJSONObject("sky").getString("name");
            System.out.println(s);
        } catch (MalformedURLException e) {
            System.out.println(e.getMessage());
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return "hello";
    }
}
