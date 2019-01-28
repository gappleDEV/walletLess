package com.walletless.walletless.Entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "prescriptions")
public class Prescription extends AuditModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "prescription_id")
    private int prescriptionId;

    @Column(name = "pharmacy_name")
    private String pharmacyName;

    @Column(name = "pharmacy_address")
    private String pharmacyAddress;

    @Column(name = "prescription_date")
    private Date dateOfPrescription;

    @Column(name = "prescription_number")
    private String prescriptionNumber;

    @Column(name = "strength")
    private String strength;

    @Column(name = "quantity")
    private String quantity;

    @Column(name = "ordering_physician")
    private String orderingPhysician;

    @Column(name = "remaining_refills")
    private String refillsRemaining;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    private User user;

    public int getPrescriptionId() {
        return prescriptionId;
    }

    public void setPrescriptionId(int prescriptionId) {
        this.prescriptionId = prescriptionId;
    }

    public String getPharmacyName() {
        return pharmacyName;
    }

    public void setPharmacyName(String pharmacyName) {
        this.pharmacyName = pharmacyName;
    }

    public String getPharmacyAddress() {
        return pharmacyAddress;
    }

    public void setPharmacyAddress(String pharmacyAddress) {
        this.pharmacyAddress = pharmacyAddress;
    }

    public Date getDateOfPrescription() {
        return dateOfPrescription;
    }

    public void setDateOfPrescription(Date dateOfPrescription) {
        this.dateOfPrescription = dateOfPrescription;
    }

    public String getPrescriptionNumber() {
        return prescriptionNumber;
    }

    public void setPrescriptionNumber(String prescriptionNumber) {
        this.prescriptionNumber = prescriptionNumber;
    }

    public String getStrength() {
        return strength;
    }

    public void setStrength(String strength) {
        this.strength = strength;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getOrderingPhysician() {
        return orderingPhysician;
    }

    public void setOrderingPhysician(String orderingPhysician) {
        this.orderingPhysician = orderingPhysician;
    }

    public String getRefillsRemaining() {
        return refillsRemaining;
    }

    public void setRefillsRemaining(String refillsRemaining) {
        this.refillsRemaining = refillsRemaining;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
