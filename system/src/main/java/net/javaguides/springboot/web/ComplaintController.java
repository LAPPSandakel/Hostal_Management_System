package net.javaguides.springboot.web;

import net.javaguides.springboot.Entity.Complaint;
import net.javaguides.springboot.repository.ComplaintRepository;
import net.javaguides.springboot.service.ComplaintService;
import net.javaguides.springboot.service.ComplaintServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@CrossOrigin
@RequestMapping("/complaint")

public class ComplaintController {

    @Autowired
    ComplaintServiceImpl complaintService;


        @GetMapping("/view")
        @ResponseBody
        public ResponseEntity<List<Complaint>> listComplaint() {
            Iterable<Complaint> complaintsList = complaintService.getAllComplaint();
            return ResponseEntity.ok((List<Complaint>) complaintsList);
        }



    @PostMapping("/saveData")
    public ResponseEntity<String> saveComplaint(@RequestBody Complaint complaint) {
        try {
            // Save complaint to the database
            complaintService.saveComplaint(complaint);
            return ResponseEntity.ok("Complaint saved successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error occurred while saving Complaint: " + e.getMessage());
        }
    }
}
