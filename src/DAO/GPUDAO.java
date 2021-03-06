package DAO;

import entity.CPU;
import entity.GPU;
import entity.Parts;
import utils.JDBChelp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GPUDAO {
    public ArrayList<GPU> getAllGPU()
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<GPU> list = new ArrayList<GPU>();
        try
        {
            conn = JDBChelp.getConnection();
            String sql = "select * from GPU natural join Parts;";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while(rs.next())
            {
                GPU part = new GPU();
                part.setPartsID(rs.getInt("partsID"));
                part.setRatings(rs.getDouble("ratings"));
                part.setPrice(rs.getDouble("price"));
                part.setBrand(rs.getString("brand"));
                part.setPartsName(rs.getString("partsName"));
                part.setType(rs.getString("type"));
                part.setChipset(rs.getString("chipset"));
                part.setGPU_memory(rs.getInt("GPU_memory"));
                part.setGPU_type(rs.getString("GPU_type"));
                part.setInterface_type(rs.getString("interface_type"));
                part.setPower_consumption(rs.getInt("power_consumption"));
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

    public GPU getSpecialGPU(int partsID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try
        {
            conn = JDBChelp.getConnection();
            String sql = "select * from GPU natural join Parts where partsID=?;";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,partsID);
            rs = stmt.executeQuery();
            while(rs.next())
            {
                GPU part = new GPU();
                part.setPartsID(rs.getInt("partsID"));
                part.setRatings(rs.getDouble("ratings"));
                part.setPrice(rs.getDouble("price"));
                part.setBrand(rs.getString("brand"));
                part.setPartsName(rs.getString("partsName"));
                part.setType(rs.getString("type"));
                part.setChipset(rs.getString("chipset"));
                part.setGPU_memory(rs.getInt("GPU_memory"));
                part.setGPU_type(rs.getString("GPU_type"));
                part.setInterface_type(rs.getString("interface_type"));
                part.setPower_consumption(rs.getInt("power_consumption"));
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


    public int insertGPU(GPU part){
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
            sql = "insert into GPU(partsID, GPU_type, chipset, GPU_memory, power_consumption, interface_type, RGB)" +
                    "values(?,?,?,?,?,?);";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, part.getPartsID());
            stmt.setString(2, part.getGPU_type());
            stmt.setString(3, part.getChipset());
            stmt.setInt(4, part.getGPU_memory());
            stmt.setString(5, part.getInterface_type());
            stmt.setString(6, part.getRGB());
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
