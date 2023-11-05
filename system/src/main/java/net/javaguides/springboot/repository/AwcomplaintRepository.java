package net.javaguides.springboot.repository;

import net.javaguides.springboot.Entity.Awcomplaint;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface AwcomplaintRepository extends JpaRepository<Awcomplaint, Long> {

    @Query(value = "SELECT * FROM awcomplaint WHERE status = NULL", nativeQuery = true)
    List<Awcomplaint> findAllByStatus();
}