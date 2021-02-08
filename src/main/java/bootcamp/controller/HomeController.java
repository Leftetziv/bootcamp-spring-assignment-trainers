package bootcamp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/") 
public class HomeController {
    

    
    @RequestMapping("/")
    public String showHome(Model model){ 
        
        model.addAttribute("mymessage", "hello");
        
        return "home";
    }
    
 
}
