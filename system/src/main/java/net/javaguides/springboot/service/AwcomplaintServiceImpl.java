package net.javaguides.springboot.service;

import net.javaguides.springboot.Entity.Awcomplaint;

public interface AwcomplaintServiceImpl {

    Awcomplaint saveAwcomplaint(Awcomplaint awcomplaint);


    Iterable<Awcomplaint> getAllAwcomplaint();

    Awcomplaint getAwcomplaintById(Long id);

}
