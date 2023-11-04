package com.hms.login.repository;

import com.hms.login.model.UserModel;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepo extends JpaRepository<UserModel,Integer> {
    Optional<UserModel> findByLoginAndPassword(String login, String password);

}
