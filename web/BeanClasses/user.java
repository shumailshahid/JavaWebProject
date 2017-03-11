/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BeanClasses;

import java.io.Serializable;

/**
 *
 * @author SHUMAIL
 */
public class user implements Serializable 
{
    String firstName;
    String lastName;
    String password;
    String loginname;
    String email;
    String mobileNumber;
    String gender;
    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getPassword() {
        return password;
    }

    public String getLoginname() {
        return loginname;
    }

    public String getEmail() {
        return email;
    }

    public String getMobileNumber() {
        return mobileNumber;
    }

    public String getGender() {
        return gender;
    }
  

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setLoginname(String loginname) {
        this.loginname = loginname;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
   
    
  
    
}
