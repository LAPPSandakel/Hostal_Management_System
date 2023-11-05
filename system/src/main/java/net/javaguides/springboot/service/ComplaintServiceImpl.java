package net.javaguides.springboot.service;

import net.javaguides.springboot.Entity.Complaint;
import net.javaguides.springboot.Entity.Deancomplaint;

public interface ComplaintServiceImpl {
    Complaint saveDeancomplaint(Deancomplaint deancomplaint);

    Iterable<Deancomplaint> getAllDeancomplaint();

    Deancomplaint getDeancomplaintById(Long id);
}
