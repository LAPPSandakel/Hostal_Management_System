package net.javaguides.springboot.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/")
	public String home() {
		return "admindashboard";
	}

	@GetMapping("/complain")
	public String complain() {
		return "complaint";
	}

	@GetMapping("/complainview")
	public String complainview() {
		return "complaintsview";
	}
}
