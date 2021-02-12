package bootcamp.controller;

import bootcamp.entity.Trainer;
import bootcamp.service.SubjectService;
import bootcamp.service.TrainerService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    public String showFormCreate(Model model) {

        model.addAttribute("subjects", subjectService.getSubjects());

        return "trainerFormCreate";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(@Valid @ModelAttribute("trainer") Trainer trainer, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model) {

        if (bindingResult.hasErrors()) {
            model.addAttribute("error", "An error occured, Trainer creation failed");
            return "error";
        }
        
        trainerService.addTrainer(trainer);
        redirectAttributes.addFlashAttribute("message", "Successfull creation");

        return "redirect:/trainer";
    }

    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable(name = "id") int id, RedirectAttributes redirectAttributes) {

        redirectAttributes.addFlashAttribute("message", "Successfull deletion");

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
    public String update(@Valid @ModelAttribute("trainer") Trainer trainer, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model) {

        if (bindingResult.hasErrors()) {
            model.addAttribute("error", "An error occured, Trainer updating failed");
            return "error";
        }

        trainerService.update(trainer);
        redirectAttributes.addFlashAttribute("message", "Successfull updating");

        return "redirect:/trainer";
    }

    @ExceptionHandler(Exception.class)
    public String handleException(Model model) {
        model.addAttribute("error", "An error occured");
        return "error";
    }

}
