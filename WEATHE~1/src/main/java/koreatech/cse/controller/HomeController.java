package koreatech.cse.controller;

import koreatech.cse.parser.Dust;
import koreatech.cse.parser.Ultra;
import koreatech.cse.parser.Weather;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import static java.awt.SystemColor.window;

@Controller
@RequestMapping("/")
public class HomeController {
    @ModelAttribute("name")
    private String getName() {
        return "IamHomeControllerModelAttribute";
    }

    @RequestMapping
    public String home(Model model) {

        String urlDef = "http://apis.skplanetx.com/weather/current/minutely?" +
                "version=1&lat=36.7637768&lon=127.2816014&appKey=d1925a87-c06b-32d3-8be8-cffbe20c8eb8";

        String name;
        String tc;
        String humidity;
        try {
            URL url = new URL(urlDef);


            InputStreamReader isr = new InputStreamReader(url.openConnection().getInputStream(), "UTF-8");

            JSONObject obj = (JSONObject) JSONValue.parseWithException(isr);
            //JSONObject obj = (JSONObject)parser.parse(json);


            JSONObject res = (JSONObject) obj.get("weather");


            JSONArray arr = (JSONArray) res.get("minutely");


            JSONObject arr1 = (JSONObject) arr.get(0);

            JSONObject sky = (JSONObject) arr1.get("sky");
            JSONObject temperature = (JSONObject) arr1.get("temperature");


            name = (String) sky.get("name");
            tc = (String) temperature.get("tc");
            humidity = (String)arr1.get("humidity");


            model.addAttribute("name", name);
            model.addAttribute("tc", tc);
            model.addAttribute("humidity", humidity);

        }catch(MalformedURLException e){
            System.out.println(e.getMessage());
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return "index";
    }

    @RequestMapping("/weather")
    public String weather(){

        return "weather";
    }

    @RequestMapping("/weather/{a}/{b}")
    public String weatherParsing(@PathVariable String a, @PathVariable String b, Model model) {


        Weather weather = new Weather();
        String rain4, rain7, rain10;
        String sky4, sky7, sky10;
        String humidity4, humidity7, humidity10;
        String temp4, temp7, temp10;

        try {
            JSONObject value = weather.apiParserSearch(a, b);
            JSONObject fcst3hour = (JSONObject)value.get("fcst3hour");

            JSONObject precipitation = (JSONObject)fcst3hour.get("precipitation");
            rain4 = (String)precipitation.get("prob4hour");
            rain7 = (String)precipitation.get("prob7hour");
            rain10 = (String)precipitation.get("prob10hour");

            JSONObject sky = (JSONObject)fcst3hour.get("sky");
            sky4 = (String)sky.get("name4hour");
            sky7 = (String)sky.get("name7hour");
            sky10 = (String)sky.get("name10hour");

            JSONObject humidity = (JSONObject)fcst3hour.get("humidity");
            humidity4 = (String)humidity.get("rh4hour");
            humidity7 = (String)humidity.get("rh7hour");
            humidity10 = (String)humidity.get("rh10hour");

            JSONObject temperature = (JSONObject)fcst3hour.get("temperature");
            temp4 = (String)temperature.get("temp4hour");
            temp7 = (String)temperature.get("temp7hour");
            temp10 = (String)temperature.get("temp10hour");





            model.addAttribute("rain4", rain4);
            model.addAttribute("rain7", rain7);
            model.addAttribute("rain10", rain10);
            model.addAttribute("sky4", sky4);
            model.addAttribute("sky7", sky7);
            model.addAttribute("sky10", sky10);
            model.addAttribute("humidity4", humidity4);
            model.addAttribute("humidity7", humidity7);
            model.addAttribute("humidity10", humidity10);
            model.addAttribute("temp4", temp4);
            model.addAttribute("temp7", temp7);
            model.addAttribute("temp10", temp10);

        }catch (IOException e){
            System.out.println(e);
        }



        return "weatherParsing";
    }




    @RequestMapping("/life")
    public String life(){
        return "life";
    }

    @RequestMapping("/life/{a}/{b}")
    public String life(@PathVariable double a, @PathVariable double b, Model model) throws IOException {
        Dust dust = new Dust();
        String dustData = dust.apiParserSearch(a, b);
        Ultra ultra = new Ultra();
        String ultraData = ultra.apiParserSearch(a, b);

        model.addAttribute("dustData", dustData);
        model.addAttribute("ultraData", ultraData);
        return "lifeParsing";
    }

    @RequestMapping("/test")
    public String disaster(){
        return "test";
    }

    @RequestMapping("/jstlTest")
    public String emptyTest(Model model) {
        String a = null;
        String b = "";
        String c = "hello";
        List<String> d = new ArrayList<String>();
        List<String> e = new ArrayList<String>();
        e.add(a);
        e.add(b);

        model.addAttribute("a", a);
        model.addAttribute("b", b);
        model.addAttribute("c", c);
        model.addAttribute("d", d);
        model.addAttribute("e", e);

        List<String> stringArray = new ArrayList<String>();
        stringArray.add("one");
        stringArray.add("two");
        stringArray.add("three");
        model.addAttribute("stringArray", stringArray);

        Map<Integer, String> stringMap = new HashMap<Integer, String>();
        stringMap.put(1, "one");
        stringMap.put(2, "two");
        stringMap.put(3, "three");
        model.addAttribute("stringMap", stringMap);

        return "jstlTest";
    }


}
