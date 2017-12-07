package koreatech.cse.controller.rest;

import koreatech.cse.parser.*;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Controller
public class OpenApiController {

    @RequestMapping(value = "/getApiByMap/{a}/{b}")
    public @ResponseBody
    Map<String, Object> getJsonByMap(@PathVariable double a, @PathVariable double b) throws Exception {
        Home home = new Home();
        Weather weather = new Weather();
        Ultra ultra = new Ultra();
        Dust dust = new Dust();
        Earthquake earth = new Earthquake();

        Map<String, Object> jsonObject = new HashMap<String, Object>();
        Map<String, Object> jsonSubObject = new HashMap<String, Object>();
        Map<String, Object> component = null;
        ArrayList<Map<String, Object>> jsonWList = new ArrayList<Map<String, Object>>();
        ArrayList<Map<String, Object>> jsonList = new ArrayList<Map<String, Object>>();

        JSONObject home_value = home.apiParserSearch();
        JSONObject sky = (JSONObject) home_value.get("sky");
        JSONObject temperature = (JSONObject) home_value.get("temperature");
        String name = (String) sky.get("name");
        String tc = (String) temperature.get("tc");
        String humidity = (String) home_value.get("humidity");

        JSONObject weather_value = weather.apiParserSearch(a, b);
        JSONObject fcst3hour = (JSONObject) weather_value.get("fcst3hour");

        JSONObject precipitation = (JSONObject) fcst3hour.get("precipitation");
        String rain4 = (String) precipitation.get("prob4hour");
        String rain7 = (String) precipitation.get("prob7hour");
        String rain10 = (String) precipitation.get("prob10hour");

        JSONObject skys = (JSONObject) fcst3hour.get("sky");
        String sky4 = (String) skys.get("name4hour");
        String sky7 = (String) skys.get("name7hour");
        String sky10 = (String) skys.get("name10hour");

        JSONObject humiditys = (JSONObject) fcst3hour.get("humidity");
        String humidity4 = (String) humiditys.get("rh4hour");
        String humidity7 = (String) humiditys.get("rh7hour");
        String humidity10 = (String) humiditys.get("rh10hour");

        JSONObject temperatures = (JSONObject) fcst3hour.get("temperature");
        String temp4 = (String) temperatures.get("temp4hour");
        String temp7 = (String) temperatures.get("temp7hour");
        String temp10 = (String) temperatures.get("temp10hour");

        String ultra_value = ultra.apiParserSearch(a, b);
        String ultra_v = null;
        String ultra_s = null;

        if (!ultra_value.equals(" ")) {
            String[] ultra_value_s = ultra_value.split(" ");

            for (int i = 2; i < ultra_value_s.length; i++) {
                ultra_value_s[1] += (" " + ultra_value_s[i]);
            }

            ultra_v = ultra_value_s[0];
            ultra_s = ultra_value_s[1];
        }

        String dust_value = dust.apiParserSearch(a, b);

        String earth_value = earth.apiParserSearch();
        String[] earth_value_s = earth_value.split(" ");
        System.out.println(earth_value_s.length + " * ");
        int size = earth_value_s.length;
        String[] earth_real = new String[size/2];

        int k = 0;
        for(int i = 0; i < earth_value_s.length; i+=2) {
            earth_real[k] = earth_value_s[i] + " " + earth_value_s[i+1];
            // System.out.println(earth_real[k] + " / " + k);
            k++;
        }

        // ----------------------------------------------------------------

        component = new HashMap<String, Object>();
        component.put("sky", name);
        component.put("temperature", tc);
        component.put("humidity", humidity);
        jsonWList.add(component);
        jsonSubObject.put("Now", jsonWList);

        component = new HashMap<String, Object>();
        jsonWList = new ArrayList<Map<String, Object>>();
        component.put("sky", sky4);
        component.put("temperature", temp4);
        component.put("humidity", humidity4);
        component.put("rain", rain4);
        jsonWList.add(component);
        jsonSubObject.put("After4h", jsonWList);

        component = new HashMap<String, Object>();
        jsonWList = new ArrayList<Map<String, Object>>();
        component.put("sky", sky7);
        component.put("temperature", temp7);
        component.put("humidity", humidity7);
        component.put("rain", rain7);
        jsonWList.add(component);
        jsonSubObject.put("After7h", jsonWList);

        component = new HashMap<String, Object>();
        jsonWList = new ArrayList<Map<String, Object>>();
        component.put("sky", sky10);
        component.put("temperature", temp10);
        component.put("humidity", humidity10);
        component.put("rain", rain10);
        jsonWList.add(component);
        jsonSubObject.put("After10h", jsonWList);

        jsonList.add(jsonSubObject);
        jsonObject.put("Weather", jsonList);


        component = new HashMap<String, Object>();
        jsonSubObject = new HashMap<String, Object>();
        jsonWList = new ArrayList<Map<String, Object>>();
        jsonSubObject.put("Dust", dust_value);

        component.put("Strength", ultra_v);
        component.put("Suggestion", ultra_s);

        jsonSubObject.put("Ultra", component);
        jsonWList.add(jsonSubObject);
        jsonObject.put("Life", jsonWList);

        component = new HashMap<String, Object>();
        jsonSubObject = new HashMap<String, Object>();
        jsonWList = new ArrayList<Map<String, Object>>();

        for(int i = 0; i < earth_real.length; i++)
            component.put("Position"+i, earth_real[i]);

        jsonSubObject.put("Location", component);
        jsonWList.add(jsonSubObject);
        jsonObject.put("Earthquake", jsonWList);

        System.out.println(jsonObject);
        return jsonObject;
    }
}