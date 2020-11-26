package DAO;

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
}
