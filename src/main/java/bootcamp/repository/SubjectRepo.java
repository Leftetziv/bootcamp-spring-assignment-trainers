/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.repository;

import bootcamp.entity.Subject;
import bootcamp.entity.Trainer;
import java.util.List;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Leyteris
 */
@Repository
public class SubjectRepo extends HibernateUtil<Subject>{
    
    public List<Subject> findAll() {
        return super.findAll("Subject.findAll");
    }
    
    public Subject find(int id) {
        return super.find(Subject.class, id);
    } 
    
}
