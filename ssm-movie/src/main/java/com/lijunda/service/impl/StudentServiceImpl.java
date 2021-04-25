package com.lijunda.service.impl;

import com.lijunda.dao.StudentDao;
import com.lijunda.domain.Collection;
import com.lijunda.domain.Student;
import com.lijunda.service.StudentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    //自动注入，@Autowired和@Resource都可以
    @Resource
    private StudentDao studentDao;

    @Override
    public int addStudent(Student student) {
        int num = studentDao.insertStudent(student);
        return num;
    }

    @Override
    public List<Student> findStudent() {
        //直接返回查到的学生集合
        List<Student> studentList = studentDao.selectStudent();
        for (Student student:studentList) {
            System.out.println("dao->service student.getId():"+student.getId());
        }
        return studentList;
    }

    @Override
    public List<Student> findStudentId() {
        return studentDao.selectStudentId();
    }

    @Override
    public List<Student> findStudentIdAndPassword() {
        return studentDao.selectStudentIdAndPassWord();
    }

    @Override
    public Student selectAllStudentMessageById(Integer id) {
        Student student = studentDao.selectAllStudentMessageById(id);
        System.out.println("selectAllStudentMessageById>>>>>>");
        System.out.println("student:"+student);
        return student;
    }

    @Override
    public int updateStudentById(Student student) {
        int num = studentDao.updateStudentById(student);
        return num;
    }

    @Override
    public List<Collection> queryCollectionByStudentId(Integer studentId) {
        List<Collection> collectionList = studentDao.queryCollectionByStudentId(studentId);
        System.out.println("dao->service queryCollectionByStudentId:"+collectionList.size());
        return collectionList;
    }
}
