package com.walletless.api.models;

import javax.persistence.*;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Integer userId;

    @Column(name="email", nullable = false)
    private String email;

    @Column(name="upw", nullable = false)
    private Integer upw;

    public User(){}

    public User(String email, Integer upw) {
        this.email = email;
        this.upw = upw;
    }

    public Integer getUserId() { return userId; }
    public void setUserId(Integer userId) { this.userId = userId; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public Integer getUpw() { return upw; }
    public void setUpw(Integer upw) { this.upw = upw; }
}
