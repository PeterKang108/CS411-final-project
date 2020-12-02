package DAO;

import entity.CoolingSystem;
import entity.Memory;
import entity.Parts;
import utils.JDBChelp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemoryDAO {
    public ArrayList<Memory> getAllMemory()
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Memory> list = new ArrayList<Memory>();
        try
        {
            conn = JDBChelp.getConnection();
            String sql = "select * from Memory natural join Parts;";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while(rs.next())
            {
                Memory part = new Memory();
                part.setPartsID(rs.getInt("partsID"));
                part.setRatings(rs.getDouble("ratings"));
                part.setPrice(rs.getDouble("price"));
                part.setBrand(rs.getString("brand"));
                part.setPartsName(rs.getString("partsName"));
                part.setType(rs.getString("type"));
                part.setModules(rs.getString("modules"));
                part.setRAM_type(rs.getString("RAM_type"));
                part.setPrice_per_GB(rs.getFloat("price_per_gb"));
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

    public Memory getSpecialMemory(int partsID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try
        {
            conn = JDBChelp.getConnection();
            String sql = "select * from Memory natural join Parts where partsID=?;";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,partsID);
            rs = stmt.executeQuery();
            while(rs.next())
            {
                Memory part = new Memory();
                part.setPartsID(rs.getInt("partsID"));
                part.setRatings(rs.getDouble("ratings"));
                part.setPrice(rs.getDouble("price"));
                part.setBrand(rs.getString("brand"));
                part.setPartsName(rs.getString("partsName"));
                part.setType(rs.getString("type"));
                part.setModules(rs.getString("modules"));
                part.setRAM_type(rs.getString("RAM_type"));
                part.setPrice_per_GB(rs.getFloat("price_per_gb"));
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



    public int insertMemory(Memory part){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
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
            String sqll = "insert into Memory(partsID, modules, RAM_type)" +
                    "values(?,?,?);";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, part.getPartsID());
            stmt.setString(2, part.getModules());
            stmt.setString(3, part.getRAM_type());
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
