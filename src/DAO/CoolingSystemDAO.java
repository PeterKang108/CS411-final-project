package DAO;

import entity.ComputerCase;
import entity.CoolingSystem;
import entity.Parts;
import utils.JDBChelp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CoolingSystemDAO {

    public ArrayList<CoolingSystem> getAllCoolingSystem()
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<CoolingSystem> list = new ArrayList<CoolingSystem>();
        try
        {
            conn = JDBChelp.getConnection();
            String sql = "select * from CoolingSystem natural join Parts;";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while(rs.next())
            {
                CoolingSystem part=new CoolingSystem();
                part.setPartsID(rs.getInt("partsID"));
                part.setRatings(rs.getDouble("ratings"));
                part.setPrice(rs.getDouble("price"));
                part.setBrand(rs.getString("brand"));
                part.setPartsName(rs.getString("partsName"));
                part.setType(rs.getString("type"));
                part.setCompatible_socket(rs.getString("compatible_socket"));
                part.setCooler_type(rs.getString("cooler_type"));
                part.setRadiator_size(rs.getDouble("radiator_size"));
                part.setRGB(rs.getString("RGB"));
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

    public CoolingSystem getSpecialCoolingSystem(int partsID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try
        {
            conn = JDBChelp.getConnection();
            String sql = "select * from CoolingSystem natural join Parts where partsID=?;";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,partsID);
            rs = stmt.executeQuery();
            while(rs.next())
            {
                CoolingSystem part=new CoolingSystem();
                part.setPartsID(rs.getInt("partsID"));
                part.setRatings(rs.getDouble("ratings"));
                part.setPrice(rs.getDouble("price"));
                part.setBrand(rs.getString("brand"));
                part.setPartsName(rs.getString("partsName"));
                part.setType(rs.getString("type"));
                part.setCompatible_socket(rs.getString("compatible_socket"));
                part.setCooler_type(rs.getString("cooler_type"));
                part.setRadiator_size(rs.getDouble("radiator_size"));
                part.setRGB(rs.getString("RGB"));
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


    public int insertCoolingSystem(CoolingSystem part){
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
            sql = "insert into CoolingSystem(partsID, cooler_type, radiator_size, RGB, compatible_socket)" +
                    "values(?,?,?,?,?);";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, part.getPartsID());
            stmt.setString(2, part.getCooler_type());
            stmt.setDouble(3, part.getRadiator_size());
            stmt.setString(4, part.getRGB());
            stmt.setString(5, part.getCompatible_socket());
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
