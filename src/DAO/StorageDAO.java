package DAO;

import entity.Memory;
import entity.Parts;
import entity.Storage;
import utils.JDBChelp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StorageDAO {
    public ArrayList<Storage> getAllStorage()
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Storage> list = new ArrayList<Storage>();
        try
        {
            conn = JDBChelp.getConnection();
            String sql = "select * from Storage natural join Parts;";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while(rs.next())
            {
                Storage part = new Storage();
                part.setPartsID(rs.getInt("partsID"));
                part.setRatings(rs.getDouble("ratings"));
                part.setPrice(rs.getDouble("price"));
                part.setBrand(rs.getString("brand"));
                part.setPartsName(rs.getString("partsName"));
                part.setType(rs.getString("type"));
                part.setCapacity(rs.getInt("capacity"));
                part.setInterface(rs.getString("interface"));
                part.setStorage_type(rs.getString("storage_type"));
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

    public Storage getSpecialStorage(int partsID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try
        {
            conn = JDBChelp.getConnection();
            String sql = "select * from Storage natural join Parts where partsID=?;";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,partsID);
            rs = stmt.executeQuery();
            while(rs.next())
            {
                Storage part = new Storage();
                part.setPartsID(rs.getInt("partsID"));
                part.setRatings(rs.getDouble("ratings"));
                part.setPrice(rs.getDouble("price"));
                part.setBrand(rs.getString("brand"));
                part.setPartsName(rs.getString("partsName"));
                part.setType(rs.getString("type"));
                part.setCapacity(rs.getInt("capacity"));
                part.setInterface(rs.getString("interface"));
                part.setStorage_type(rs.getString("storage_type"));
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


    public int insertStorage(Storage part){
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
            String sqll = "insert into Storage(partsID, storage_type, capacity, interface, price_per_gb)" +
                    "values(?,?,?,?,?);";
            stmt = conn.prepareStatement(sqll);
            stmt.setInt(1, part.getPartsID());
            stmt.setString(2, part.getStorage_type());
            stmt.setInt(3, part.getCapacity());
            stmt.setString(4, part.getInterface());
            stmt.setFloat(5, part.getPrice_per_GB());
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
