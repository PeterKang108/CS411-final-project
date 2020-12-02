package DAO;

import entity.Motherboard;
import entity.Parts;
import utils.JDBChelp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MotherboardDAO {
    public ArrayList<Motherboard> getAllMotherboard()
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Motherboard> list = new ArrayList<Motherboard>();
        try
        {
            conn = JDBChelp.getConnection();
            String sql = "select * from Motherboard natural join Parts;";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while(rs.next())
            {
                Motherboard part = new Motherboard();
                part.setPartsID(rs.getInt("partsID"));
                part.setRatings(rs.getDouble("ratings"));
                part.setPrice(rs.getDouble("price"));
                part.setBrand(rs.getString("brand"));
                part.setPartsName(rs.getString("partsName"));
                part.setType(rs.getString("type"));
                part.setCompatible_socket(rs.getString("compatible_socket"));
                part.setMotherboard_type(rs.getString("Motherboard_type"));
                part.setNumber_of_m2(rs.getInt("number_of_m.2"));
                part.setPCIe_version(rs.getString("PCIe_version"));
                part.setNumber_of_PCIe_X1(rs.getInt("number_of_PCIe_X1"));
                part.setUSB3_supported(rs.getString("USB3.0_supported"));

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
