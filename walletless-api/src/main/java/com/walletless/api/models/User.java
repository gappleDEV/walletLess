package com.walletless.api.models;

import javax.persistence.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

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

    @Column(name="create_date", nullable = false)
    private String createDate;

    public User(){}

    public User(String email, Integer upw) {
        this.email = email;
        this.upw = upw;

        DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
        this.createDate = df.format(new Date());
    }

    public Integer getUserId() { return userId; }
    public void setUserId(Integer userId) { this.userId = userId; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public Integer getUpw() { return upw; }
    public void setUpw(Integer upw) { this.upw = upw; }
    public String getCreateDate() { return createDate; }
    public void setCreateDate(String createDate) { this.createDate = createDate; }
}
