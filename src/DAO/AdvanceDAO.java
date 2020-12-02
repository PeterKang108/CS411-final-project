package DAO;

import entity.Advance;
import entity.ComputerCase;
import entity.MongoDBresult;
import entity.PartsAttribute;
import utils.JDBChelp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdvanceDAO {
    public Advance CheckType(String username){
        MongoDAO mongoDAO = new MongoDAO();
        ArrayList<MongoDBresult> mongo = mongoDAO.findUserDocuments(username);
        ArrayList<Integer> CPUID = new ArrayList<Integer>();
        ArrayList<Integer> GPUID = new ArrayList<Integer>();
        ArrayList<Integer> ComputerCaseID = new ArrayList<Integer>();
        ArrayList<Integer> CoolingSystemID = new ArrayList<Integer>();
        ArrayList<Integer> MemoryID = new ArrayList<Integer>();
        ArrayList<Integer> MotherboardID = new ArrayList<Integer>();
        ArrayList<Integer> PowerSupplyID = new ArrayList<Integer>();
        ArrayList<Integer> StorageID = new ArrayList<Integer>();
        Advance toReturn = new Advance();

        int count = 0;
        for (MongoDBresult m : mongo){
            count++;
            if(m.getCPU() != -1){
                CPUID.add(m.getCPU());
            }
            if(m.getGPU() != -1){
                GPUID.add(m.getGPU());
            }
            if(m.getGPU2() != -1){
                GPUID.add(m.getGPU2());
            }
            if(m.getComputerCase() != -1){
                ComputerCaseID.add(m.getComputerCase());
            }
            if(m.getCoolingsystem() != -1){
                CoolingSystemID.add(m.getCoolingsystem());
            }
            if(m.getMemory() != -1){
                MemoryID.add(m.getMemory());
            }
            if(m.getMemory2() != -1){
                MemoryID.add(m.getMemory2());
            }
            if(m.getMotherboard() != -1){
                MotherboardID.add(m.getMotherboard());
            }
            if(m.getPowersupply() != -1){
                PowerSupplyID.add(m.getPowersupply());
            }
            if(m.getStorage() != -1){
                StorageID.add(m.getStorage());
            }
            if(m.getStorage2() != -1){
                StorageID.add(m.getStorage2());
            }
            if(m.getStorage3() != -1){
                StorageID.add(m.getStorage3());
            }
            if(m.getStorage4() != -1){
                StorageID.add(m.getStorage4());
            }
            if(m.getStorage5() != -1){
                StorageID.add(m.getStorage5());
            }
            if(m.getStorage6() != -1){
                StorageID.add(m.getStorage6());
            }
        }
        PartsAttribute cpuPart = sqlCPU(CPUID);


    }

    public PartsAttribute sqlCPU(ArrayList<Integer> CPUID){

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        PartsAttribute toreturn = new PartsAttribute();
        if(CPUID.size() == 0){
            return null;
        }
        try
        {
            double price_count = 0.0;
            conn = JDBChelp.getConnection();
            String sql = "select price from CPU natural join Parts where partsID IN (";
            for(int i = 0; i < CPUID.size(); i++){
                if (i == CPUID.size() - 1){
                    sql = sql + "?);";
                } else{
                    sql = sql + "?,";
                }


            }
            stmt = conn.prepareStatement(sql);
            for(int i = 0; i < CPUID.size(); i++){
                stmt.setInt(i+1, CPUID.get(i+1));
            }
            rs = stmt.executeQuery();
            while(rs.next())
            {
                price_count += rs.getDouble("price");
            }
            toreturn.setPrice(price_count);
            //get brand

            sql = "select brand, COUNT(partsID) AS counter from CPU natural join Parts where partsID IN (";
            for(int i = 0; i < CPUID.size(); i++){
                if (i == CPUID.size() - 1){
                    sql = sql + "?) ";
                } else{
                    sql = sql + "?,";
                }


            }
            sql = sql + "GROUP BY brand;";
            stmt = conn.prepareStatement(sql);
            for(int i = 0; i < CPUID.size(); i++){
                stmt.setInt(i+1, CPUID.get(i+1));
            }
            rs = stmt.executeQuery();
            while(rs.next())
            {
                if(rs.getInt("counter") >= 3){
                    toreturn.setBrand(rs.getString("brand"));
                    break;
                }
            }
            return toreturn;


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
