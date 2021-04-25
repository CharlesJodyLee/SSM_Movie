package com.lijunda.controller;

import com.lijunda.domain.Collection;
import com.lijunda.domain.Student;
import com.lijunda.service.StudentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Resource
    private StudentService service;

    //注册
    @RequestMapping("/addStudent.do")
    public ModelAndView addStudent(Student student){
        ModelAndView mv = new ModelAndView();
        String tips = "注册失败";
        List<Student> studentList = service.findStudentId();
        int flag = 0;
        for (Student stu:studentList) {
            if(stu.getId() == student.getId() ){
                flag = 1;
                tips = "学生 "+student+" id重复，注册失败";
            }
        }
        if(flag == 0){
            System.out.println("注册页面传入的数据"+student);
            int num = service.addStudent(student);
            if(num>0){
                //注册成功
                tips = "学生 "+student+" 注册成功";
            }
        }
        System.out.println("返回的信息"+tips);
        mv.addObject("tips",tips);
        mv.setViewName("result");
        return mv;

    }

    //查询
    @RequestMapping("/queryStudent.do")
    @ResponseBody
    public List<Student> queryStudent(){
        List<Student> studentList = service.findStudent();
        for (Student student:studentList) {
            System.out.println("service->controller student.getId():"+student.getId());
        }
        return studentList;
    }

    //登录
    @RequestMapping("/loginStudent.do")
    public ModelAndView loginStudent(Student student){
        System.out.println("登录页面传入的数据 id:"+student.getId()+"  password:"+student.getPassword());
        ModelAndView mv = new ModelAndView();
        String tips = "登录失败";
        List<Student> studentList = service.findStudentIdAndPassword();
        for (Student stu:studentList) {
            if(student.getId() == stu.getId() && student.getPassword().equals(stu.getPassword().trim())){
                tips = "学生 "+student+" id和密码匹配成功，登陆成功";
                System.out.println("登陆成功");
                Student studentPass = service.selectAllStudentMessageById(student.getId());
                mv.addObject("studentId",studentPass.getId());
                mv.addObject("studentPassword",studentPass.getPassword());
                mv.addObject("studentName",studentPass.getName());
                mv.addObject("studentAge",studentPass.getAge());
                mv.addObject("studentGender",studentPass.getGender());
                mv.addObject("studentEmail",studentPass.getEmail());
                mv.addObject("tips",tips);
                mv.setViewName("main");
                return mv;
            }
        }
        tips = "id和密码匹配失败，登陆失败";
        System.out.println("返回的信息"+tips);
        mv.addObject("tips",tips);
        mv.setViewName("result");
        return mv;
    }

    //个人中心（弃用）
    @RequestMapping("/{id}/{password}/studentCenter.do")
    public ModelAndView StudentCenter(@PathVariable Integer id,@PathVariable String password){
        System.out.println("进入个人中心");
        ModelAndView mv = new ModelAndView();
        String tips = "个人中心";
        Student student = service.selectAllStudentMessageById(id);
        if(student.getId() == id && student.getPassword().equals(password.trim())){
            tips = "用户 "+student+" id和密码匹配成功，个人中心访问成功";
            System.out.println("访问个人中心成功");
            mv.addObject("studentId",student.getId());
            mv.addObject("studentPassword",student.getPassword());
            mv.addObject("studentName",student.getName());
            mv.addObject("studentAge",student.getAge());
            mv.addObject("studentGender",student.getGender());
            mv.addObject("studentEmail",student.getEmail());
            mv.addObject("tips",tips);
            mv.setViewName("personCenter");
            return mv;
        }

        tips = "id和密码匹配失败，进入失败";
        System.out.println("返回的信息"+tips);
        mv.addObject("tips",tips);
        mv.setViewName("result");
        return mv;
    }
    //个人中心form
    @RequestMapping("/studentCenter.do")
    public ModelAndView StudentCenter(Student student){
        System.out.println("进入个人中心");
        ModelAndView mv = new ModelAndView();
        String tips = "个人中心";
        Student stu = service.selectAllStudentMessageById(student.getId());
        if(student.getId() == stu.getId() && student.getPassword().equals(stu.getPassword().trim())){
            tips = "用户 "+stu+" id和密码匹配成功.个人中心访问成功";
            System.out.println("访问个人中心成功!");
            mv.addObject("studentId",stu.getId());
            mv.addObject("studentPassword",stu.getPassword());
            mv.addObject("studentName",stu.getName());
            mv.addObject("studentAge",stu.getAge());
            mv.addObject("studentGender",stu.getGender());
            mv.addObject("studentEmail",stu.getEmail());
            mv.addObject("tips",tips);
            mv.setViewName("personCenter");
            return mv;
        }

        tips = "id和密码匹配失败，进入失败";
        System.out.println("返回的信息"+tips);
        mv.addObject("tips",tips);
        mv.setViewName("result");
        return mv;
    }

    //转到主页（弃用）
    @RequestMapping("/{id}/{password}/{name}/main.do")
    public ModelAndView main(@PathVariable Integer id,@PathVariable String password,@PathVariable String name){
        ModelAndView mv = new ModelAndView();
        String tips = "转main页失败";
        Student student = service.selectAllStudentMessageById(id);
        if(student.getId() == id && student.getPassword().equals(password.trim())){
            tips = "用户 "+student+" id和密码匹配成功，登陆成功";
            System.out.println("转主页成功");
            Student studentPass = service.selectAllStudentMessageById(student.getId());
            mv.addObject("studentId",studentPass.getId());
            mv.addObject("studentPassword",studentPass.getPassword());
            mv.addObject("studentName",studentPass.getName());
            mv.addObject("studentAge",studentPass.getAge());
            mv.addObject("studentGender",studentPass.getGender());
            mv.addObject("studentEmail",studentPass.getEmail());
            mv.addObject("tips",tips);
            mv.setViewName("main");
            return mv;
        }
        tips = "id和密码匹配失败，登陆失败";
        System.out.println("返回的信息"+tips);
        mv.addObject("tips",tips);
        mv.setViewName("result");
        return mv;
    }
    //转到主页form
    @RequestMapping("/main.do")
    public ModelAndView main(Student student){
        System.out.println("ajax传的参数:"+student);
        ModelAndView mv = new ModelAndView();
        String tips = "转main页失败";
        Student stu = service.selectAllStudentMessageById(student.getId());
        if(student.getId() == stu.getId() && student.getPassword().equals(stu.getPassword().trim())){
            tips = "用户 "+student+" id和密码匹配成功，登陆成功";
            System.out.println("转主页成功hhhh");
            Student studentPass = service.selectAllStudentMessageById(student.getId());
            mv.addObject("studentId",studentPass.getId());
            mv.addObject("studentPassword",studentPass.getPassword());
            mv.addObject("studentName",studentPass.getName());
            mv.addObject("studentAge",studentPass.getAge());
            mv.addObject("studentGender",studentPass.getGender());
            mv.addObject("studentEmail",studentPass.getEmail());
            mv.addObject("tips",tips);
            mv.setViewName("main");
            return mv;
        }
        tips = "id和密码匹配失败，登陆失败";
        System.out.println("返回的信息"+tips);
        mv.addObject("tips",tips);
        mv.setViewName("result");
        return mv;
    }

    //修改
    @RequestMapping("/alterStudent.do")
    public ModelAndView alterStudent(Student student){
        ModelAndView mv = new ModelAndView();
        String tips = "修改失败";
        System.out.println("修改中的student.getId() student.getName()"+student.getId()+" "+student.getName());
        int num = service.updateStudentById(student);
        if(num == 1 ){
            tips = "用户"+student.getId()+"信息修改成功";
        }
        System.out.println("返回的信息"+tips);
        mv.addObject("tips",tips);
        mv.setViewName("alterLoginStudent");
        return mv;

    }

    //分类页面
    @RequestMapping("/ClassifiedSearch.do")
    public ModelAndView ClassifiedSearch(Student student){
        System.out.println(student);
        ModelAndView mv = new ModelAndView();
        String tips = "转入分类页面失败";
        Student stu = service.selectAllStudentMessageById(student.getId());
        if(stu.getId() == student.getId() && stu.getPassword().equals(student.getPassword().trim())){
            System.out.println("id和password匹配成功，转入分类页面");
            tips = "分类页面转入成功！";
            mv.addObject("studentId",stu.getId());
            mv.addObject("studentPassword",stu.getPassword());
            mv.addObject("studentName",stu.getName());
            mv.addObject("studentAge",stu.getAge());
            mv.addObject("studentGender",stu.getGender());
            mv.addObject("studentEmail",stu.getEmail());
            mv.addObject("tips",tips);
            System.out.println("返回的信息"+tips);
            mv.setViewName("classifiedSearch");
            return mv;
        }
        System.out.println("返回的信息"+tips);
        mv.addObject("tips",tips);
        mv.setViewName("result");
        return mv;
    }


    //个人收藏
    @RequestMapping("/CollectionPage.do")
    public ModelAndView CollectionPage(Student student){
        System.out.println("进入个人收藏");
        ModelAndView mv = new ModelAndView();
        String tips = "";
        List<Collection> collectionList = service.queryCollectionByStudentId(student.getId());
        System.out.println("service->controller queryCollectionByStudentId:"+collectionList.size());

        mv.addObject("studentId",student.getId());
        mv.addObject("studentPassword",student.getPassword());
        mv.addObject("studentName",student.getName());

        if(collectionList.size() == 0){
            tips = "暂时没有收藏电影呢";
            mv.addObject("tips",tips);
            System.out.println("返回的信息："+tips);
            mv.setViewName("NoCollectionResult");
            return mv;
        }
        tips = "个人收藏检索完成:"+collectionList.size()+"条";
        System.out.println("返回的信息："+tips);
        mv.addObject("tips",tips);
        mv.setViewName("NoCollectionResult");
        return mv;
    }


    //查询收藏
    @RequestMapping("/queryCollectionByStudentId.do")
    @ResponseBody
    public List<Collection> queryCollectionByStudentId(Integer studentId){
        System.out.println("进入queryCollectionByStudentId");
        List<Collection> collectionList = service.queryCollectionByStudentId(studentId);
        for (Collection collection:collectionList) {
            System.out.println("service->controller collection.getMovieId():"+collection.getMovieId());
        }
        return collectionList;
    }

    //查询root超级权限账号密码是否正确
    @RequestMapping("/powerCheck.do")
    @ResponseBody
    public ModelAndView powerCheck(Student student){
        ModelAndView mv = new ModelAndView();
        System.out.println("powerCheck id:"+student.getId()+" password:"+student.getPassword());
        Student stu = service.selectAllStudentMessageById(student.getId());
        if (student.getPassword().equals(stu.getPassword().trim())){
            System.out.println("权限确认，权限授予通过");
            mv.addObject("powerCheck",1);
            mv.setViewName("indexPower");
            return mv;
        }
        mv.addObject("powerCheck",0);
        String tips = "权限验证失败！！";
        mv.addObject("tips",tips);
        mv.setViewName("resultPowerFail");
        return mv;
    }
}
