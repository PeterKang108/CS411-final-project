package DAO;

import entity.ComputerCase;
import entity.Parts;
import utils.JDBChelp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ComputerCaseDAO {

    public ArrayList<ComputerCase> getAllComputerCase()
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<ComputerCase> list = new ArrayList<ComputerCase>();
        try
        {
            conn = JDBChelp.getConnection();
            String sql = "select * from ComputerCase natural join Parts;";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while(rs.next())
            {
                ComputerCase part = new ComputerCase();
                part.setPartsID(rs.getInt("partsID"));
                part.setRatings(rs.getDouble("ratings"));
                part.setPrice(rs.getDouble("price"));
                part.setBrand(rs.getString("brand"));
                part.setPartsName(rs.getString("partsName"));
                part.setType(rs.getString("type"));
                part.setCase_type(rs.getString("Case_type"));
                part.setNoise_proof (rs.getString ("noise_proof"));
                part.setNumber_of_case_fan (rs.getInt ("number_of_case_fans"));
                part.setRGB (rs.getString ("RGB"));
                part.setSide_panel (rs.getString ("side_panel"));
                list.add(part);
            }
            return list;
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
    }

    public ComputerCase getSpecialComputerCase(int partsID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<ComputerCase> list = new ArrayList<ComputerCase>();
        try
        {
            conn = JDBChelp.getConnection();
            String sql = "select * from ComputerCase natural join Parts where partsID=?;";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,partsID);
            rs = stmt.executeQuery();
            while(rs.next())
            {
                ComputerCase part = new ComputerCase();
                part.setPartsID(rs.getInt("partsID"));
                part.setRatings(rs.getDouble("ratings"));
                part.setPrice(rs.getDouble("price"));
                part.setBrand(rs.getString("brand"));
                part.setPartsName(rs.getString("partsName"));
                part.setType(rs.getString("type"));
                part.setCase_type(rs.getString("Case_type"));
                part.setNoise_proof (rs.getString ("noise_proof"));
                part.setNumber_of_case_fan (rs.getInt ("number_of_case_fans"));
                part.setRGB (rs.getString ("RGB"));
                part.setSide_panel (rs.getString ("side_panel"));
                return part;
            }
            return null;

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
    }

    public int insertComputerCase(ComputerCase part){
        Connection conn = null;
        PreparedStatement stmt = null;
//        ResultSet rs = null;
        try
        {
            conn = JDBChelp.getConnection();
            String sql = "insert into Parts(partsID, ratings, price, brand, partsName, type)" +
                    "values(?,?,?,?,?,?);";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, part.getPartsID());
            stmt.setDouble(2, part.getRatings());
            stmt.setDouble(3, part.getPrice());
            stmt.setString(4, part.getBrand());
            stmt.setString(5, part.getPartsName());
            stmt.setString(6, part.getType());
            stmt.executeUpdate();
            sql = "insert into ComputerCase(partsID, Case_type, number_of_case_fans, RGB, side_panel, noise_proof)" +
                    "values(?,?,?,?,?,?);";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, part.getPartsID());
            stmt.setString(2, part.getCase_type());
            stmt.setInt(3, part.getNumber_of_case_fan());
            stmt.setString(4, part.getRGB());
            stmt.setString(5, part.getSide_panel());
            stmt.setString(6, part.getNoise_proof());
            stmt.executeUpdate();
            return 1;

        }
        catch (Exception ex)
        {
            ex.printStackTrace();
            return 0;
        }
        finally {

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
