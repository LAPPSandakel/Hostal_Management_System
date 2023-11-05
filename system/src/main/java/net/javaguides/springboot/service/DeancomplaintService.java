package net.javaguides.springboot.service;

import net.javaguides.springboot.Entity.Awcomplaint;
import net.javaguides.springboot.Entity.Deancomplaint;
import net.javaguides.springboot.repository.DeancomplaintRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DeancomplaintService implements DeancomplaintServiceImpl{

    @Autowired
    private DeancomplaintRepository deancomplaintRepository;

    public DeancomplaintService(DeancomplaintRepository deancomplaintRepository){
        super();
        this.deancomplaintRepository= deancomplaintRepository;
    }
    @Override
    public  Deancomplaint saveDeancomplaint(Deancomplaint deancomplaint) {
        return deancomplaintRepository.save(deancomplaint);
    }
    @Override
    public Iterable<Deancomplaint> getAllDeancomplaint() {
        return (List<Deancomplaint>) deancomplaintRepository.findAll();
    }


    @Override
    public Deancomplaint getDeancomplaintById(Long id) {
        Optional<Deancomplaint> deancomplaintOptional = deancomplaintRepository.findById(id);
        return deancomplaintOptional.orElse(null);
    }

}
