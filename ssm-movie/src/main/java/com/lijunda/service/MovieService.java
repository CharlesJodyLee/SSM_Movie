package com.lijunda.service;

import com.lijunda.domain.Collection;
import com.lijunda.domain.Comment;
import com.lijunda.domain.Movie;

import java.util.List;

public interface MovieService {
    List<Movie> selectAllMovieId();
    Movie selectMovieByName(String movieName);
    int selectMaxHot();
    int selectMaxNew();
    List<Movie> selectAllMovie();
    int addMovie(Movie movie);
    List<Movie> selectMovieOrderByMovieTimeDesc();
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
