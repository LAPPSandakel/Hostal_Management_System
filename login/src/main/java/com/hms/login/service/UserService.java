package com.hms.login.service;

import com.hms.login.model.UserModel;
import com.hms.login.repository.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService  {

    @Autowired
    private final UserRepo userRepo;

    public UserService(UserRepo userRepo) {
        this.userRepo = userRepo;
    }

    public UserModel registerUser(String login, String password,String email){
        if (login==null && password==null){
            return null;
        }else{
            UserModel userModel=new UserModel();
            userModel.setLogin(login);
            userModel.setPassword(password);
            userModel.setEmail(email);
            return userRepo.save(userModel);

        }
    }
    public UserModel authenticate(String login, String password){
        return userRepo.findByLoginAndPassword(login, password).orElse(null);
    }
}
