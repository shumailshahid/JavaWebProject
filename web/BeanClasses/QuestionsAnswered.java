/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BeanClasses;

/**
 *
 * @author SHUMAIL
 */
public class QuestionsAnswered
{
    int Q_ID;
    String question;
    String answer;
    String loginname;

    QuestionsAnswered(int id, String q, String a, String login) {
        
        this.Q_ID = id;
        this.question = q;
        this.answer = a;
        this.loginname = login;
        
    }

    public void setQ_ID(int Q_ID) {
        this.Q_ID = Q_ID;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public void setLoginname(String loginname) {
        this.loginname = loginname;
    }

    public int getQ_ID() {
        return Q_ID;
    }

    public String getQuestion() {
        return question;
    }

        public String getAnswer() {
        return answer;
    }

    public String getLoginname() {
        return loginname;
    }
    
    
}
