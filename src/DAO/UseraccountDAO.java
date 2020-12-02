package DAO;

import entity.Parts;
import entity.Useraccount;
import utils.JDBChelp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UseraccountDAO {
    //check user, if exist return a Useraccount entity, else return null
    public Useraccount Usercheck(String username, String password){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Useraccount user = null;
        try
        {
            conn = JDBChelp.getConnection();
            String sql = "select * from Useraccount where Username=? and Password=?;";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            rs = stmt.executeQuery();
            if(rs.next()){
                user = new Useraccount();
                user.setUsername(username);
                user.setPassword(password);
                user.setType(rs.getString("Type"));
            }

        }
        catch (Exception ex)
        {
            ex.printStackTrace();
            return null;
        }
        finally {
            if(rs != null){
                try {
                    rs.close();
                    rs = null;
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }

            }

            if(stmt != null){
                try {
                    stmt.close();
                    stmt = null;
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }

            }

        }
        return user;
    }

    public int Createuser(String username, String password){
        if(Usercheck(username, password) != null){
            return -1;
        }
        Connection conn = null;
        PreparedStatement stmt = null;
//        ResultSet rs = null;
        try
        {
            conn = JDBChelp.getConnection();
            String sql = "insert into Useraccount(Username, Password)" +
                    "values(?,?);";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.executeUpdate();
            return 1;

        }
        catch (Exception ex)
        {
            ex.printStackTrace();
            return 0;
        }
        finally {
//            if(rs != null){
//                try {
//                    rs.close();
//                    rs = null;
//                } catch (SQLException throwables) {
//                    throwables.printStackTrace();
//                }
//
//            }

            if(stmt != null){
                try {
                    stmt.close();
                    stmt = null;
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }

            }

        }
    }

}
