package com.walletless.api.models;

import javax.persistence.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
@Table(name = "providers")
public class Provider {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer providerId;

    @Column(name="email", nullable = false)
    private String email;

    @Column(name="ppw", nullable = false)
    private Integer ppw;

    @Column(name="provider_name", nullable = false)
    private String providerName;

    @Column(name="provider_user_name", nullable = false)
    private String providerUserName;

    @Column(name="create_date", nullable = false)
    private String createDate;

    @OneToMany(mappedBy = "provider")
    private Request request;

    public Provider(){}

    public Provider(String email, Integer ppw, String provName, String provUserName) {
        this.email = email;
        this.ppw = ppw;
        this.providerName = provName;
        this.providerUserName = provUserName;

        DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
        this.createDate = df.format(new Date());
    }

    public Integer getProviderId() { return providerId; }
    public void setProviderId(Integer providerId) { this.providerId = providerId; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public Integer getPpw() { return ppw; }
    public void setPpw(Integer ppw) { this.ppw = ppw; }
    public String getCreateDate() { return createDate; }
    public void setCreateDate(String createDate) { this.createDate = createDate; }
    public String getProviderName() { return providerName; }
    public void setProviderName(String providerName) { this.providerName = providerName; }
    public String getProviderUserName() { return providerUserName; }
    public void setProviderUserName(String providerUserName) { this.providerUserName = providerUserName; }
    public Request getRequest() { return request; }
    public void setRequest(Request request) { this.request = request; }
}
