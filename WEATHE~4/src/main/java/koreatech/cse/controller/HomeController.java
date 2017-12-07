package koreatech.cse.controller;

import koreatech.cse.parser.*;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
public class HomeController {
    @ModelAttribute("name")
    private String getName() {
        return "IamHomeControllerModelAttribute";
    }

    @RequestMapping
    public String home(Model model) throws IOException, ParseException {
        Home home = new Home();
        JSONObject h_value = home.apiParserSearch();
        JSONObject sky = (JSONObject) h_value.get("sky");
        JSONObject temperature = (JSONObject) h_value.get("temperature");

        String name = (String) sky.get("name");
        String tc = (String) temperature.get("tc");
        String humidity = (String) h_value.get("humidity");

        model.addAttribute("name", name);
        model.addAttribute("tc", tc);
        model.addAttribute("humidity", humidity);

        return "index";
    }

    @RequestMapping("/weather")
    public String weather() {

        return "weather";
    }

    @RequestMapping("/weather/{a}/{b}")
    public String weatherParsing(@PathVariable double a, @PathVariable double b, Model model) {
        Weather weather = new Weather();
        String rain4, rain7, rain10;
        String sky4, sky7, sky10;
        String humidity4, humidity7, humidity10;
        String temp4, temp7, temp10;

        try {
            JSONObject value = weather.apiParserSearch(a, b);
            JSONObject fcst3hour = (JSONObject) value.get("fcst3hour");

            JSONObject precipitation = (JSONObject) fcst3hour.get("precipitation");
            rain4 = (String) precipitation.get("prob4hour");
            rain7 = (String) precipitation.get("prob7hour");
            rain10 = (String) precipitation.get("prob10hour");

            JSONObject sky = (JSONObject) fcst3hour.get("sky");
            sky4 = (String) sky.get("name4hour");
            sky7 = (String) sky.get("name7hour");
            sky10 = (String) sky.get("name10hour");

            JSONObject humidity = (JSONObject) fcst3hour.get("humidity");
            humidity4 = (String) humidity.get("rh4hour");
            humidity7 = (String) humidity.get("rh7hour");
            humidity10 = (String) humidity.get("rh10hour");

            JSONObject temperature = (JSONObject) fcst3hour.get("temperature");
            temp4 = (String) temperature.get("temp4hour");
            temp7 = (String) temperature.get("temp7hour");
            temp10 = (String) temperature.get("temp10hour");


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

        } catch (IOException e) {
            System.out.println(e);
        }

        return "weatherParsing";
    }


    @RequestMapping("/life")
    public String life() {
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
    public String earth(Model model) throws Exception {
        Earthquake earth = new Earthquake();
        String value = earth.apiParserSearch();
        model.addAttribute("value", value);
        return "test";
    }

    @RequestMapping("/good")
    public String good() {
        return "good";
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

    @RequestMapping("/aboutAPI")
    public String openApi() {

        return "aboutAPI";
    }

    /*
    @RequestMapping("/getApiByMap/36.763776/127.2816014")
    public String openapi() {

        return "openapi";
    }
    */
}
