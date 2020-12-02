package DAO;

import entity.GPU;
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
                part.setRGB(rs.getString("RGB"));
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

    public Motherboard getSpecialMotherboard(int partsID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try
        {
            conn = JDBChelp.getConnection();
            String sql = "select * from Motherboard natural join Parts where partsID=?;";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,partsID);
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

    public int insertMotherboard(Motherboard part){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try
        {
            conn = JDBChelp.getConnection();
            String sql = "insert into Parts(partsID, ratings, price, brand, partsName, type) " +
                    "values(?,?,?,?,?,?);";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, part.getPartsID());
            stmt.setDouble(2, part.getRatings());
            stmt.setDouble(3, part.getPrice());
            stmt.setString(4, part.getBrand());
            stmt.setString(5, part.getPartsName());
            stmt.setString(6, part.getType());
            stmt.executeUpdate();

            String sqll = "insert into Motherboard(partsID, compatible_socket, PCIe_version, number_of_PCIe_X1, RGB, " +
                    "USB3.0_supported, number_of_m2, Motherboard_type) " +
                    "values(?,?,?,?,?,?,?,?);";

            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, part.getPartsID());
            stmt.setString(2, part.getCompatible_socket());
            stmt.setString(3, part.getPCIe_version());
            stmt.setInt(4, part.getNumber_of_PCIe_X1());
            stmt.setString(5, part.getRGB());
            stmt.setString(6, part.getUSB3_supported());
            stmt.setInt(7, part.getNumber_of_m2());
            stmt.setString(8, part.getMotherboard_type());
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
