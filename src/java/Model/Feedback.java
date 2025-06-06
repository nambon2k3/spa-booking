/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import DAO.UserDAO;
import java.security.Timestamp;

/**
 *
 * @author Admin
 */
public class Feedback {
    private int id;
    private int userId;
    private String content;
    private int rating;
    private boolean responded;
    private Timestamp createdAt;
    private User user;

    public Feedback() {
        this.user = new UserDAO().getUserById(userId);
    }
    
    public Feedback(int id, String content, int rating, User user) {
        this.id = id;
        this.content = content;
        this.rating = rating;
        this.user = user;
    }

    public Feedback(int id, int userId, String content, int rating, boolean responded, Timestamp createdAt) {
        this.id = id;
        this.userId = userId;
        this.content = content;
        this.rating = rating;
        this.responded = responded;
        this.createdAt = createdAt;
    }

    // Getters and setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public boolean isResponded() {
        return responded;
    }

    public void setResponded(boolean responded) {
        this.responded = responded;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
