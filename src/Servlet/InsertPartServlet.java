package Servlet;

import DAO.*;
import entity.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="InsertPartServlet")
public class InsertPartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("type").equals("cpu")){
            cpuInsert(request, response);
        }
        if(request.getParameter("type").equals("gpu")){
            gpuInsert(request, response);
        }
        if(request.getParameter("type").equals("motherboard")){
            motherboardInsert(request, response);
        }
        if(request.getParameter("type").equals("computercase")){
            computercaseInsert(request, response);
        }
        if(request.getParameter("type").equals("coolingsystem")){
            coolingsystemInsert(request, response);
        }
        if(request.getParameter("type").equals("memory")){
            memoryInsert(request, response);
        }
        if(request.getParameter("type").equals("powersupply")){
            powersupplyInsert(request, response);
        }
        if(request.getParameter("type").equals("storage")){
            storageInsert(request, response);
        }


    }

    private void cpuInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        CPUDAO cpudao = new CPUDAO();
        String idStr = request.getParameter("PartsID");
        int PartsID = Integer.parseInt(idStr);

        String ratingStr = request.getParameter("ratings");
        double ratings = Double.parseDouble(ratingStr);

        String priceStr = request.getParameter("price");
        double price = Double.parseDouble(priceStr);

        String brand = request.getParameter("brand");
        String partsName = request.getParameter("partsName");
        String type = request.getParameter("type");
        int power_consumption = Integer.parseInt(request.getParameter("power_consumption"));
        String compatible_socket = request.getParameter("compatible_socket");
        String integrated_graphics = request.getParameter("integrated_graphics");
        CPU part = new CPU();
        part.setPartsID(PartsID);
        part.setRatings(ratings);
        part.setPrice(price);
        part.setBrand(brand);
        part.setPartsName(partsName);
        part.setType(type);
        part.setPower_consumption(power_consumption);
        part.setCompatible_socket(compatible_socket);
        part.setIntegrated_graphics(integrated_graphics);
        cpudao.insertCPU(part);
        request.getRequestDispatcher("showallCPU.jsp").forward(request, response);

    }

    private void gpuInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        GPUDAO gpudao = new GPUDAO();
        String idStr = request.getParameter("PartsID");
        int PartsID = Integer.parseInt(idStr);

        String ratingStr = request.getParameter("ratings");
        double ratings = Double.parseDouble(ratingStr);

        String priceStr = request.getParameter("price");
        double price = Double.parseDouble(priceStr);

        String brand = request.getParameter("brand");
        String partsName = request.getParameter("partsName");
        String type = request.getParameter("type");
        int power_consumption = Integer.parseInt(request.getParameter("power_consumption"));
        String GPU_type = request.getParameter("GPU_type");
        String chipset = request.getParameter("chipset");
        int GPU_memory = Integer.parseInt(request.getParameter("GPU_memory"));
        String interface_type = request.getParameter("interface_type");
        String RGB = request.getParameter("RGB");
        GPU part = new GPU();
        part.setPartsID(PartsID);
        part.setRatings(ratings);
        part.setPrice(price);
        part.setBrand(brand);
        part.setPartsName(partsName);
        part.setType(type);
        part.setPower_consumption(power_consumption);
        part.setGPU_type(GPU_type);
        part.setChipset(chipset);
        part.setRGB(RGB);
        part.setInterface_type(interface_type);
        part.setGPU_memory(GPU_memory);
        gpudao.insertGPU(part);
        request.getRequestDispatcher("showallGPU.jsp").forward(request, response);

    }

    private void motherboardInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        MotherboardDAO motherboarddao = new MotherboardDAO();
        String idStr = request.getParameter("PartsID");
        int PartsID = Integer.parseInt(idStr);

        String ratingStr = request.getParameter("ratings");
        double ratings = Double.parseDouble(ratingStr);

        String priceStr = request.getParameter("price");
        double price = Double.parseDouble(priceStr);

        String brand = request.getParameter("brand");
        String partsName = request.getParameter("partsName");
        String type = request.getParameter("type");
        String RGB = request.getParameter("RGB");
        String compatible_socket = request.getParameter("compatible_socket");
        String PCIe_version = request.getParameter("PCIe_version");
        int number_of_PCIe_X1 = Integer.parseInt(request.getParameter("number_of_PCIe_X1"));
        String USB3supported = request.getParameter("USB3.0_supported");
        int number_of_m2 = Integer.parseInt(request.getParameter("number_of_m2"));
        String Motherboard_type = request.getParameter("Motherboard_type");
        Motherboard part = new Motherboard();
        part.setPartsID(PartsID);
        part.setRatings(ratings);
        part.setPrice(price);
        part.setBrand(brand);
        part.setPartsName(partsName);
        part.setType(type);
        part.setUSB3_supported(USB3supported);
        part.setNumber_of_m2(number_of_m2);
        part.setRGB(RGB);
        part.setMotherboard_type(Motherboard_type);
        part.setNumber_of_PCIe_X1(number_of_PCIe_X1);
        part.setCompatible_socket(compatible_socket);
        part.setPCIe_version(PCIe_version);
        motherboarddao.insertMotherboard(part);
        request.getRequestDispatcher("showallMotherboard.jsp").forward(request, response);

    }

    private void computercaseInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        ComputerCaseDAO computerCasedao = new ComputerCaseDAO();
        String idStr = request.getParameter("PartsID");
        int PartsID = Integer.parseInt(idStr);

        String ratingStr = request.getParameter("ratings");
        double ratings = Double.parseDouble(ratingStr);

        String priceStr = request.getParameter("price");
        double price = Double.parseDouble(priceStr);

        String brand = request.getParameter("brand");
        String partsName = request.getParameter("partsName");
        String type = request.getParameter("type");
        String RGB = request.getParameter("RGB");
        int number_of_case_fan = Integer.parseInt(request.getParameter("number_of_case_fan"));
        String side_panel = request.getParameter("side_panel");
        String Case_type = request.getParameter("Case_type");
        String noise_proof = request.getParameter("noise_proof");
        ComputerCase part = new ComputerCase();
        part.setPartsID(PartsID);
        part.setRatings(ratings);
        part.setPrice(price);
        part.setBrand(brand);
        part.setPartsName(partsName);
        part.setType(type);
        part.setSide_panel(side_panel);
        part.setRGB(RGB);
        part.setNumber_of_case_fan(number_of_case_fan);
        part.setNoise_proof(noise_proof);
        part.setCase_type(Case_type);
        computerCasedao.insertComputerCase(part);
        request.getRequestDispatcher("showallComputerCase.jsp").forward(request, response);

    }

    private void coolingsystemInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        CoolingSystemDAO coolingdao = new CoolingSystemDAO();
        String idStr = request.getParameter("PartsID");
        int PartsID = Integer.parseInt(idStr);

        String ratingStr = request.getParameter("ratings");
        double ratings = Double.parseDouble(ratingStr);

        String priceStr = request.getParameter("price");
        double price = Double.parseDouble(priceStr);

        String brand = request.getParameter("brand");
        String partsName = request.getParameter("partsName");
        String type = request.getParameter("type");
        String RGB = request.getParameter("RGB");
        int radiator_size = Integer.parseInt(request.getParameter("radiator_size"));
        String cooler_type = request.getParameter("cooler_type");
        CoolingSystem part = new CoolingSystem();
        part.setPartsID(PartsID);
        part.setRatings(ratings);
        part.setPrice(price);
        part.setBrand(brand);
        part.setPartsName(partsName);
        part.setType(type);
        part.setRadiator_size(radiator_size);
        part.setRGB(RGB);
        part.setCooler_type(cooler_type);

        coolingdao.insertCoolingSystem(part);
        request.getRequestDispatcher("showallCoolingSystem.jsp").forward(request, response);

    }


    private void memoryInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        MemoryDAO memorydao = new MemoryDAO();
        String idStr = request.getParameter("PartsID");
        int PartsID = Integer.parseInt(idStr);

        String ratingStr = request.getParameter("ratings");
        double ratings = Double.parseDouble(ratingStr);

        String priceStr = request.getParameter("price");
        double price = Double.parseDouble(priceStr);

        String brand = request.getParameter("brand");
        String partsName = request.getParameter("partsName");
        String type = request.getParameter("type");
        String modules = request.getParameter("modules");
        String RAM_type = request.getParameter("RAM_type");
        float price_per_gb = Float.parseFloat(request.getParameter("price_per_gb"));
        Memory part = new Memory();
        part.setPartsID(PartsID);
        part.setRatings(ratings);
        part.setPrice(price);
        part.setBrand(brand);
        part.setPartsName(partsName);
        part.setType(type);
        part.setRAM_type(RAM_type);
        part.setModules(modules);
        part.setPrice_per_GB(price_per_gb);
        memorydao.insertMemory(part);
        request.getRequestDispatcher("showallMemory.jsp").forward(request, response);

    }

    private void powersupplyInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        PowerSupplyDAO powerdao = new PowerSupplyDAO();
        String idStr = request.getParameter("PartsID");
        int PartsID = Integer.parseInt(idStr);

        String ratingStr = request.getParameter("ratings");
        double ratings = Double.parseDouble(ratingStr);

        String priceStr = request.getParameter("price");
        double price = Double.parseDouble(priceStr);

        String brand = request.getParameter("brand");
        String partsName = request.getParameter("partsName");
        String type = request.getParameter("type");
        int Wattage = Integer.parseInt(request.getParameter("Wattage"));

        PowerSupply part = new PowerSupply();
        part.setPartsID(PartsID);
        part.setRatings(ratings);
        part.setPrice(price);
        part.setBrand(brand);
        part.setPartsName(partsName);
        part.setType(type);
        part.setWattage(Wattage);


        powerdao.insertPowerSupply(part);
        request.getRequestDispatcher("showallPowerSupply.jsp").forward(request, response);

    }

    private void storageInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        StorageDAO storagedao = new StorageDAO();
        String idStr = request.getParameter("PartsID");
        int PartsID = Integer.parseInt(idStr);

        String ratingStr = request.getParameter("ratings");
        double ratings = Double.parseDouble(ratingStr);

        String priceStr = request.getParameter("price");
        double price = Double.parseDouble(priceStr);

        String brand = request.getParameter("brand");
        String partsName = request.getParameter("partsName");
        String type = request.getParameter("type");
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        float price_per_gb = Float.parseFloat(request.getParameter("price_per_gb"));
        String interfaces = request.getParameter("interface");
        String storage_type = request.getParameter("storage_type");
        Storage part = new Storage();
        part.setPartsID(PartsID);
        part.setRatings(ratings);
        part.setPrice(price);
        part.setBrand(brand);
        part.setPartsName(partsName);
        part.setType(type);
        part.setStorage_type(storage_type);
        part.setInterface(interfaces);
        part.setCapacity(capacity);
        part.setPrice_per_GB(price_per_gb);
        storagedao.insertStorage(part);
        request.getRequestDispatcher("showallStorage.jsp").forward(request, response);

    }

}
