package bootcamp.controller;

import bootcamp.entity.Subject;
import bootcamp.entity.Trainer;
import bootcamp.service.SubjectService;
import bootcamp.service.TrainerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/trainer")
public class TrainerController {

    @Autowired
    private TrainerService trainerService;

    @Autowired
    private SubjectService subjectService;

    @RequestMapping
    public String showTrainers(Model model) {
        model.addAttribute("listOfTrainers", trainerService.getTrainers());

        return "trainerList";
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showFormCreate(@ModelAttribute("trainer") Trainer trainer, Model model) {
//        System.out.println(trainer);
        
        model.addAttribute("subjects", subjectService.getSubjects());

        return "trainerFormCreate";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(@ModelAttribute("trainer") Trainer trainer, RedirectAttributes redirectAttributes) {
        System.out.println(trainer);
        
        trainerService.addTrainer(trainer);
        redirectAttributes.addFlashAttribute("message", "Successfull creation");

        return "redirect:/trainer";
    }

    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable(name = "id") int id) {

        trainerService.delete(id);

        return "redirect:/trainer";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String showFormUpdate(@PathVariable(name = "id") int id, Model model) {

        model.addAttribute("trainer", trainerService.getTrainer(id));
        model.addAttribute("subjects", subjectService.getSubjects());
        
        return "trainerFormUpdate";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@ModelAttribute("trainer") Trainer trainer, RedirectAttributes redirectAttributes) {
        System.out.println(trainer);
        
        trainerService.update(trainer);

        redirectAttributes.addFlashAttribute("message", "Successfull updating");

        return "redirect:/trainer";
    }

}
