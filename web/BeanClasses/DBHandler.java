/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BeanClasses;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author SHUMAIL
 */
public class DBHandler
{
    final String DbURL = "jdbc:mysql://localhost:3306/mydb?zeroDateTimeBehavior=convertToNull";
      
    final String user = "root";
    final String password = "milo123";
    Connection con =null;
    Statement st=null;
    PreparedStatement pst = null;
    //ResultSet rs = null;
    
    
    public void OpenConnection() 
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(DbURL, user, password);
            st = con.createStatement();
        }
        catch(ClassNotFoundException | SQLException e)
                {
                    e.printStackTrace();
                }
    }
    public boolean AddAccountToTable(user u) 
         {
             
             OpenConnection();
             String query = "insert into user values('"+u.getFirstName()+"','"+u.getLastName()+"', '"+u.getPassword()+"', '"+u.getLoginname()+"', '"+u.getEmail()+"', '"+u.getMobileNumber()+"', '"+u.getGender()+"'  )";
            int ss = 0;
            try {
                ss = st.executeUpdate(query);
           
            
                }
                catch (SQLException ex)
                {
                    Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
                }
                if(ss == 1)
                {    
                    return true;
                    
                }
        return false;
    }
    
    public boolean SearchAccountFromTable(user u)
    {
        OpenConnection();
        String query = "select * from user where loginname like '"+u.getLoginname()+"%'  AND password like '"+u.getPassword()+"%'";
        ResultSet rs = null;
        boolean flag = false;
      
        try {
            rs = st.executeQuery(query);
            while(rs.next())
            {
                String user=rs.getString(1);
                String password=rs.getString(2);
              
               
                
                flag=true;
                
            }
        }   catch(SQLException e)
           {
                e.printStackTrace();
           }
        
        return flag;
    }
    
   public ArrayList<QuestionsAnswered> getQuestionsAnsweredForUser(String lgn)
    {
        ArrayList<QuestionsAnswered> list = new ArrayList<>();
        OpenConnection();
        ResultSet rs = null;
        String query = "select * from QuestionsAnswered where loginname=?";
        
        try {
            pst = con.prepareStatement(query);
            pst.setString(1, lgn);
            rs = pst.executeQuery();
            
            while(rs.next())
            {
                int id =  rs.getInt(1);
                String q = rs.getString(2);
                String a = rs.getString(3);
                String login = rs.getString(4);
                
                QuestionsAnswered qA = new QuestionsAnswered(id,q,a,login);
                list.add(qA);
            }
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        
        
        return list;
    }
    
     public String SearchAccountFromTableForUser(String searched)
    {
        OpenConnection();
        String query = "select * from user where loginname like '"+searched+"' ";
        ResultSet rs = null;
        String searchedUser = null;
        //ArrayList<String> list = new ArrayList();
      
        try {
            rs = st.executeQuery(query);
            
            while(rs.next())
            {
                searchedUser =rs.getString(4);
                System.out.println(searchedUser);
                //list.add(searchedUser);
               
                
               
                
            }
        }   catch(SQLException e)
           {
                e.printStackTrace();
           }
        
       return searchedUser;
    }
    public String SearchUsersFullName(String login)
    {
         OpenConnection();
        String query = "select * from user where loginname like '"+login+"' ";
        ResultSet rs = null;
        String fname = null;
        String lname = null;
        
      
        try {
            rs = st.executeQuery(query);
            
            while(rs.next())
            {
                fname=rs.getString(1);
                lname=rs.getString(2);
               
            }
        }   catch(SQLException e)
           {
                e.printStackTrace();
           }
        fname = fname.concat(" "+lname);
       return fname;
    }
    public boolean sendAnonymousQuestion(String ques, String slgn)
    {
         String noName = null;
         OpenConnection();
         
             String query = "insert into Question values('"+ques+"','"+slgn+"', '"+noName+"' )";
            int rs = 0;
            try {
                rs = st.executeUpdate(query);
                 if(rs == 1)
                {    
                    return true;
                    
                }
           
                }
            
            
                catch (SQLException ex)
                {
                    Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
                }
               
               
         return false;
        
    }
    public boolean sendQuestions(String ques, String slgn,String lgn)
    {
         
         OpenConnection();
             String query = "insert into Question values('"+ques+"','"+slgn+"' , '"+lgn+"' )";
            int rs = 0;
            try {
                rs = st.executeUpdate(query);
           
            
                }
                catch (SQLException ex)
                {
                    Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
                }
                if(rs == 1)
                {    
                    return true;
                    
                }
        return false;
        
    }
     public ArrayList<Question> getQuestionsReceivedForUser(String lgn)
    {
        ArrayList<Question> list = new ArrayList<>();
        OpenConnection();
        ResultSet rs = null;
        String query = "select * from Question where loginname=?";
        
        try {
            pst = con.prepareStatement(query);
            pst.setString(1, lgn);
            rs = pst.executeQuery();
            
            while(rs.next())
            {
                
                String q = rs.getString(1);
                String receiverLgn = rs.getString(2);
                String senderlogin = rs.getString(3);
                
                Question ques = new Question(q,receiverLgn,senderlogin);
                list.add(ques);
            }
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        
        
        return list;
    }
      public boolean saveAnsweredQuestions(String ques, String ans,String lgn) throws SQLException
    {
         
         OpenConnection();
             String query = "insert into QuestionsAnswered values('default','"+ques+"','"+ans+"' , '"+lgn+"' )";
             int rs = 0;
            boolean flag = false;
            try {
                
                rs = st.executeUpdate(query);
                if(rs >0)
                {  
                    flag=true;
                   }
            }
                    catch (SQLException ex)
                {
                    Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
                }
            finally
            {
                return flag;
                
            }
        
    }
    
    public boolean saveAnsweredQuestions(String ques,String lgn) throws SQLException
    {
         
         OpenConnection();
             String qu = "delete from Question where question like '"+ques+"' and loginname like '"+lgn+"' ";
             int rs = 0;
            boolean flag = false;
            try {
                
                rs = st.executeUpdate(qu);
                if(rs >0)
                {    
                    flag=true;
                   }
            }
                    catch (SQLException ex)
                {
                    Logger.getLogger(DBHandler.class.getName()).log(Level.SEVERE, null, ex);
                }
            finally
            {
                return flag;
            }
        
    }
    public ArrayList<QuestionsAnswered> getAllAnsweredQuestions()
    {
        
         ArrayList<QuestionsAnswered> list = new ArrayList<>();
        OpenConnection();
        ResultSet rs = null;
        String query = "select * from QuestionsAnswered";
        
        try {
            pst = con.prepareStatement(query);
            //pst.setString(1, lgn);
            rs = pst.executeQuery();
            
            while(rs.next())
            {
                int id =  rs.getInt(1);
                String q = rs.getString(2);
                String a = rs.getString(3);
                String login = rs.getString(4);
                
                QuestionsAnswered qA = new QuestionsAnswered(id,q,a,login);
                list.add(qA);
            }
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        
        
        return list;
    }
    
}  
      
