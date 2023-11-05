package net.javaguides.springboot.service;

import net.javaguides.springboot.Entity.Complaint;
import net.javaguides.springboot.repository.ComplaintRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ComplaintService implements ComplaintServiceImpl{

    @Autowired
    private ComplaintRepository complaintRepository;

    public ComplaintService(ComplaintRepository complaintRepository){
        super();
        this.complaintRepository=complaintRepository;
    }
    @Override
    public  Complaint saveComplaint(Complaint complaint) {
        return complaintRepository.save(complaint);
    }
    @Override
    public Iterable<Complaint> getAllComplaint() {
        return (List<Complaint>) complaintRepository.findAll();
    }


    @Override
    public Complaint getComplaintById(Long id) {
        Optional<Complaint> complaintOptional = complaintRepository.findById(id);
        return complaintOptional.orElse(null);
    }
}
