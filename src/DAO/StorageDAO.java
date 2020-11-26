package DAO;

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
