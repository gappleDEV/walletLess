package com.walletless.api.models;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

@Entity
@Table(name = "requests")
public class Request {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "request_id")
    private Integer requestId;

    @Column(name = "message")
    private String message;

    @Column(name = "start_date")
    private String startDate;

    @Column(name = "end_date")
    private String endDate;

    @Column(name = "approved")
    private boolean approved; //open, pending, or closed
    //todo: make enum maybe

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "provider_id" )
    private Provider provider;

    public Request(){}

    public Request(String message, User user, Provider provider){
        this.message = message;
        this.approved = false;

        DateTimeFormatter df = DateTimeFormatter.ofPattern("yyy-MM-dd HH:mm");
        LocalDateTime now = LocalDateTime.now(ZoneId.of("America/New_York"));
        this.startDate = now.format(df);
        this.endDate = now.plusMonths(1).format(df);

        this.user = user;
        this.provider = provider;
    }

    public Integer getRequestId() { return requestId; }
    public void setRequestId(Integer requestId) { this.requestId = requestId; }
    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }
    public String getStartDate() { return startDate; }
    public void setStartDate(String startDate) { this.startDate = startDate; }
    public String getEndDate() { return endDate; }
    public void setEndDate(String endDate) { this.endDate = endDate; }
    public boolean isApproved() { return approved; }
    public void setApproved(boolean status) { this.approved = status; }
    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
    public Provider getProvider() { return provider; }
    public void setProvider(Provider provider) { this.provider = provider; }

    public boolean isExpired() {
        DateTimeFormatter df = DateTimeFormatter.ofPattern("yyy-MM-dd HH:mm");
        LocalDateTime expirationDate = LocalDateTime.parse(this.endDate, df);
        LocalDateTime now = LocalDateTime.now(ZoneId.of("America/New_York"));

        return (now.isAfter(expirationDate));
    }
}
