package DAO;

import entity.ComputerCase;
import entity.Parts;
import utils.JDBChelp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ComputerCaseDAO {

    public ArrayList<ComputerCase> getAllComputerCase()
    {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<ComputerCase> list = new ArrayList<ComputerCase>();
        try
        {
            conn = JDBChelp.getConnection();
            String sql = "select * from ComputerCase natural join Parts;";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while(rs.next())
            {
                ComputerCase part = new ComputerCase();
                part.setPartsID(rs.getInt("partsID"));
                part.setRatings(rs.getDouble("ratings"));
                part.setPrice(rs.getDouble("price"));
                part.setBrand(rs.getString("brand"));
                part.setPartsName(rs.getString("partsName"));
                part.setType(rs.getString("type"));
                part.setCase_type(rs.getString("Case_type"));
                part.setNoise_proof (rs.getString ("noise_proof"));
                part.setNumber_of_case_fan (rs.getInt ("number_of_case_fan"));
                part.setRGB (rs.getString ("RGB"));
                part.setSide_panel (rs.getString ("side_panel"));
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
