package com.lijunda.controller;

import com.lijunda.domain.Collection;
import com.lijunda.domain.Comment;
import com.lijunda.domain.Movie;
import com.lijunda.domain.Student;
import com.lijunda.service.MovieService;
import com.lijunda.service.StudentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

@Controller
@RequestMapping("/movie")
public class MovieController {

    @Resource
    private MovieService movieService;
    @Resource
    private StudentService studentService;

    //查询所有电影
    @RequestMapping("/queryAllMovie.do")
    @ResponseBody
    public List<Movie> queryAllMovie(){
        List<Movie> movieList = movieService.selectAllMovie();
        System.out.println("GetAllMovieList.size():"+movieList.size());
        return movieList;
    }

    //查询所有电影按照日期倒叙排序
    @RequestMapping("/queryMovieOrderByMovieTimeDesc.do")
    @ResponseBody
    public List<Movie> queryMovieOrderByMovieTimeDesc(){
        List<Movie> movieList = movieService.selectMovieOrderByMovieTimeDesc();
        System.out.println("queryMovieOrderByMovieTimeDesc movieList.size()"+movieList.size());
        return movieList;
    }

    //查询指定名称电影
    @RequestMapping("/queryOneMovieByName.do")
    @ResponseBody
    public ModelAndView queryOneMovie(Integer studentId,String studentPassword,String movieName){
        System.out.println("传入要搜索的movieName: "+movieName);
        String tips = "搜索失败";

        ModelAndView mv = new ModelAndView();
        Movie movie = movieService.selectMovieByName(movieName);
        System.out.println("service->controller selectMovieByName:"+movie);
        if (movie.getMovieId() != null){
            tips = "搜索成功！";
            mv.addObject("movieId",movie.getMovieId());
            mv.addObject("movieName",movie.getMovieName());
            mv.addObject("movieOtherName",movie.getMovieOtherName());
            mv.addObject("movieTime",movie.getMovieTime());
            mv.addObject("moviePicture",movie.getMoviePicture());
            mv.addObject("movieType",movie.getMovieType());
            mv.addObject("isHot",movie.getIsHot());
            mv.addObject("isNew",movie.getIsNew());
            mv.addObject("movieCountry",movie.getMovieCountry());
            mv.addObject("movieDirector",movie.getMovieDirector());
            mv.addObject("movieLength",movie.getMovieLength());
            mv.addObject("movieIntroduce",movie.getMovieIntroduce());
            mv.addObject("studentId",studentId);
            mv.addObject("studentPassword",studentPassword);
            mv.addObject("tips",tips);
            mv.setViewName("searchMovie");
            return mv;
        }
        mv.addObject("tips",tips);
        mv.setViewName("result");
        return mv;
    }

    //根据电影id查找电影
    @RequestMapping("/queryMovieByMovieId.do")
    @ResponseBody
    public Movie queryMovieByMovieId(Integer movieId){
        System.out.println("queryMovieByMovieId 进入");
        System.out.println("传入的要搜索的movieId:"+movieId);
        Movie movie = movieService.queryMovieByMovieId(movieId);
        System.out.println("service->controller queryMovieByMovieId:"+movie.getMovieId()+" "+movie.getMovieName());
        return movie;
    }

    //查询hot
    @RequestMapping("/queryHot.do")
    @ResponseBody
    public int queryHot(){
        int maxHot = movieService.selectMaxHot();
        System.out.println("service->controller maxHot"+maxHot);
        return maxHot;
    }


    //查询前五hot
    @RequestMapping("/queryFiveHot.do")
    @ResponseBody
    public List<Movie> queryFiveHot(){
        List<Movie> movieList = movieService.queryFiveHot();
        System.out.println("service->controller queryFiveHot:"+movieList.size());
        return movieList;
    }

    //查询Type
    @RequestMapping("/queryAllMovieType.do")
    @ResponseBody
    public List<Movie> queryAllMovieType(){
        List<Movie> movieList = movieService.queryAllMovieType();
        System.out.println("service->controller queryAllMovieType:"+movieList.size());
        return movieList;
    }



    //查询Country
    @RequestMapping("/queryAllMovieCountry.do")
    @ResponseBody
    public List<Movie> queryAllMovieCountry(){
        List<Movie> movieList = movieService.queryAllMovieCountry();
        System.out.println("service->controller queryAllMovieCountry:"+movieList.size());
        return movieList;
    }


    //Sort分类查询
    @RequestMapping("/queryMovieBySort.do")
    @ResponseBody
    public List<Movie> queryMovieBySort(Movie movie){
        System.out.println("queryMovieBySort 进入");
        System.out.println(movie.getMovieType()+" "+movie.getMovieCountry()+" "+movie.getMovieTime());
        List<Movie> movieList= movieService.queryMovieBySort(movie);
        System.out.println("service->controller queryMovieBySort:"+movieList.size());
        return movieList;
    }

