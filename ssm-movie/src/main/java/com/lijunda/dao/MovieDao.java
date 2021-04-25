package com.lijunda.dao;

import com.lijunda.domain.Collection;
import com.lijunda.domain.Comment;
import com.lijunda.domain.Movie;

import java.lang.reflect.Array;
import java.util.List;

public interface MovieDao {
    List<Movie> selectAllMovieId();
    Movie selectOneMovieByName(String movieName);
    List<Movie> selectMaxHot();
    List<Movie> selectMaxNew();

    List<Movie> selectAllMovie();
    List<Movie> selectMovieOrderByMovieTimeDesc();
    int addMovie(Movie movie);
    List<Comment> selectAllCommentByMovieId(Integer movieId);
    int addComment(Comment comment);
    int addCollection(Collection collection);
    List<Collection> selectAllCollectionByStudentId(Integer studentId);
    List<Movie> queryFiveHot();
    List<Movie> queryAllMovieType();
    List<Movie> queryAllMovieCountry();
    List<Movie> queryMovieBySort(Movie movie);
    int subCollection(Collection collection);
    Movie queryMovieByMovieId(Integer movieId);
}
