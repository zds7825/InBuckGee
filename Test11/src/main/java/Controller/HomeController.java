package Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

@Controller
// @RequestMapping("/my") // 이렇게 만들어 줄 수도 있다!
public class HomeController {

    @RequestMapping(value="/", method= RequestMethod.GET)
    public String home(Model model) {
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
        String formatedDate = dateFormat.format(date);
        model.addAttribute("serverTime", formatedDate);
        return "index";
    }

    @RequestMapping("/board/content")
    public String content(Model model) {
        // 컨트롤러에서 view 쪽으로 데이터를 줄 때, 데이터를 전달하는 객체 : model
        model.addAttribute("id", 30);
        return "board/content";
    }

    @RequestMapping("/board/reply")
    public ModelAndView reply() {
        // 데이터와 뷰의 짬봉
        ModelAndView mv = new ModelAndView();
        mv.addObject("id", 30);
        mv.setViewName("board/reply");
        return mv;
    }

    @RequestMapping("/board/confirmId")
    // annotation으로 지정한 변수의 값이 없어도 된다.
    public String confirmId(HttpServletRequest httpServletRequset, Model model) {
        String id = httpServletRequset.getParameter("id");
        String pw = httpServletRequset.getParameter("pw");
        model.addAttribute("id",id);
        model.addAttribute("pw", pw);
        return "board/confirmId";
    }

    @RequestMapping("/board/confirmId2")
    // annotation으로 지정한 변수의 값이 꼭 있어야 한다!
    public String confirmId2(@RequestParam("id") String id, @RequestParam("pw") int pw, Model model) {
        model.addAttribute("identify", id);
        model.addAttribute("password", pw);
        return "board/confirmId2";
    }

    @RequestMapping("/earth")
    public String earth(Model model) throws Exception {
        Parser par = new Parser();
        ArrayList<String> arr = par.apiParserSearch();
        model.addAttribute("arr", arr);
        return "earth";
    }
}