    //查询new
    @RequestMapping("/queryNew.do")
    @ResponseBody
    public int queryNew(){
       int maxNew = movieService.selectMaxNew();
       System.out.println("service->controller maxNew"+maxNew);
       return maxNew;
    }

    //添加电影
    @RequestMapping("/addMovie.do")
    public ModelAndView addMovie(Movie movie){
        ModelAndView mv = new ModelAndView();
        String tips = "添加电影失败";
        List<Movie> movieList = movieService.selectAllMovieId();
        int flag = 0;
        for (Movie mov:movieList) {
            if(mov.getMovieId() == movie.getMovieId() ){
                flag = 1;
                tips = "电影 "+movie+" movieId重复，添加电影失败";
            }
        }
        if(flag == 0){
            System.out.println("注册页面传入的数据"+movie);
            int num = movieService.addMovie(movie);
            if(num>0){
                //注册成功
                tips = "电影 "+movie+" 添加成功";
            }
        }
        System.out.println("返回的信息"+tips);
        mv.addObject("tips",tips);
        mv.setViewName("result");
        return mv;
    }


    //查询指定名Id电影评论
    @RequestMapping("/queryAllCommentByMovieId.do")
    @ResponseBody
    public List<Comment> queryAllCommentByMovieId(Integer movieId){
        System.out.println("传入要搜索评论的movieId: "+movieId);
        String tips = "搜索失败";
        List<Comment> commentList = movieService.selectAllCommentByMovieId(movieId);
        System.out.println("service->controller selectAllCommentByMovieId size:"+commentList.size());
        return commentList;
    }

    //添加评论
    @RequestMapping("/addComment.do")
    public ModelAndView addComment(Comment comment){
        System.out.println(comment);
        ModelAndView mv = new ModelAndView();
        String tips = "添加评论失败";
        int num  = movieService.addComment(comment);
        if(num == 1){
            System.out.println("评论添加成功");
            tips = "添加评论成功！";
        };
        System.out.println("返回的信息"+tips);
        mv.addObject("tips",tips);
        Student student = studentService.selectAllStudentMessageById(comment.getStudentId());
        mv.addObject("studentId",student.getId());
        mv.addObject("studentPassword",student.getPassword());
        mv.addObject("movieId",comment.getMovieId());
        mv.setViewName("searchMovie");
        return mv;
    }


    //添加收藏
    @RequestMapping("/addCollection.do")
    @ResponseBody
    public int addCollection(Collection collection){
        System.out.println("添加收藏传入的movieId:"+collection.getMovieId()+" studentId:"+collection.getStudentId());
        List<Collection> collectionList = movieService.selectAllCollectionByStudentId(collection.getStudentId());
        String tips = "添加收藏失败";
        System.out.println("service->controller selectAllCollectionByStudentId:"+collectionList.size());
        for (Collection collect:collectionList) {
            if(collect.getMovieId()==collection.getMovieId()){
                System.out.println("加收藏失败，因为已经收藏过了");
                return 0;
            }
        }
        int num  = movieService.addCollection(collection);
        if(num == 1){
            System.out.println("收藏添加成功");
            tips = "添加收藏成功！";
        };
        System.out.println("返回的信息"+tips);
        return 1;

    }

    //取消收藏
    @RequestMapping("/subCollection.do")
    @ResponseBody
    public int subCollection(Collection collection){
        System.out.println("取消收藏传入的movieId:"+collection.getMovieId()+" studentId:"+collection.getStudentId());
        List<Collection> collectionList = movieService.selectAllCollectionByStudentId(collection.getStudentId());
        String tips = "取消收藏失败";
        System.out.println("service->controller selectAllCollectionByStudentId:"+collectionList.size());
        for (Collection collect:collectionList) {
            if(collect.getMovieId()==collection.getMovieId()){
                int num = movieService.subCollection(collection);
                System.out.println("取消收藏成功");
                return 0;
            }
        }
        System.out.println("返回的信息"+tips);
        return 1;

    }

    //搜索收藏
    @RequestMapping("/queryCollectionYesOrNotByStudentId.do")
    @ResponseBody
    public int queryCollectionYesOrNotByStudentId(Collection collection){
        System.out.println("查询是否收藏传入的movieId:"+collection.getMovieId()+" studentId:"+collection.getStudentId());
        List<Collection> collectionList = movieService.selectAllCollectionByStudentId(collection.getStudentId());
        String tips = "没有收藏过";
        System.out.println("service->controller selectAllCollectionByStudentId:"+collectionList.size());
        for (Collection collect:collectionList) {
            if(collect.getMovieId()==collection.getMovieId()){
                System.out.println("已经收藏过了");
                return 0;
            }
        }
        System.out.println("返回的信息"+tips);
        return 1;

    }






}
