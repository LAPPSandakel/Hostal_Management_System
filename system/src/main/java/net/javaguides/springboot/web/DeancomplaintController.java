package net.javaguides.springboot.web;

import net.javaguides.springboot.Entity.Complaint;
import net.javaguides.springboot.Entity.Deancomplaint;
import net.javaguides.springboot.service.ComplaintServiceImpl;
import net.javaguides.springboot.service.DeancomplaintServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@CrossOrigin
@RequestMapping("/deancomplaint")

public class DeancomplaintController {

    @Autowired
    DeancomplaintServiceImpl deancomplaintService;


        @GetMapping("/view")
        @ResponseBody
        public ResponseEntity<List<Deancomplaint>> listDeancomplaint() {
            Iterable<Deancomplaint> deancomplaintList = deancomplaintService.getAllDeancomplaint();
            return ResponseEntity.ok((List<Deancomplaint>) deancomplaintList);
        }



    @PostMapping("/saveData")
    public ResponseEntity<String> saveDeancomplaint(@RequestBody Deancomplaint deancomplaint) {
        try {
            // Save complaint to the database
            deancomplaintService.saveDeancomplaint(deancomplaint);
            return ResponseEntity.ok("Complaint saved successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error occurred while saving Complaint: " + e.getMessage());
        }
    }
}
