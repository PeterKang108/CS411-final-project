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
        double totalp = 0.0;
        PartsAttribute cpuPart = sqlCPU(CPUID);
        if(cpuPart.getBrand() != null){
            toReturn.setCPU_brand(cpuPart.getBrand());
        }
        totalp += cpuPart.getPrice();
        PartsAttribute gpuPart = sqlGPU(GPUID);
        if(gpuPart.getBrand() != null){
            toReturn.setGPU_brand(gpuPart.getBrand());
        }
        toReturn.setGPURGB(gpuPart.getRGB());
        totalp += gpuPart.getPrice();
        PartsAttribute casePart = sqlComputerCase(ComputerCaseID);
        if(casePart.getBrand() != null){
            toReturn.setComputerCase_brand(casePart.getBrand());
        }
        toReturn.setCaseRGB(casePart.getRGB());
        toReturn.setCaseNoiseProof(casePart.getNoiseproof());
        totalp += casePart.getPrice();
        PartsAttribute coolerPart = sqlCooler(CoolingSystemID);
        if(coolerPart.getBrand() != null){
            toReturn.setCoolingSystem_brand(coolerPart.getBrand());
        }
        toReturn.setCoolerRGB(coolerPart.getRGB());
        totalp += coolerPart.getPrice();
        PartsAttribute memoryPart = sqlMemory(MemoryID);
        if(memoryPart.getBrand() != null){
            toReturn.setMemory_brand(memoryPart.getBrand());
        }
        totalp += memoryPart.getPrice();
        PartsAttribute motherboardPart = sqlMotherboard(MotherboardID);
        if(motherboardPart.getBrand() != null){
            toReturn.setMotherboard_brand(motherboardPart.getBrand());
        }
        toReturn.setMotherboardRGB(motherboardPart.getRGB());
        totalp += motherboardPart.getPrice();
        PartsAttribute powersupplyPart = sqlPowersupply(PowerSupplyID);
        if(powersupplyPart.getBrand() != null){
            toReturn.setPowerSupply_brand(powersupplyPart.getBrand());
        }
        totalp += powersupplyPart.getPrice();
        PartsAttribute storagePart = sqlStorage(StorageID);
        if(storagePart.getBrand() != null){
            toReturn.setStorage_brand(storagePart.getBrand());
        }
        totalp += storagePart.getPrice();
        double realtotalp = totalp / (double) count;
        toReturn.setTotal_price(realtotalp);
        double avgstoragenum = (double) StorageID.size() / (double) count;
        toReturn.setStoragenum((int) Math.round(avgstoragenum));
        if(realtotalp <= 1200.0){
            if(cpuPart.getPrice()+gpuPart.getPrice()+memoryPart.getPrice() < totalp * 0.8){
                toReturn.setType("Office");
            } else if(avgstoragenum >= 3.0){
                toReturn.setType("Storage");
            } else{
                toReturn.setType("Eco");
            }
        } else{
            if(cpuPart.getPrice() / totalp >= 540/2600){
                toReturn.setType("Normal");
            } else if (cpuPart.getPrice() / totalp < 3/25){
                toReturn.setType("ExtremelyDope");
            } else{
                toReturn.setType("VeryDope");
            }
        }
        return toReturn;





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
                stmt.setInt(i+1, CPUID.get(i));
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
                stmt.setInt(i+1, CPUID.get(i));
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



    public PartsAttribute sqlGPU(ArrayList<Integer> GPUID){

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        PartsAttribute toreturn = new PartsAttribute();
        if(GPUID.size() == 0){
            return null;
        }
        try
        {
            double price_count = 0.0;
            conn = JDBChelp.getConnection();
            String sql = "select price from GPU natural join Parts where partsID IN (";
            for(int i = 0; i < GPUID.size(); i++){
                if (i == GPUID.size() - 1){
                    sql = sql + "?);";
                } else{
                    sql = sql + "?,";
                }


            }
            stmt = conn.prepareStatement(sql);
            for(int i = 0; i < GPUID.size(); i++){
                stmt.setInt(i+1, GPUID.get(i));
            }
            rs = stmt.executeQuery();
            while(rs.next())
            {
                price_count += rs.getDouble("price");
            }
            toreturn.setPrice(price_count);
            //get brand

            sql = "select brand, COUNT(partsID) AS counter from GPU natural join Parts where partsID IN (";
            for(int i = 0; i < GPUID.size(); i++){
                if (i == GPUID.size() - 1){
                    sql = sql + "?) ";
                } else{
                    sql = sql + "?,";
                }


            }
            sql = sql + "GROUP BY brand;";
            stmt = conn.prepareStatement(sql);
            for(int i = 0; i < GPUID.size(); i++){
                stmt.setInt(i+1, GPUID.get(i));
            }
            rs = stmt.executeQuery();
            while(rs.next())
            {
                if(rs.getInt("counter") >= 3){
                    toreturn.setBrand(rs.getString("brand"));
                    break;
                }
            }

            //get RGB
            sql = "select RGB, COUNT(partsID) AS counter from GPU natural join Parts where partsID IN (";
            for(int i = 0; i < GPUID.size(); i++){
                if (i == GPUID.size() - 1){
                    sql = sql + "?) ";
                } else{
                    sql = sql + "?,";
                }


            }
            sql = sql + "GROUP BY RGB;";
            stmt = conn.prepareStatement(sql);
            for(int i = 0; i < GPUID.size(); i++){
                stmt.setInt(i+1, GPUID.get(i));
            }
            rs = stmt.executeQuery();
            while(rs.next())
            {
                if(rs.getInt("counter") >= 3 && (double) rs.getInt("counter")/ (double) GPUID.size() >= 0.6){
                    if(rs.getString("RGB").equals("Yes")){
                        toreturn.setRGB(1);
                    }else{
                        toreturn.setRGB(0);
                    }
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


    public PartsAttribute sqlComputerCase(ArrayList<Integer> ComputerCaseID){

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        PartsAttribute toreturn = new PartsAttribute();
        if(ComputerCaseID.size() == 0){
            return null;
        }
        try
        {
            double price_count = 0.0;
            conn = JDBChelp.getConnection();
            String sql = "select price from ComputerCase natural join Parts where partsID IN (";
            for(int i = 0; i < ComputerCaseID.size(); i++){
                if (i == ComputerCaseID.size() - 1){
                    sql = sql + "?);";
                } else{
                    sql = sql + "?,";
                }


            }
            stmt = conn.prepareStatement(sql);
            for(int i = 0; i < ComputerCaseID.size(); i++){
                stmt.setInt(i+1, ComputerCaseID.get(i));
            }
            rs = stmt.executeQuery();
            while(rs.next())
            {
                price_count += rs.getDouble("price");
            }
            toreturn.setPrice(price_count);
            //get brand

            sql = "select brand, COUNT(partsID) AS counter from ComputerCase natural join Parts where partsID IN (";
            for(int i = 0; i < ComputerCaseID.size(); i++){
                if (i == ComputerCaseID.size() - 1){
                    sql = sql + "?) ";
                } else{
                    sql = sql + "?,";
                }


            }
            sql = sql + "GROUP BY brand;";
            stmt = conn.prepareStatement(sql);
            for(int i = 0; i < ComputerCaseID.size(); i++){
                stmt.setInt(i+1, ComputerCaseID.get(i+1));
            }
            rs = stmt.executeQuery();
            while(rs.next())
            {
                if(rs.getInt("counter") >= 3){
                    toreturn.setBrand(rs.getString("brand"));
                    break;
                }
            }

            //get RGB
            sql = "select RGB, COUNT(partsID) AS counter from ComputerCase natural join Parts where partsID IN (";
            for(int i = 0; i < ComputerCaseID.size(); i++){
                if (i == ComputerCaseID.size() - 1){
                    sql = sql + "?) ";
                } else{
                    sql = sql + "?,";
                }


            }
            sql = sql + "GROUP BY RGB;";
            stmt = conn.prepareStatement(sql);
            for(int i = 0; i < ComputerCaseID.size(); i++){
                stmt.setInt(i+1, ComputerCaseID.get(i));
            }
            rs = stmt.executeQuery();
            while(rs.next())
            {
                if(rs.getInt("counter") >= 3){
                    if(rs.getString("RGB").equals("Yes")){
                        toreturn.setRGB(1);
                    }else{
                        toreturn.setRGB(0);
                    }
                    break;
                }
            }

            //noiseproof
            sql = "select noise_proof, COUNT(partsID) AS counter from ComputerCase natural join Parts where partsID IN (";
            for(int i = 0; i < ComputerCaseID.size(); i++){
                if (i == ComputerCaseID.size() - 1){
                    sql = sql + "?) ";
                } else{
                    sql = sql + "?,";
                }


            }
            sql = sql + "GROUP BY noise_proof;";
            stmt = conn.prepareStatement(sql);
            for(int i = 0; i < ComputerCaseID.size(); i++){
                stmt.setInt(i+1, ComputerCaseID.get(i));
            }
            rs = stmt.executeQuery();
            while(rs.next())
            {
                if(rs.getInt("counter") >= 3){
                    if(rs.getString("noise_proof").equals("Yes")){
                        toreturn.setRGB(1);
                    }else{
                        toreturn.setRGB(0);
                    }
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


    public PartsAttribute sqlCooler(ArrayList<Integer> CoolingSystemID){

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        PartsAttribute toreturn = new PartsAttribute();
        if(CoolingSystemID.size() == 0){
            return null;
        }
        try
        {
            double price_count = 0.0;
            conn = JDBChelp.getConnection();
            String sql = "select price from CoolingSystem natural join Parts where partsID IN (";
            for(int i = 0; i < CoolingSystemID.size(); i++){
                if (i == CoolingSystemID.size() - 1){
                    sql = sql + "?);";
                } else{
                    sql = sql + "?,";
                }


            }
            stmt = conn.prepareStatement(sql);
            for(int i = 0; i < CoolingSystemID.size(); i++){
                stmt.setInt(i+1, CoolingSystemID.get(i));
            }
            rs = stmt.executeQuery();
            while(rs.next())
            {
                price_count += rs.getDouble("price");
            }
            toreturn.setPrice(price_count);
            //get brand

            sql = "select brand, COUNT(partsID) AS counter from CoolingSystem natural join Parts where partsID IN (";
            for(int i = 0; i < CoolingSystemID.size(); i++){
                if (i == CoolingSystemID.size() - 1){
                    sql = sql + "?) ";
                } else{
                    sql = sql + "?,";
                }


            }
            sql = sql + "GROUP BY brand;";
            stmt = conn.prepareStatement(sql);
            for(int i = 0; i < CoolingSystemID.size(); i++){
                stmt.setInt(i+1, CoolingSystemID.get(i));
            }
            rs = stmt.executeQuery();
            while(rs.next())
            {
                if(rs.getInt("counter") >= 3){
                    toreturn.setBrand(rs.getString("brand"));
                    break;
                }
            }

            //get RGB
            sql = "select RGB, COUNT(partsID) AS counter from CoolingSystem natural join Parts where partsID IN (";
            for(int i = 0; i < CoolingSystemID.size(); i++){
                if (i == CoolingSystemID.size() - 1){
                    sql = sql + "?) ";
                } else{
                    sql = sql + "?,";
                }


            }
            sql = sql + "GROUP BY RGB;";
            stmt = conn.prepareStatement(sql);
            for(int i = 0; i < CoolingSystemID.size(); i++){
                stmt.setInt(i+1, CoolingSystemID.get(i));
            }
            rs = stmt.executeQuery();
            while(rs.next())
            {
                if(rs.getInt("counter") >= 3){
                    if(rs.getString("RGB").equals("Yes")){
                        toreturn.setRGB(1);
                    }else{
                        toreturn.setRGB(0);
                    }
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

    public PartsAttribute sqlMemory(ArrayList<Integer> MemoryID){

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        PartsAttribute toreturn = new PartsAttribute();
        if(MemoryID.size() == 0){
            return null;
        }
        try
        {
            double price_count = 0.0;
            conn = JDBChelp.getConnection();
            String sql = "select price from Memory natural join Parts where partsID IN (";
            for(int i = 0; i < MemoryID.size(); i++){
                if (i == MemoryID.size() - 1){
                    sql = sql + "?);";
                } else{
                    sql = sql + "?,";
                }


            }
            stmt = conn.prepareStatement(sql);
            for(int i = 0; i < MemoryID.size(); i++){
                stmt.setInt(i+1, MemoryID.get(i));
            }
            rs = stmt.executeQuery();
            while(rs.next())
            {
                price_count += rs.getDouble("price");
            }
            toreturn.setPrice(price_count);
            //get brand

            sql = "select brand, COUNT(partsID) AS counter from Memory natural join Parts where partsID IN (";
            for(int i = 0; i < MemoryID.size(); i++){
                if (i == MemoryID.size() - 1){
                    sql = sql + "?) ";
                } else{
                    sql = sql + "?,";
                }


            }
            sql = sql + "GROUP BY brand;";
            stmt = conn.prepareStatement(sql);
            for(int i = 0; i < MemoryID.size(); i++){
                stmt.setInt(i+1, MemoryID.get(i));
            }
            rs = stmt.executeQuery();
            while(rs.next())
            {
                if(rs.getInt("counter") >= 3 && (double) rs.getInt("counter") / (double) MemoryID.size() >= 0.6){
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


    public PartsAttribute sqlMotherboard(ArrayList<Integer> MotherboardID){

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        PartsAttribute toreturn = new PartsAttribute();
        if(MotherboardID.size() == 0){
            return null;
        }
        try
        {
            double price_count = 0.0;
            conn = JDBChelp.getConnection();
            String sql = "select price from Motherboard natural join Parts where partsID IN (";
            for(int i = 0; i < MotherboardID.size(); i++){
                if (i == MotherboardID.size() - 1){
                    sql = sql + "?);";
                } else{
                    sql = sql + "?,";
                }


            }
            stmt = conn.prepareStatement(sql);
            for(int i = 0; i < MotherboardID.size(); i++){
                stmt.setInt(i+1, MotherboardID.get(i));
            }
            rs = stmt.executeQuery();
            while(rs.next())
            {
                price_count += rs.getDouble("price");
            }
            toreturn.setPrice(price_count);
            //get brand

            sql = "select brand, COUNT(partsID) AS counter from Motherboard natural join Parts where partsID IN (";
            for(int i = 0; i < MotherboardID.size(); i++){
                if (i == MotherboardID.size() - 1){
                    sql = sql + "?) ";
                } else{
                    sql = sql + "?,";
                }


            }
            sql = sql + "GROUP BY brand;";
            stmt = conn.prepareStatement(sql);
            for(int i = 0; i < MotherboardID.size(); i++){
                stmt.setInt(i+1, MotherboardID.get(i));
            }
            rs = stmt.executeQuery();
            while(rs.next())
            {
                if(rs.getInt("counter") >= 3){
                    toreturn.setBrand(rs.getString("brand"));
                    break;
                }
            }

            //get RGB
            sql = "select RGB, COUNT(partsID) AS counter from Motherboard natural join Parts where partsID IN (";
            for(int i = 0; i < MotherboardID.size(); i++){
                if (i == MotherboardID.size() - 1){
                    sql = sql + "?) ";
                } else{
                    sql = sql + "?,";
                }


            }
            sql = sql + "GROUP BY RGB;";
            stmt = conn.prepareStatement(sql);
            for(int i = 0; i < MotherboardID.size(); i++){
                stmt.setInt(i+1, MotherboardID.get(i));
            }
            rs = stmt.executeQuery();
            while(rs.next())
            {
                if(rs.getInt("counter") >= 3){
                    if(rs.getString("RGB").equals("Yes")){
                        toreturn.setRGB(1);
                    }else{
                        toreturn.setRGB(0);
                    }
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



    public PartsAttribute sqlPowersupply(ArrayList<Integer> PowersupplyID){

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        PartsAttribute toreturn = new PartsAttribute();
        if(PowersupplyID.size() == 0){
            return null;
        }
        try
        {
            double price_count = 0.0;
            conn = JDBChelp.getConnection();
            String sql = "select price from PowerSupply natural join Parts where partsID IN (";
            for(int i = 0; i < PowersupplyID.size(); i++){
                if (i == PowersupplyID.size() - 1){
                    sql = sql + "?);";
                } else{
                    sql = sql + "?,";
                }


            }
            stmt = conn.prepareStatement(sql);
            for(int i = 0; i < PowersupplyID.size(); i++){
                stmt.setInt(i+1, PowersupplyID.get(i));
            }
            rs = stmt.executeQuery();
            while(rs.next())
            {
                price_count += rs.getDouble("price");
            }
            toreturn.setPrice(price_count);
            //get brand

            sql = "select brand, COUNT(partsID) AS counter from PowerSupply natural join Parts where partsID IN (";
            for(int i = 0; i < PowersupplyID.size(); i++){
                if (i == PowersupplyID.size() - 1){
                    sql = sql + "?) ";
                } else{
                    sql = sql + "?,";
                }


            }
            sql = sql + "GROUP BY brand;";
            stmt = conn.prepareStatement(sql);
            for(int i = 0; i < PowersupplyID.size(); i++){
                stmt.setInt(i+1, PowersupplyID.get(i));
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


    public PartsAttribute sqlStorage(ArrayList<Integer> StorageID){

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        PartsAttribute toreturn = new PartsAttribute();
        if(StorageID.size() == 0){
            return null;
        }
        try
        {
            double price_count = 0.0;
            conn = JDBChelp.getConnection();
            String sql = "select price from Storage natural join Parts where partsID IN (";
            for(int i = 0; i < StorageID.size(); i++){
                if (i == StorageID.size() - 1){
                    sql = sql + "?);";
                } else{
                    sql = sql + "?,";
                }


            }
            stmt = conn.prepareStatement(sql);
            for(int i = 0; i < StorageID.size(); i++){
                stmt.setInt(i+1, StorageID.get(i));
            }
            rs = stmt.executeQuery();
            while(rs.next())
            {
                price_count += rs.getDouble("price");
            }
            toreturn.setPrice(price_count);
            //get brand

            sql = "select brand, COUNT(partsID) AS counter from Storage natural join Parts where partsID IN (";
            for(int i = 0; i < StorageID.size(); i++){
                if (i == StorageID.size() - 1){
                    sql = sql + "?) ";
                } else{
                    sql = sql + "?,";
                }


            }
            sql = sql + "GROUP BY brand;";
            stmt = conn.prepareStatement(sql);
            for(int i = 0; i < StorageID.size(); i++){
                stmt.setInt(i+1, StorageID.get(i));
            }
            rs = stmt.executeQuery();
            while(rs.next())
            {
                if(rs.getInt("counter") >= 3 && (double) rs.getInt("counter")/ (double) StorageID.size() >= 0.5 ){
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
