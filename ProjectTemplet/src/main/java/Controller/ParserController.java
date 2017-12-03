package Controller;

import Parser.Dust;
import Parser.Earthquake;
import Parser.Ultra;
import Parser.Weather;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.ArrayList;

@Controller
public class ParserController {

    @RequestMapping("/earth")
    public String earth(Model model) throws Exception {
        Earthquake earth = new Earthquake();
        ArrayList<String> arr = earth.apiParserSearch();
        model.addAttribute("arr", arr);
        return "earth";
    }

    @RequestMapping("/weather/{a}/{b}")
    public String weather(@PathVariable double a,
                          @PathVariable double b,
                          Model model) throws IOException, ParseException {
        Weather weather = new Weather();
        String value = weather.apiParserSearch(a,b);
        model.addAttribute("value", value);
        return "weather";
    }

    @RequestMapping("/dust/{a}/{b}")
    public String dust(@PathVariable double a,
                       @PathVariable double b,
                       Model model) throws IOException {
        Dust dust = new Dust();
        String dustV = dust.apiParserSearch(a,b);
        model.addAttribute("dustV", dustV);
        return "dust";
    }

    @RequestMapping("/ultra/{a}/{b}")
    public String ultra(@PathVariable double a,
        @PathVariable double b,
        Model model) throws IOException {
            Ultra ultra = new Ultra();
            String ultraV = ultra.apiParserSearch(a, b);
        model.addAttribute("ultraV", ultraV);
        return "ultra";
    }
}
