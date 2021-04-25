package com.lijunda.dao;

import com.lijunda.domain.Collection;
import com.lijunda.domain.Student;

import java.util.List;

public interface StudentDao {
    //在dao接口处，定义将来要实现的方法，
    // 只需要定义 方法名 和 要传输的参数 就可以了
    int insertStudent(Student student);
    List<Student> selectStudent();
    List<Student> selectStudentId();
    List<Student> selectStudentIdAndPassWord();
    Student selectAllStudentMessageById(Integer id);
    int updateStudentById(Student student);
    List<Collection> queryCollectionByStudentId(Integer studentId);
}
