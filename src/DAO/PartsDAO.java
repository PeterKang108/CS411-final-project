package DAO;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import entity.Parts;
import org.bson.Document;
import org.bson.types.ObjectId;
import utils.JDBChelp;
import utils.MangoDBhelp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static com.mongodb.client.model.Filters.eq;

public class PartsDAO {

    public ArrayList<Parts> getAllParts()
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Parts> list = new ArrayList<Parts>();
        try
        {
            conn = JDBChelp.getConnection();
            String sql = "select * from Parts;";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while(rs.next())
            {
                Parts part = new Parts();
                part.setPartsID(rs.getInt("partsID"));
                part.setRatings(rs.getDouble("ratings"));
                part.setPrice(rs.getDouble("price"));
                part.setBrand(rs.getString("brand"));
                part.setPartsName(rs.getString("partsName"));
                part.setType(rs.getString("type"));
//                part.setLink(rs.getLink("link"));
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

    public int insertParts(Parts part){
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
//            stmt.setString(7, part.getLink());
            stmt.executeUpdate();
            return 1;

        }
        catch (Exception ex)
        {
            ex.printStackTrace();
            return 0;
        }
        finally {
//            if(rs != null){
//                try {
//                    rs.close();
//                    rs = null;
//                } catch (SQLException throwables) {
//                    throwables.printStackTrace();
//                }
//
//            }

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

    public ArrayList<Parts> getPartswithid(int PartsID)
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Parts> list = new ArrayList<Parts>();
        try
        {
            conn = JDBChelp.getConnection();
            String sql = "select * from Parts where partsID=?;";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,PartsID);
            rs = stmt.executeQuery();
            while(rs.next())
            {
                Parts part = new Parts();
                part.setPartsID(rs.getInt("partsID"));
                part.setRatings(rs.getDouble("ratings"));
                part.setPrice(rs.getDouble("price"));
                part.setBrand(rs.getString("brand"));
                part.setPartsName(rs.getString("partsName"));
                part.setType(rs.getString("type"));
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


    public int deleteParts(int partsID){
        Connection conn = null;
        PreparedStatement stmt = null;
        try
        {
            conn = JDBChelp.getConnection();
            String sql = "delete from Parts where partsID=?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,partsID);
            stmt.executeUpdate();
            MongoDatabase database = MangoDBhelp.getconn1();
            MongoCollection<Document> collection = database.getCollection("userhistory");
            collection.deleteMany(eq("CPU", partsID));
            collection.deleteMany(eq("GPU", partsID));
            collection.deleteMany(eq("GPU2", partsID));
            collection.deleteMany(eq("Motherboard", partsID));
            collection.deleteMany(eq("ComputerCase", partsID));
            collection.deleteMany(eq("Memory", partsID));
            collection.deleteMany(eq("Memory2", partsID));
            collection.deleteMany(eq("Storage", partsID));
            collection.deleteMany(eq("Storage2", partsID));
            collection.deleteMany(eq("Storage3", partsID));
            collection.deleteMany(eq("Storage4", partsID));
            collection.deleteMany(eq("Storage5", partsID));
            collection.deleteMany(eq("Storage6", partsID));
            collection.deleteMany(eq("Coolingsystem", partsID));
            collection.deleteMany(eq("Powersupply", partsID));



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

    public int updatePrice(int partsID, double price){
        Connection conn = null;
        PreparedStatement stmt = null;
        try
        {
            conn = JDBChelp.getConnection();
            String sql = "update Parts set price='" + price +"' where partsID='" + partsID+"'";
            stmt = conn.prepareStatement(sql);
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
