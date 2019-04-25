package com.walletless.api.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.walletless.api.vo.PersonalInformationVO;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "personal_information")
public class PersonalInformation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "personal_information_id")
    private Integer personalInformationId;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "ssn")
    private String socialSecurityNumber;

    @Column(name = "street_address")
    private String streetAddress;

    @Column(name = "city")
    private String city;

    @Column(name = " county")
    private String county;

    @Column(name = "state")
    private String state;

    @Column(name = "zip")
    private String zipCode;

    @Column(name = "country")
    private String country;

    @Column(name = "sex")
    private String sex;

    @Column(name = "marital_status")
    private String maritalStatus;

    @Column(name = "birth_date")
    private Date dateOfBirth;

    @Column(name = "race")
    private String race;

    @Column(name = "religion")
    private String religion;

    @Column(name = "language")
    private String primaryLanguage;

    @Column(name = "home_phone")
    private String homePhone;

    @Column(name = "cell_phone")
    private String cellPhone;

    @Column(name = "work_phone")
    private String workPhone;

    @Column(name = "primary_care_physicion_name")
    private String primaryCarePhysicianName;

    @Column(name = "primary_care_physicion_address")
    private String primaryCarePhysicianAddress;

    @Column(name = "primary_care_physicion_phone")
    private String primaryCarePhysicianPhone;

    @Column(name = "next_of_kin_first_name")
    private String nextOfKinFirstName;

    @Column(name = "next_of_kin_last_name")
    private String nextOfKinLastName;

    @Column(name = "next_of_kin_relationship")
    private String nextOfKinRelationship;

    @Column(name = "next_of_kin_cell_phone")
    private String nextOfKinCellPhone;

    @Column(name = "next_of_kin_home_phone")
    private String nextOfKinHomePhone;

    @Column(name = "emergencry_contact")
    private String emergencyContact;

    @Column(name = "emergencry_contact_first_name")
    private String emergencyContactFirstName;

    @Column(name = "emergencry_contact_address")
    private String emergencyContactAddress;

    @Column(name = "emergencry_contact_phone")
    private String emergencyContactPhone;

    @Column(name = "emergencry_contact_relationship")
    private String emergencyContactRelationship;

    @Column(name = "guarantor")
    private String guarantor;

    @Column(name = "guarantor_first_name")
    private String guarantorFirstName;

    @Column(name = "guarantor_last_name")
    private String guarantorLastName;

    @Column(name = "guarantor_address")
    private String guarantorAddress;

    @Column(name = "guarantor_phone")
    private String guarantorPhone;

    @Column(name = "guarantor_ssn")
    private String guarantorSSN;

    @Column(name = "guarantor_dob")
    private Date guarantorDateOfBirth;

    @Column(name = "guarantor_relationship")
    private String guarantorRelationship;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id", nullable = false, unique = true)
    private User user;

    public PersonalInformation(){}

    public PersonalInformation(PersonalInformationVO pi){
        this.firstName = pi.firstName;
        this.lastName = pi.lastName;
        this.socialSecurityNumber = pi.socialSecurityNumber;
        this.streetAddress = pi.streetAddress;
        this.city = pi.city;
        this.county = pi.county;
        this.state = pi.state;
        this.zipCode = pi.zipCode;
        this.country = pi.country;
        this.sex = pi.sex;
        this.maritalStatus = pi.maritalStatus;
        this.dateOfBirth = pi.dateOfBirth;
        this.race = pi.race;
        this.religion = pi.religion;
        this.primaryLanguage = pi.primaryLanguage;
        this.homePhone = pi.homePhone;
        this.cellPhone = pi.cellPhone;
        this.workPhone = pi.workPhone;
        this.primaryCarePhysicianName = pi.primaryCarePhysicianName;
        this.primaryCarePhysicianAddress = pi.primaryCarePhysicianAddress;
        this.primaryCarePhysicianPhone = pi.primaryCarePhysicianPhone;
        this.nextOfKinFirstName = pi.nextOfKinFirstName;
        this.nextOfKinLastName = pi.nextOfKinLastName;
        this.nextOfKinRelationship = pi.nextOfKinRelationship;
        this.nextOfKinCellPhone = pi.nextOfKinCellPhone;
        this.nextOfKinHomePhone = pi.nextOfKinHomePhone;
        this.emergencyContact = pi.emergencyContact;
        this.emergencyContactFirstName = pi.emergencyContactFirstName;
        this.emergencyContactAddress = pi.emergencyContactAddress;
        this.emergencyContactPhone = pi.emergencyContactPhone;
        this.emergencyContactRelationship = pi.emergencyContactRelationship;
        this.guarantor = pi.guarantor;
        this.guarantorFirstName = pi.guarantorFirstName;
        this.guarantorLastName = pi.guarantorLastName;
        this.guarantorAddress = pi.guarantorAddress;
        this.guarantorPhone = pi.guarantorPhone;
        this.guarantorSSN = pi.guarantorSSN;
        this.guarantorDateOfBirth = pi.guarantorDateOfBirth;
        this.guarantorRelationship = pi.guarantorRelationship;
        this.user = pi.user;
    }

    public Integer getPersonalInformationId() { return personalInformationId; }
    public void setPersonalInformationId(Integer personalInformationId) { this.personalInformationId = personalInformationId; }
    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }
    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }
    public String getSocialSecurityNumber() { return socialSecurityNumber; }
    public void setSocialSecurityNumber(String socialSecurityNumber) { this.socialSecurityNumber = socialSecurityNumber; }
    public String getStreetAddress() { return streetAddress; }
    public void setStreetAddress(String streetAddress) { this.streetAddress = streetAddress; }
    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }
    public String getCounty() { return county; }
    public void setCounty(String county) { this.county = county; }
    public String getState() { return state; }
    public void setState(String state) { this.state = state; }
    public String getZipCode() { return zipCode; }
    public void setZipCode(String zipCode) { this.zipCode = zipCode; }
    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }
    public String getSex() { return sex; }
    public void setSex(String sex) { this.sex = sex; }
    public String getMaritalStatus() { return maritalStatus; }
    public void setMaritalStatus(String maritalStatus) { this.maritalStatus = maritalStatus; }
    public Date getDateOfBirth() { return dateOfBirth; }
    public void setDateOfBirth(Date dateOfBirth) { this.dateOfBirth = dateOfBirth; }
    public String getRace() { return race; }
    public void setRace(String race) { this.race = race; }
    public String getReligion() { return religion; }
    public void setReligion(String religion) { this.religion = religion; }
    public String getPrimaryLanguage() { return primaryLanguage; }
    public void setPrimaryLanguage(String primaryLanguage) { this.primaryLanguage = primaryLanguage; }
    public String getHomePhone() { return homePhone; }
    public void setHomePhone(String homePhone) { this.homePhone = homePhone; }
    public String getCellPhone() { return cellPhone; }
    public void setCellPhone(String cellPhone) { this.cellPhone = cellPhone; }
    public String getWorkPhone() { return workPhone; }
    public void setWorkPhone(String workPhone) { this.workPhone = workPhone; }
    public String getPrimaryCarePhysicianName() { return primaryCarePhysicianName; }
    public void setPrimaryCarePhysicianName(String primaryCarePhysicianName) { this.primaryCarePhysicianName = primaryCarePhysicianName; }
    public String getPrimaryCarePhysicianAddress() { return primaryCarePhysicianAddress; }
    public void setPrimaryCarePhysicianAddress(String primaryCarePhysicianAddress) { this.primaryCarePhysicianAddress = primaryCarePhysicianAddress; }
    public String getPrimaryCarePhysicianPhone() { return primaryCarePhysicianPhone; }
    public void setPrimaryCarePhysicianPhone(String primaryCarePhysicianPhone) { this.primaryCarePhysicianPhone = primaryCarePhysicianPhone; }
    public String getNextOfKinFirstName() { return nextOfKinFirstName; }
    public void setNextOfKinFirstName(String nextOfKinFirstName) { this.nextOfKinFirstName = nextOfKinFirstName; }
    public String getNextOfKinLastName() { return nextOfKinLastName; }
    public void setNextOfKinLastName(String nextOfKinLastName) { this.nextOfKinLastName = nextOfKinLastName; }
    public String getNextOfKinRelationship() { return nextOfKinRelationship; }
    public void setNextOfKinRelationship(String nextOfKinRelationship) { this.nextOfKinRelationship = nextOfKinRelationship; }
    public String getNextOfKinCellPhone() { return nextOfKinCellPhone; }
    public void setNextOfKinCellPhone(String nextOfKinCellPhone) { this.nextOfKinCellPhone = nextOfKinCellPhone; }
    public String getNextOfKinHomePhone() { return nextOfKinHomePhone; }
    public void setNextOfKinHomePhone(String nextOfKinHomePhone) { this.nextOfKinHomePhone = nextOfKinHomePhone; }
    public String getEmergencyContact() { return emergencyContact; }
    public void setEmergencyContact(String emergencyContact) { this.emergencyContact = emergencyContact; }
    public String getEmergencyContactFirstName() { return emergencyContactFirstName; }
    public void setEmergencyContactFirstName(String emergencyContactFirstName) { this.emergencyContactFirstName = emergencyContactFirstName; }
    public String getEmergencyContactAddress() { return emergencyContactAddress; }
    public void setEmergencyContactAddress(String emergencyContactAddress) { this.emergencyContactAddress = emergencyContactAddress; }
    public String getEmergencyContactPhone() { return emergencyContactPhone; }
    public void setEmergencyContactPhone(String emergencyContactPhone) { this.emergencyContactPhone = emergencyContactPhone; }
    public String getEmergencyContactRelationship() { return emergencyContactRelationship; }
    public void setEmergencyContactRelationship(String emergencyContactRelationship) { this.emergencyContactRelationship = emergencyContactRelationship; }
    public String getGuarantor() { return guarantor; }
    public void setGuarantor(String guarantor) { this.guarantor = guarantor; }
    public String getGuarantorFirstName() { return guarantorFirstName; }
    public void setGuarantorFirstName(String guarantorFirstName) { this.guarantorFirstName = guarantorFirstName; }
    public String getGuarantorLastName() { return guarantorLastName; }
    public void setGuarantorLastName(String guarantorLastName) { this.guarantorLastName = guarantorLastName; }
    public String getGuarantorAddress() { return guarantorAddress; }
    public void setGuarantorAddress(String guarantorAddress) { this.guarantorAddress = guarantorAddress; }
    public String getGuarantorPhone() { return guarantorPhone; }
    public void setGuarantorPhone(String guarantorPhone) { this.guarantorPhone = guarantorPhone; }
    public String getGuarantorSSN() { return guarantorSSN; }
    public void setGuarantorSSN(String guarantorSSN) { this.guarantorSSN = guarantorSSN; }
    public Date getGuarantorDateOfBirth() { return guarantorDateOfBirth; }
    public void setGuarantorDateOfBirth(Date guarantorDateOfBirth) { this.guarantorDateOfBirth = guarantorDateOfBirth; }
    public String getGuarantorRelationship() { return guarantorRelationship; }
    public void setGuarantorRelationship(String guarantorRelationship) { this.guarantorRelationship = guarantorRelationship; }
    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
}
