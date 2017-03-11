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
public class Question implements Serializable 

{
    String question;
    String loginname;
    String senderName;

    public Question(String question, String loginname,String senderName) {
        this.question = question;
        this.loginname = loginname;
        this.senderName = senderName;
    }

    public String getQuestion() {
        return question;
    }

    public String getLoginname() {
        return loginname;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public void setLoginname(String loginname) {
        this.loginname = loginname;
    }

    public String getSenderName() {
        return senderName;
    }

    public void setSenderName(String senderName) {
        this.senderName = senderName;
    }

   
    
    
}
