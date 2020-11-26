package DAO;

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
}
