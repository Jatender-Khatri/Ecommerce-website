/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ecommerce.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author MeGa
 */
@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length = 10, name = "user_id")
    private Integer userId;
    @Column(length = 100, name = "user_name")
    private String userName;
    @Column(length = 100, name = "user_password")
    private String userPassword;
    @Column(length = 13, name = "user_phone")
    private String userPhoneNumber;
    @Column(length = 1500, name = "user_pic")
    private String userPic;
    @Column(length = 1500, name = "user_address")
    private String userAddress;
    @Column(length = 1500, name = "user_email")
    private String userEmail;
    @Column(name = "user_type")
    private String userType;

    public User(Integer userId, String userName, String userPassword, String userPhoneNumber, String userPic, String userAddress, String userEmail, String userType) {
        this.userId = userId;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userPhoneNumber = userPhoneNumber;
        this.userPic = userPic;
        this.userAddress = userAddress;
        this.userEmail = userEmail;
        this.userType = userType;
    }

    public User(String userName, String userPassword, String userPhoneNumber, String userPic, String userAddress, String userEmail, String userType) {
        this.userName = userName;
        this.userPassword = userPassword;
        this.userPhoneNumber = userPhoneNumber;
        this.userPic = userPic;
        this.userAddress = userAddress;
        this.userEmail = userEmail;
        this.userType = userType;
    }

    public User() {
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserPhoneNumber() {
        return userPhoneNumber;
    }

    public void setUserPhoneNumber(String userPhoneNumber) {
        this.userPhoneNumber = userPhoneNumber;
    }

    public String getUserPic() {
        return userPic;
    }

    public void setUserPic(String userPic) {
        this.userPic = userPic;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", userName=" + userName + ", userPassword=" + userPassword + ", userPhoneNumber=" + userPhoneNumber + ", userPic=" + userPic + ", userAddress=" + userAddress + ", userEmail=" + userEmail + '}';
    }

}
