package net.javaguides.springboot.web;

import net.javaguides.springboot.Entity.Awcomplaint;
import net.javaguides.springboot.Entity.Complaint;
import net.javaguides.springboot.service.AwcomplaintService;
import net.javaguides.springboot.service.ComplaintServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@CrossOrigin
@RequestMapping("/awcomplaint")

public class AwcomplaintController {

    @Autowired
    AwcomplaintService awcomplaintService;


        @GetMapping("/view")
        @ResponseBody
        public ResponseEntity<List<Awcomplaint>> listAwcomplaint() {
            Iterable<Awcomplaint> awcomplaintList = awcomplaintService.getAllAwcomplaint();
            return ResponseEntity.ok((List<Awcomplaint>) awcomplaintList);
        }



    @PostMapping("/saveData")
    public ResponseEntity<String> saveAwcomplaint(@RequestBody Awcomplaint awcomplaint) {
        try {
            // Save complaint to the database
            awcomplaintService.saveAwcomplaint(awcomplaint);
            return ResponseEntity.ok("Complaint saved successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error occurred while saving Complaint: " + e.getMessage());
        }
    }
}
