package com.walletless.api.vo;

import com.walletless.api.models.User;

import java.util.Date;

public class PersonalInformationVO {
    public String firstName;
    public String lastName;
    public String socialSecurityNumber;
    public String streetAddress;
    public String city;
    public String county;
    public String state;
    public String zipCode;
    public String country;
    public String sex;
    public String maritalStatus;
    public Date dateOfBirth;
    public String race;
    public String religion;
    public String primaryLanguage;
    public String homePhone;
    public String cellPhone;
    public String workPhone;
    public String primaryCarePhysicianName;
    public String primaryCarePhysicianAddress;
    public String primaryCarePhysicianPhone;
    public String nextOfKinFirstName;
    public String nextOfKinLastName;
    public String nextOfKinRelationship;
    public String nextOfKinCellPhone;
    public String nextOfKinHomePhone;
    public String emergencyContact;
    public String emergencyContactFirstName;
    public String emergencyContactAddress;
    public String emergencyContactPhone;
    public String emergencyContactRelationship;
    public String guarantor;
    public String guarantorFirstName;
    public String guarantorLastName;
    public String guarantorAddress;
    public String guarantorPhone;
    public String guarantorSSN;
    public Date guarantorDateOfBirth;
    public String guarantorRelationship;
    public String userEmail;

    PersonalInformationVO(){}

    PersonalInformationVO(String firstName,String lastName,String socialSecurityNumber,String streetAddress,String city, String county, String state,String zipCode,String country,
                          String sex,String maritalStatus,Date dateOfBirth,String race,String religion,String primaryLanguage,String homePhone,String cellPhone,String workPhone,
                          String primaryCarePhysicianName,String primaryCarePhysicianAddress,String primaryCarePhysicianPhone,String nextOfKinFirstName,String nextOfKinLastName,
                          String nextOfKinRelationship,String nextOfKinCellPhone,String nextOfKinHomePhone,String emergencyContact,String emergencyContactFirstName,String emergencyContactAddress,
                          String emergencyContactPhone,String emergencyContactRelationship,String guarantor,String guarantorFirstName,String guarantorLastName,String guarantorAddress,
                          String guarantorPhone,String guarantorSSN,Date guarantorDateOfBirth,String guarantorRelationship,String userEmail){

        this.firstName = firstName;
        this.lastName = lastName;
        this.socialSecurityNumber = socialSecurityNumber;
        this.streetAddress = streetAddress;
        this.city = city;
        this.county = county;
        this.state = state;
        this.zipCode = zipCode;
        this.country = country;
        this.sex = sex;
        this.maritalStatus = maritalStatus;
        this.dateOfBirth = dateOfBirth;
        this.race = race;
        this.religion = religion;
        this.primaryLanguage = primaryLanguage;
        this.homePhone = homePhone;
        this.cellPhone = cellPhone;
        this.workPhone = workPhone;
        this.primaryCarePhysicianName = primaryCarePhysicianName;
        this.primaryCarePhysicianAddress = primaryCarePhysicianAddress;
        this.primaryCarePhysicianPhone = primaryCarePhysicianPhone;
        this.nextOfKinFirstName = nextOfKinFirstName;
        this.nextOfKinLastName = nextOfKinLastName;
        this.nextOfKinRelationship = nextOfKinRelationship;
        this.nextOfKinCellPhone = nextOfKinCellPhone;
        this.nextOfKinHomePhone = nextOfKinHomePhone;
        this.emergencyContact = emergencyContact;
        this.emergencyContactFirstName = emergencyContactFirstName;
        this.emergencyContactAddress = emergencyContactAddress;
        this.emergencyContactPhone = emergencyContactPhone;
        this.emergencyContactRelationship = emergencyContactRelationship;
        this.guarantor = guarantor;
        this.guarantorFirstName = guarantorFirstName;
        this.guarantorLastName = guarantorLastName;
        this.guarantorAddress = guarantorAddress;
        this.guarantorPhone = guarantorPhone;
        this.guarantorSSN = guarantorSSN;
        this.guarantorDateOfBirth = guarantorDateOfBirth;
        this.guarantorRelationship = guarantorRelationship;
        this.userEmail = userEmail;
    }
}
