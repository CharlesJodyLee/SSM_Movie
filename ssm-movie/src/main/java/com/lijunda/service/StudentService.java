package com.lijunda.service;

import com.lijunda.domain.Collection;
import com.lijunda.domain.Student;

import java.util.List;

public interface StudentService {

    int addStudent(Student student);
    List<Student> findStudent();
    List<Student> findStudentId();
    List<Student> findStudentIdAndPassword();
    Student selectAllStudentMessageById(Integer id);
    int updateStudentById(Student student);
    List<Collection> queryCollectionByStudentId(Integer studentId);

}
