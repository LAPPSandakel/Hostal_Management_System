package com.hms.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller

public class UserController {

    @GetMapping("/register")
    public String getRegisterPage(){
        return  "register";
    }
    @GetMapping("/login")
    public String getLoginPage(){
        return  "login";
    }
}
