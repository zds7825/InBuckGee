package koreatech.cse.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
                "version=1&lat=36.7637768&lon=127.2816014&appKey=500f2b80-1f13-3f58-9ff8-e109bcd884a6";

        String name;
        String tc;
        String humidity;
        try {
            URL url = new URL(urlDef);


            InputStreamReader isr = new InputStreamReader(url.openConnection().getInputStream(), "UTF-8");

            JSONObject obj = (JSONObject) JSONValue.parseWithException(isr);
            //JSONObject obj = (JSONObject)parser.parse(json);

            System.out.println(obj.toString());
            JSONObject res = (JSONObject) obj.get("weather");

            System.out.println(res.toString());
            JSONArray arr = (JSONArray) res.get("minutely");

            System.out.println(arr.toString());
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
    @RequestMapping("/life")
    public String life(){
        return "life";
    }

    @RequestMapping("/disaster")
    public String disaster(){
        return "disaster";
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
