package com.lijunda.domain;

public class Collection {
    private int collectionId;
    private int movieId;
    private int studentId;

    public Collection() {
    }

    public Collection(int collectionId, int movieId, int studentId) {
        this.collectionId = collectionId;
        this.movieId = movieId;
        this.studentId = studentId;
    }

    public int getCollectionId() {
        return collectionId;
    }

    public void setCollectionId(int collectionId) {
        this.collectionId = collectionId;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    @Override
    public String toString() {
        return "Collection{" +
                "collectionId=" + collectionId +
                ", movieId=" + movieId +
                ", studentId=" + studentId +
                '}';
    }
}
