package DAO;

import entity.CPU;
import entity.Parts;
import utils.JDBChelp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CPUDAO {
    public ArrayList<CPU> getAllCPU()
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<CPU> list = new ArrayList<CPU>();
        try
        {
            conn = JDBChelp.getConnection();
            String sql = "select * from CPU natural join Parts;";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while(rs.next())
            {
                CPU cpu = new CPU();
                cpu.setPartsID(rs.getInt("partsID"));
                cpu.setRatings(rs.getDouble("ratings"));
                cpu.setPrice(rs.getDouble("price"));
                cpu.setBrand(rs.getString("brand"));
                cpu.setPartsName(rs.getString("partsName"));
                cpu.setType(rs.getString("type"));
                cpu.setCompatible_socket(rs.getString("compatible_socket"));
                cpu.setIntegrated_graphics(rs.getString("integrated_graphics"));
                cpu.setPower_consumption(rs.getInt("power_consumption"));
                list.add(cpu);
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