/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.service;

import bootcamp.repository.SubjectRepo;
import bootcamp.entity.Subject;
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
public class SubjectService {
    
    @Autowired
    private SubjectRepo SubjectRepo;

    public List<Subject> getSubjects() {
        return SubjectRepo.findAll();
    }
    
    public Subject getSubject(int id) {
        return SubjectRepo.find(id);
    } 
    
}
