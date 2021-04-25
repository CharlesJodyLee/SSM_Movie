package com.lijunda.service.impl;


import com.lijunda.dao.MovieDao;
import com.lijunda.domain.Collection;
import com.lijunda.domain.Comment;
import com.lijunda.domain.Movie;
import com.lijunda.service.MovieService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class MovieServiceImpl implements MovieService {

    @Resource
    private MovieDao movieDao;

    @Override
    public List<Movie> selectAllMovieId() {
        List<Movie> movieList = movieDao.selectAllMovieId();
        System.out.println("dao->service selectAllMovieId"+movieList);
        return movieList;
    }

    @Override
    public Movie selectMovieByName(String movieName) {
        Movie movie = movieDao.selectOneMovieByName(movieName);
        System.out.println("dao->service selectMovieByName"+movie);
        return movie;
    }

    @Override
    public int selectMaxHot() {
        int maxHot = 0;
        List<Movie> hotList = movieDao.selectMaxHot();
        for (Movie mov:hotList) {
            if(mov.getIsHot()>maxHot){
                maxHot = mov.getIsHot();
            }
        }
        System.out.println("dao->service maxHot"+maxHot);
        return maxHot;
    }

    @Override
    public int selectMaxNew() {
        int maxNew = 0;
        List<Movie> newList = movieDao.selectMaxNew();
        for (Movie mov:newList) {
            if(mov.getIsNew()>maxNew){
                maxNew = mov.getIsNew();
            }
        }
        System.out.println("dao->service maxNew"+maxNew);
        return maxNew;
    }

    @Override
    public List<Movie> selectAllMovie() {
        List<Movie> movieList = movieDao.selectAllMovie();
        return movieList;
    }

    @Override
    public int addMovie(Movie movie) {
        return movieDao.addMovie(movie);
    }

    @Override
    public List<Movie> selectMovieOrderByMovieTimeDesc() {
        List<Movie> movieList = movieDao.selectMovieOrderByMovieTimeDesc();
        return movieList;
    }

    @Override
    public int addCollection(Collection collection) {
        int num = movieDao.addCollection(collection);
        System.out.println("添加收藏数量"+num);
        return num;
    }

    @Override
    public List<Collection> selectAllCollectionByStudentId(Integer studentId) {
        List<Collection> collectionList = movieDao.selectAllCollectionByStudentId(studentId);
        System.out.println("dao->service selectAllCollectionByStudentId:"+collectionList.size());
        return collectionList;
    }

    @Override
    public List<Comment> selectAllCommentByMovieId(Integer movieId) {
        List<Comment> commentList = movieDao.selectAllCommentByMovieId(movieId);
        System.out.println("dao->service selectAllCommentByMovieId size"+commentList.size());
        return commentList;
    }

    @Override
    public int addComment(Comment comment) {
        int num = movieDao.addComment(comment);
        System.out.println("添加评论数"+num);
        return num;
    }

    @Override
    public List<Movie> queryFiveHot() {
        List<Movie> movieList = movieDao.queryFiveHot();
        System.out.println("dao->service queryFiveHot"+movieList.size());
        return movieList;
    }

    @Override
    public List<Movie> queryAllMovieType() {
        List<Movie> movieList = movieDao.queryAllMovieType();
        System.out.println("dao->service queryAllMovieType"+movieList.size());
        return movieList;
    }

    @Override
    public List<Movie> queryAllMovieCountry() {
        List<Movie> movieList = movieDao.queryAllMovieCountry();
        System.out.println("dao->service queryAllMovieCountry"+movieList.size());
        return movieList;
    }

    @Override
    public List<Movie> queryMovieBySort(Movie movie) {
        List<Movie> movieList = movieDao.queryMovieBySort(movie);
        System.out.println("dao->service queryMovieBySort:"+movieList.size());
        return movieList;
    }

    @Override
    public int subCollection(Collection collection) {
        int num = movieDao.subCollection(collection);
        System.out.println("取消收藏的数量:"+num);
        return num;
    }

    @Override
    public Movie queryMovieByMovieId(Integer movieId) {
        Movie movie = movieDao.queryMovieByMovieId(movieId);
        return movie;
    }
}
