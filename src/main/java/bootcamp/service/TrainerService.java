/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.service;

import bootcamp.repository.TrainerRepo;
import bootcamp.entity.Trainer;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Leyteris
 */
@Transactional
@Service
public class TrainerService {
    
    @Autowired
    private TrainerRepo trainerRepo;

    public List<Trainer> getTrainers() {
        return trainerRepo.findAll();
    }

    public void addTrainer(Trainer trainer) {
        trainerRepo.save(trainer);
    }

    public void delete(int id) {
        trainerRepo.delete(Trainer.class, id);
    }   

    public Trainer getTrainer(int id) {
        return trainerRepo.find(id);
    }    

    public void update(Trainer trainer) {
        trainerRepo.save(trainer);
    }

}
