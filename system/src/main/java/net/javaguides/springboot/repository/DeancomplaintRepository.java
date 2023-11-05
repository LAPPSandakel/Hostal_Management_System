package net.javaguides.springboot.repository;

import net.javaguides.springboot.Entity.Complaint;
import net.javaguides.springboot.Entity.Deancomplaint;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface DeancomplaintRepository extends JpaRepository<Deancomplaint, Long> {

    @Query(value = "SELECT * FROM deancomplaint WHERE status = NULL", nativeQuery = true)
    List<Deancomplaint> findAllByStatus();
}