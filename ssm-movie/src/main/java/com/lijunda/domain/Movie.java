package com.lijunda.domain;


public class Movie {
    private Integer movieId;
    private String movieName;
    private String movieOtherName;
    private String movieTime;
    private String moviePicture;
    private String movieType;
    private int isHot;
    private int isNew;
    private String movieCountry;
    private String movieDirector;
    private int movieLength;
    private String movieIntroduce;

    public Movie() {
    }

    public Movie(Integer movieId, String movieName, String movieOtherName,
                 String movieTime, String moviePicture, String movieType,
                 int isHot, int isNew, String movieCountry,
                 String movieDirector, int movieLength, String movieIntroduce) {
        this.movieId = movieId;
        this.movieName = movieName;
        this.movieOtherName = movieOtherName;
        this.movieTime = movieTime;
        this.moviePicture = moviePicture;
        this.movieType = movieType;
        this.isHot = isHot;
        this.isNew = isNew;
        this.movieCountry = movieCountry;
        this.movieDirector = movieDirector;
        this.movieLength = movieLength;
        this.movieIntroduce = movieIntroduce;
    }

    public Integer getMovieId() {
        return movieId;
    }

    public void setMovieId(Integer movieId) {
        this.movieId = movieId;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public String getMovieOtherName() {
        return movieOtherName;
    }

    public void setMovieOtherName(String movieOtherName) {
        this.movieOtherName = movieOtherName;
    }

    public String getMovieTime() {
        return movieTime;
    }

    public void setMovieTime(String movieTime) {
        this.movieTime = movieTime;
    }

    public String getMoviePicture() {
        return moviePicture;
    }

    public void setMoviePicture(String moviePicture) {
        this.moviePicture = moviePicture;
    }

    public String getMovieType() {
        return movieType;
    }

    public void setMovieType(String movieType) {
        this.movieType = movieType;
    }

    public int getIsHot() {
        return isHot;
    }

    public void setIsHot(int isHot) {
        this.isHot = isHot;
    }

    public int getIsNew() {
        return isNew;
    }

    public void setIsNew(int isNew) {
        this.isNew = isNew;
    }

    public String getMovieCountry() {
        return movieCountry;
    }

    public void setMovieCountry(String movieCountry) {
        this.movieCountry = movieCountry;
    }

    public String getMovieDirector() {
        return movieDirector;
    }

    public void setMovieDirector(String movieDirector) {
        this.movieDirector = movieDirector;
    }

    public int getMovieLength() {
        return movieLength;
    }

    public void setMovieLength(int movieLength) {
        this.movieLength = movieLength;
    }

    public String getMovieIntroduce() {
        return movieIntroduce;
    }

    public void setMovieIntroduce(String movieIntroduce) {
        this.movieIntroduce = movieIntroduce;
    }

    @Override
    public String toString() {
        return "Movie{" +
                "movieId=" + movieId +
                ", movieName='" + movieName + '\'' +
                ", movieOtherName='" + movieOtherName + '\'' +
                ", movieTime='" + movieTime + '\'' +
                ", moviePicture='" + moviePicture + '\'' +
                ", movieType='" + movieType + '\'' +
                ", isHot=" + isHot +
                ", isNew=" + isNew +
                ", movieCountry='" + movieCountry + '\'' +
                ", movieDirector='" + movieDirector + '\'' +
                ", movieLength=" + movieLength +
                ", movieIntroduce='" + movieIntroduce + '\'' +
                '}';
    }
}
