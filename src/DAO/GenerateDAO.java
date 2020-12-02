package DAO;

import entity.Advance;
import entity.CPU;
import entity.PartsAttribute;
import utils.JDBChelp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class GenerateDAO {
    public Map<String, String> gainRecommand(String username){
        AdvanceDAO advanceDAO = new AdvanceDAO();
        Advance advance = advanceDAO.CheckType(username);
        if(advance.getType() == "Office"){
            return officeRecommand(advance);
        }
        return officeRecommand(advance);

    }

    private Map<String, String> officeRecommand(Advance advance){
        Double tp = advance.getTotal_price();
        Map<String, String> toReturn = new HashMap<String, String>();

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try
        {
            conn = JDBChelp.getConnection();
            String sql = "select * from CPU natural join Parts where integrated_graphics<>'None'";
            int flag = 0;
            if(advance.getCPU_brand() != null){
                sql = sql + " and brand=?";
                flag = 1;
            }
            sql = sql+";";
            stmt = conn.prepareStatement(sql);
            if(advance.getCPU_brand() != null){
                stmt.setString(1,advance.getCPU_brand());
            }

            rs = stmt.executeQuery();
            double tempPrice = -100000.0;
            int tempID = -1;
            String tempsocket = null;
            int powerconsumption = -10;
            while(rs.next())
            {
                double currp = rs.getDouble("price");
                int currID = rs.getInt("partsID");
                String currsocket = rs.getString("compatible_socket");
                int currconsumption = rs.getInt("power_consumption");
                if(Math.abs(currp - (tp / 3.0)) < Math.abs(tempPrice - (tp / 3.0))){
                    tempPrice = currp;
                    tempID = currID;
                    tempsocket = currsocket;
                    powerconsumption = currconsumption;
                }
            }
            if(tempID == -1 && flag == 1){
                sql = "select * from CPU natural join Parts where integrated_graphics<>'None';";
                stmt = conn.prepareStatement(sql);
                rs = stmt.executeQuery();
                tempPrice = -100000.0;
                tempID = -1;
                tempsocket = null;
                while(rs.next())
                {
                    double currp = rs.getDouble("price");
                    int currID = rs.getInt("partsID");
                    String currsocket = rs.getString("compatible_socket");
                    int currconsumption = rs.getInt("power_consumption");
                    if(Math.abs(currp - (tp / 3.0)) < Math.abs(tempPrice - (tp / 3.0))){
                        tempPrice = currp;
                        tempID = currID;
                        tempsocket = currsocket;
                        powerconsumption = currconsumption;
                    }
                }
            }
            toReturn.put("CPU", Integer.toString(tempID));

            if(tempsocket == null){
                System.out.println("CPU falls");
                return null;
            }

            sql = "select * from Motherboard natural join Parts where compatible_socket=?";
            flag = 0;
            if(advance.getMotherboard_brand() != null){
                sql = sql + " and brand=?";
                flag = 1;
            }
            sql = sql+";";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,tempsocket);
            if(advance.getMotherboard_brand() != null){
                stmt.setString(2,advance.getMotherboard_brand());
            }

            rs = stmt.executeQuery();
            tempPrice = -100000.0;
            tempID = -1;
            int tempm2 = -10;
            while(rs.next())
            {
                double currp = rs.getDouble("price");
                int currID = rs.getInt("partsID");
                int currm2 = rs.getInt("number_of_m.2");
                if(Math.abs(currp - (tp / 4.0)) < Math.abs(tempPrice - (tp / 4.0))){
                    tempPrice = currp;
                    tempID = currID;
                    tempm2 = currm2;
                }
            }
            if(tempID == -1 && flag == 1){
                sql = "select * from Motherboard natural join Parts where compatible_socket=?;";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1,tempsocket);
                rs = stmt.executeQuery();
                tempPrice = -100000.0;
                tempID = -1;
                tempm2 = -10;
                while(rs.next())
                {
                    double currp = rs.getDouble("price");
                    int currID = rs.getInt("partsID");
                    int currm2 = rs.getInt("number_of_m.2");
                    if(Math.abs(currp - (tp / 4.0)) < Math.abs(tempPrice - (tp / 4.0))){
                        tempPrice = currp;
                        tempID = currID;
                        tempm2 = currm2;
                    }
                }
            }
            toReturn.put("Motherboard", Integer.toString(tempID));

            sql = "select * from Memory natural join Parts";
            flag = 0;
            if(advance.getMemory_brand() != null){
                sql = sql + " Where brand=?";
                flag = 1;
            }
            sql = sql+";";
            stmt = conn.prepareStatement(sql);
            if(advance.getMemory_brand() != null){
                stmt.setString(1,advance.getMemory_brand());
            }

            rs = stmt.executeQuery();
            tempPrice = -100000.0;
            tempID = -1;
            while(rs.next())
            {
                double currp = rs.getDouble("price");
                int currID = rs.getInt("partsID");
                if(Math.abs(currp - (tp / 12.0)) < Math.abs(tempPrice - (tp / 12.0))){
                    tempPrice = currp;
                    tempID = currID;
                }
            }
            if(tempID == -1 && flag == 1){
                sql = "select * from Memory natural join Parts;";
                stmt = conn.prepareStatement(sql);
                rs = stmt.executeQuery();
                tempPrice = -100000.0;
                tempID = -1;
                while(rs.next())
                {
                    double currp = rs.getDouble("price");
                    int currID = rs.getInt("partsID");
                    if(Math.abs(currp - (tp / 12.0)) < Math.abs(tempPrice - (tp / 12.0))){
                        tempPrice = currp;
                        tempID = currID;
                    }
                }
            }
            toReturn.put("Memory", Integer.toString(tempID));



            sql = "select * from CoolingSystem natural join Parts";
            flag = 0;
            int sqlflag = 0;
            if(advance.getCoolerRGB() == 0){
                sql = sql + " where RGB='No'";
                sqlflag = 1;
            } else if(advance.getCoolerRGB() == 1){
                sql = sql + " where RGB='Yes'";
                sqlflag = 1;
            }
            if(advance.getCoolingSystem_brand() != null){
                if(sqlflag == 0){
                    sql = sql + " where brand=?";
                } else{
                    sql = sql + " and brand=?";
                }
                flag = 1;
            }
            sql = sql+";";
            stmt = conn.prepareStatement(sql);

            if(advance.getCoolingSystem_brand() != null){
                stmt.setString(1,advance.getCoolingSystem_brand());
            }

            rs = stmt.executeQuery();
            tempPrice = -100000.0;
            tempID = -1;
            while(rs.next())
            {
                double currp = rs.getDouble("price");
                int currID = rs.getInt("partsID");
                if(Math.abs(currp - (tp / 12.0)) < Math.abs(tempPrice - (tp / 12.0))){
                    tempPrice = currp;
                    tempID = currID;
                }
            }
            if(tempID == -1 && flag == 1){
                sql = "select * from CoolingSystem natural join Parts";
                if(advance.getCoolerRGB() == 0){
                    sql = sql + " where RGB='No'";
                } else if(advance.getCoolerRGB() == 1){
                    sql = sql + " where RGB='Yes'";
                }
                sql = sql+";";
                stmt = conn.prepareStatement(sql);
                rs = stmt.executeQuery();
                tempPrice = -100000.0;
                tempID = -1;
                while(rs.next())
                {
                    double currp = rs.getDouble("price");
                    int currID = rs.getInt("partsID");
                    if(Math.abs(currp - (tp / 12.0)) < Math.abs(tempPrice - (tp / 12.0))){
                        tempPrice = currp;
                        tempID = currID;
                    }
                }
            }
            toReturn.put("Coolingsystem", Integer.toString(tempID));




            sql = "select * from PowerSupply natural join Parts Where Wattage>=?";
            flag = 0;
            if(advance.getPowerSupply_brand() != null){
                sql = sql + " and brand=?";
                flag = 1;
            }
            sql = sql+";";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, powerconsumption);
            if(advance.getPowerSupply_brand() != null){
                stmt.setString(2,advance.getPowerSupply_brand());
            }

            rs = stmt.executeQuery();
            tempPrice = -100000.0;
            tempID = -1;
            while(rs.next())
            {
                double currp = rs.getDouble("price");
                int currID = rs.getInt("partsID");
                if(Math.abs(currp - (tp / 10.0)) < Math.abs(tempPrice - (tp / 10.0))){
                    tempPrice = currp;
                    tempID = currID;
                }
            }
            if(tempID == -1 && flag == 1){
                sql = "select * from PowerSupply natural join Parts Where Wattage>=?;";
                stmt = conn.prepareStatement(sql);
                stmt.setInt(1, powerconsumption);
                rs = stmt.executeQuery();
                tempPrice = -100000.0;
                tempID = -1;
                while(rs.next())
                {
                    double currp = rs.getDouble("price");
                    int currID = rs.getInt("partsID");
                    if(Math.abs(currp - (tp / 10.0)) < Math.abs(tempPrice - (tp / 10.0))){
                        tempPrice = currp;
                        tempID = currID;
                    }
                }
            }
            toReturn.put("Powersupply", Integer.toString(tempID));


            sql = "select * from Storage natural join Parts";
            flag = 0;
            sqlflag = 0;
            if(tempm2 == 0) {
                sql=sql + " where inteface<>'M.2'";
                sqlflag=1;
            }
            if(advance.getStorage_brand() != null){
                if(sqlflag == 0){
                    sql = sql + " where brand=?";
                } else{
                    sql = sql + " and brand=?";
                }
                flag = 1;
            }
            sql = sql+";";
            stmt = conn.prepareStatement(sql);

            if(advance.getStorage_brand() != null){
                stmt.setString(1,advance.getStorage_brand());
            }

            rs = stmt.executeQuery();
            tempPrice = -100000.0;
            tempID = -1;
            while(rs.next())
            {
                double currp = rs.getDouble("price");
                int currID = rs.getInt("partsID");
                if(Math.abs(currp - (tp / 15.0)) < Math.abs(tempPrice - (tp / 15.0))){
                    tempPrice = currp;
                    tempID = currID;
                }
            }
            if(tempID == -1 && flag == 1){
                sql = "select * from Storage natural join Parts";
                if(tempm2 == 0) {
                    sql=sql + " where inteface<>'M.2'";
                }
                sql = sql+";";
                stmt = conn.prepareStatement(sql);
                rs = stmt.executeQuery();
                tempPrice = -100000.0;
                tempID = -1;
                while(rs.next())
                {
                    double currp = rs.getDouble("price");
                    int currID = rs.getInt("partsID");
                    if(Math.abs(currp - (tp / 15.0)) < Math.abs(tempPrice - (tp / 15.0))){
                        tempPrice = currp;
                        tempID = currID;
                    }
                }
            }
            toReturn.put("Storage", Integer.toString(tempID));
            toReturn.put("Storage2", Integer.toString(tempID));



            sql = "select * from ComputerCase natural join Parts";
            flag = 0;
            sqlflag = 0;
            if(advance.getCaseRGB() == 0){
                sql = sql + " where RGB='No'";
                sqlflag = 1;
            } else if(advance.getCaseRGB() == 1){
                sql = sql + " where RGB='Yes'";
                sqlflag = 1;
            }
            if (advance.getCaseNoiseProof() == 0) {
                    if(sqlflag == 0){
                        sql = sql + " where noise_proof='No'";
                        sqlflag = 1;
                    } else{
                        sql = sql + " and noise_proof='No'";
                    }

            } else if(advance.getCaseNoiseProof() == 1){
                    if(sqlflag == 0){
                        sql = sql + " where noise_proof='Yes'";
                        sqlflag = 1;
                    } else{
                        sql = sql + " and noise_proof='Yes'";
                    }
            }

            if(advance.getComputerCase_brand() != null){
                if(sqlflag == 0){
                    sql = sql + " where brand=?";
                } else{
                    sql = sql + " and brand=?";
                }
                flag = 1;
            }

            sql = sql+";";
            stmt = conn.prepareStatement(sql);

            if(advance.getComputerCase_brand() != null){
                stmt.setString(1,advance.getComputerCase_brand());
            }

            rs = stmt.executeQuery();
            tempPrice = -100000.0;
            tempID = -1;
            while(rs.next())
            {
                double currp = rs.getDouble("price");
                int currID = rs.getInt("partsID");
                if(Math.abs(currp - (tp * 7.0 / 60.0)) < Math.abs(tempPrice - (tp * 7.0 / 60.0))){
                    tempPrice = currp;
                    tempID = currID;
                }
            }
            if(tempID == -1 && flag == 1){
                sqlflag = 0;
                sql = "select * from ComputerCase natural join Parts";
                if(advance.getCaseRGB() == 0){
                    sql = sql + " where RGB='No'";
                    sqlflag = 1;
                } else if(advance.getCoolerRGB() == 1){
                    sql = sql + " where RGB='Yes'";
                    sqlflag = 1;
                }
                if (advance.getCaseNoiseProof() == 0) {
                    if(sqlflag == 0){
                        sql = sql + " where noise_proof='No'";
                    } else{
                        sql = sql + " and noise_proof='No'";
                    }

                } else if(advance.getCaseNoiseProof() == 1){
                    if(sqlflag == 0){
                        sql = sql + " where noise_proof='Yes'";
                    } else{
                        sql = sql + " and noise_proof='Yes'";
                    }
                }
                sql = sql+";";
                stmt = conn.prepareStatement(sql);
                rs = stmt.executeQuery();
                tempPrice = -100000.0;
                tempID = -1;
                while(rs.next())
                {
                    double currp = rs.getDouble("price");
                    int currID = rs.getInt("partsID");
                    if(Math.abs(currp - (tp * 7.0 / 60.0)) < Math.abs(tempPrice - (tp * 7.0 / 60.0))){
                        tempPrice = currp;
                        tempID = currID;
                    }
                }
            }
            toReturn.put("ComputerCase", Integer.toString(tempID));







            return toReturn;
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

