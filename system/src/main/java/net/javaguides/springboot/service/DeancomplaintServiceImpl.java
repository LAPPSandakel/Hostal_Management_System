package net.javaguides.springboot.service;

import net.javaguides.springboot.Entity.Deancomplaint;

public interface DeancomplaintServiceImpl {
    Deancomplaint saveDeancomplaint(Deancomplaint deancomplaint);

    Iterable<Deancomplaint> getAllDeancomplaint();

    Deancomplaint getDeancomplaintById(Long id);
}
