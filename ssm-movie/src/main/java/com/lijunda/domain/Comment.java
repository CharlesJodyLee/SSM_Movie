package com.lijunda.domain;

public class Comment {
    private int commentId;
    private int movieId;
    private int studentId;
    private String commentTime;
    private String commentContent;

    public Comment() {
    }

    public Comment(int commentId, int movieId, int studentId, String commentTime, String commentContent) {
        this.commentId = commentId;
        this.movieId = movieId;
        this.studentId = studentId;
        this.commentTime = commentTime;
        this.commentContent = commentContent;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
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

    public String getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(String commentTime) {
        this.commentTime = commentTime;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "commentId=" + commentId +
                ", movieId=" + movieId +
                ", studentId=" + studentId +
                ", commentTime='" + commentTime + '\'' +
                ", commentContent='" + commentContent + '\'' +
                '}';
    }
}
