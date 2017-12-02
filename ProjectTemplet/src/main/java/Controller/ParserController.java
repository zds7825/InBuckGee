package Controller;

import Parser.Earthquake;
import Parser.Weather;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.ArrayList;

@Controller
public class ParserController {

    @RequestMapping("/Index")
    public String inedx() {
        return "index";
    }

    @RequestMapping("/earth")
    public String earth(Model model) throws Exception {
        Earthquake earth = new Earthquake();
        ArrayList<String> arr = earth.apiParserSearch();
        model.addAttribute("arr", arr);
        return "earth";
    }


    @RequestMapping("/weather")
        public String weather(Model model) throws IOException, ParseException {
        Weather weather = new Weather();
        String value = weather.apiParserSearch();
        model.addAttribute("value", value);
        return "weather";
    }

}
