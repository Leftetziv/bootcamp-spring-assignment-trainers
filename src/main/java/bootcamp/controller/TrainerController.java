package bootcamp.controller;

import bootcamp.entity.Trainer;
import bootcamp.service.TrainerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/trainer")
public class TrainerController {

    @Autowired
    private TrainerService trainerService;

    
    @RequestMapping
    public String showTrainers(Model model) {
        model.addAttribute("listOfTrainers", trainerService.getTrainers());

        return "trainerList";
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showFormCreate() {
        return "trainerFormCreate";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(Trainer trainer, RedirectAttributes redirectAttributes) {

        trainerService.addTrainer(trainer);
        redirectAttributes.addFlashAttribute("message", "Successfull creation");

        return "redirect:/";
    }

    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable(name = "id") int id) {

        trainerService.delete(id);

        return "redirect:/";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String showFormUpdate(@PathVariable(name = "id") int id, Model model) {

        Trainer trainer = trainerService.getTrainer(id);

        model.addAttribute("trainerToEdit", trainer);

        return "trainerFormUpdate";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(Trainer trainer, RedirectAttributes redirectAttributes) {

        trainerService.update(trainer);

        redirectAttributes.addFlashAttribute("message", "Successfull updating");

        return "redirect:/";
    }

}
