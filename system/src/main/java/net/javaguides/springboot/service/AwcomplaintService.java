package net.javaguides.springboot.service;

import net.javaguides.springboot.Entity.Awcomplaint;
import net.javaguides.springboot.repository.AwcomplaintRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AwcomplaintService implements AwcomplaintServiceImpl{

    @Autowired
    private AwcomplaintRepository awcomplaintRepository;

    public AwcomplaintService(AwcomplaintRepository awcomplaintRepository){
        super();
        this.awcomplaintRepository= awcomplaintRepository;
    }
    @Override
    public  Awcomplaint saveAwcomplaint(Awcomplaint awcomplaint) {
        return awcomplaintRepository.save(awcomplaint);
    }
    @Override
    public Iterable<Awcomplaint> getAllAwcomplaint() {
        return (List<Awcomplaint>) awcomplaintRepository.findAll();
    }


    @Override
    public Awcomplaint getAwcomplaintById(Long id) {
        Optional<Awcomplaint> awcomplaintOptional = awcomplaintRepository.findById(id);
        return awcomplaintOptional.orElse(null);
    }


}
