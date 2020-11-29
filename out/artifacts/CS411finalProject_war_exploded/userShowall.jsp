<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.*" %>
<%@ page import="entity.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" autoFlush="false" buffer="300kb"%>
<html>
<head>
    <title>BrowseParts</title>
</head>
<body>


<a>CPU Table</a>
<table id = "CPU" width="100%">
    <thead>
        <tr>
            <th scope="col">ratings</th>
            <th scope="col">price</th>
            <th scope="col">brand</th>
            <th scope="col">partsName</th>
            <th scope="col">Power Consumption</th>
            <th scope="col">Compatible Socket</th>
            <th scope="col">Integrated Graphics</th>
        </tr>
    </thead>

    <tbody>
        <%
            CPUDAO daoCPU = new  CPUDAO();
            ArrayList<CPU> CPUs = daoCPU.getAllCPU();
            for (CPU cpu : CPUs) {
        %>
        <tr>
            <td data-label="ratings"><%=cpu.getRatings()%>
            </td>
            <td data-label="price"><%=cpu.getPrice()%>
            </td>
            <td data-label="brand"><%=cpu.getBrand()%>
            </td>
            <td data-label="partsName"><%=cpu.getPartsName()%>
            </td>
            <td data-label="Power Consumption"><%=cpu.getPower_consumption()%>W
            </td>
            <td data-label="Compatible Socket"><%=cpu.getCompatible_socket()%>
            </td>
            <td data-label="Integrated Graphics"><%=cpu.getIntegrated_graphics()%>
            </td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>

<br>
<br>
<br>
<br>

<a>Motherboard Table</a>
<table id = "Motherboard" width="100%">
    <thead>
    <tr>
        <th scope="col">ratings</th>
        <th scope="col">price</th>
        <th scope="col">brand</th>
        <th scope="col">partsName</th>
        <th scope="col">Compatible Socket</th>
        <th scope="col">PCIe Version</th>
        <th scope="col">Number of PCIe X1 port</th>
        <th scope="col">Power Consumption</th>
        <th scope="col">USB 3.0 Support?</th>
        <th scope="col">Number of M.2 port</th>
        <th scope="col">size</th>
    </tr>
    </thead>

    <tbody>
    <%
        MotherboardDAO daoMB = new MotherboardDAO();
        ArrayList<Motherboard> Motherboards = daoMB.getAllMotherboard();
        for (Motherboard M : Motherboards) {
    %>
    <tr>
        <td data-label="ratings"><%=M.getRatings()%></td>
        <td data-label="price"><%=M.getPrice()%></td>
        <td data-label="brand"><%=M.getBrand()%></td>
        <td data-label="partsName"><%=M.getPartsName()%></td>
        <td data-label="Compatible Socket"><%=M.getCompatible_socket()%></td>
        <td data-label="PCIe_version"><%=M.getPCIe_version()%></td>
        <td data-label="number_of_PCIe_X1"><%=M.getNumber_of_PCIe_X1()%></td>
        <td data-label="power_consumption"><%=M.getPower_consumption()%></td>
        <td data-label="Number of m.2"><%=M.getNumber_of_m2()%></td>
        <td data-label="USB3.0 supported?"><%=M.getUSB3_supported()%></td>
        <td data-label="Motherboard Type"><%=M.getMotherboard_type()%></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

<br>
<br>
<br>
<br>

<a>Cooling System Table</a>
<table id = "Cooling System" width="100%">
    <thead>
    <tr>
        <th scope="col">ratings</th>
        <th scope="col">price</th>
        <th scope="col">brand</th>
        <th scope="col">partsName</th>
        <th scope="col">Cooler Type</th>
        <th scope="col">Radiator Size</th>
        <th scope="col">RGB</th>
        <th scope="col">Compatible Socket</th>
    </tr>
    </thead>

    <tbody>
    <%
        CoolingSystemDAO daoCoolingSystem = new CoolingSystemDAO();
        ArrayList<CoolingSystem> Coolers = daoCoolingSystem.getAllCoolingSystem();
        for (CoolingSystem Cooler : Coolers) {
    %>
    <tr>
        <td data-label="ratings"><%=Cooler.getRatings()%></td>
        <td data-label="price"><%=Cooler.getPrice()%></td>
        <td data-label="brand"><%=Cooler.getBrand()%></td>
        <td data-label="partsName"><%=Cooler.getPartsName()%></td>
        <td data-label="cooler type"><%=Cooler.getCooler_type()%></td>
        <td data-label="Radiator Size"><%=Cooler.getRadiator_size()%></td>
        <td data-label="RGB"><%=Cooler.getRGB()%></td>
        <td data-label="Compatible Socket"><%=Cooler.getCompatible_socket()%></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

<br>
<br>
<br>
<br>

<a>Memory Table</a>
<table id = "Memory" width="100%">
    <thead>
    <tr>
        <th scope="col">ratings</th>
        <th scope="col">price</th>
        <th scope="col">brand</th>
        <th scope="col">partsName</th>
        <th scope="col">type</th>
        <th scope="col">modules</th>
        <th scope="col">RAM_type</th>
    </tr>
    </thead>

    <tbody>
    <%
        MemoryDAO daoMemory = new MemoryDAO();
        ArrayList<Memory> Memories = daoMemory.getAllMemory();
        for (Memory Memory : Memories) {
    %>
    <tr>
        <td data-label="ratings"><%=Memory.getRatings()%></td>
        <td data-label="price"><%=Memory.getPrice()%></td>
        <td data-label="brand"><%=Memory.getBrand()%></td>
        <td data-label="partsName"><%=Memory.getPartsName()%></td>
        <td data-label="type"><%=Memory.getType()%></td>
        <td data-label="Modules"><%=Memory.getModules()%></td>
        <td data-label="RAM_type"><%=Memory.getRAM_type()%></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

<br>
<br>
<br>
<br>

<a>Storage Table</a>
<table id = "Storage" width="100%">
    <thead>
    <tr>
        <th scope="col">ratings</th>
        <th scope="col">price</th>
        <th scope="col">brand</th>
        <th scope="col">partsName</th>
        <th scope="col">type</th>
        <th scope="col">storage_type</th>
        <th scope="col">capacity</th>
        <th scope="col">interface</th>
    </tr>
    </thead>

    <tbody>
    <%
        StorageDAO daoStorage = new  StorageDAO();
        ArrayList<Storage> Storages = daoStorage.getAllStorage();
        for (Storage Storage : Storages) {
    %>
    <tr>
        <td data-label="ratings"><%=Storage.getRatings()%></td>
        <td data-label="price"><%=Storage.getPrice()%></td>
        <td data-label="brand"><%=Storage.getBrand()%></td>
        <td data-label="partsName"><%=Storage.getPartsName()%></td>
        <td data-label="type"><%=Storage.getType()%></td>
        <td data-label="storage_type"><%=Storage.getStorage_type()%></td>
        <td data-label="capacity"><%=Storage.getCapacity()%></td>
        <td data-label="interface"><%=Storage.getInterface()%></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

<br>
<br>
<br>
<br>

<a>Case Table</a>
<table id = "ComputerCase" width="100%">
    <thead>
    <tr>
        <th scope="col">ratings</th>
        <th scope="col">price</th>
        <th scope="col">brand</th>
        <th scope="col">partsName</th>
        <th scope="col">type</th>
        <th scope="col">Case Type</th>
        <th scope="col">Case Cooler</th>
        <th scope="col">RGB</th>
        <th scope="col">Side Panel</th>
    </tr>
    </thead>

    <tbody>
    <%
        ComputerCaseDAO daoCase = new  ComputerCaseDAO();
        ArrayList<ComputerCase> Cases = daoCase.getAllComputerCase();
        for (ComputerCase Case : Cases) {
    %>
    <tr>
        <td data-label="ratings"><%=Case.getRatings()%></td>
        <td data-label="price"><%=Case.getPrice()%></td>
        <td data-label="brand"><%=Case.getBrand()%></td>
        <td data-label="partsName"><%=Case.getPartsName()%></td>
        <td data-label="type"><%=Case.getType()%></td>
        <td data-label="case_type"><%=Case.getCase_type()%></td>
        <td data-label="case_cooler"><%=Case.getNumber_of_case_fan()%></td>
        <td data-label="RGB"><%=Case.getRGB()%></td>
        <td data-label="side_panel"><%=Case.getSide_panel()%></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

<br>
<br>
<br>
<br>

<a>GPU Table</a>
<table id = "GPU" width="100%">
    <thead>
    <tr>
        <th scope="col">ratings</th>
        <th scope="col">price</th>
        <th scope="col">brand</th>
        <th scope="col">partsName</th>
        <th scope="col">type</th>
        <th scope="col">Video Card Type</th>
        <th scope="col">Chipset</th>
        <th scope="col">GPU Memory</th>
        <th scope="col">Power Consumption</th>
        <th scope="col">Interface</th>
        <th scope="col">RGB</th>
    </tr>
    </thead>

    <tbody>
    <%
        GPUDAO daoGPU = new  GPUDAO();
        ArrayList<GPU> GPUs = daoGPU.getAllGPU();
        for (GPU GPU : GPUs) {
    %>
    <tr>
        <td data-label="ratings"><%=GPU.getRatings()%></td>
        <td data-label="price"><%=GPU.getPrice()%></td>
        <td data-label="brand"><%=GPU.getBrand()%></td>
        <td data-label="partsName"><%=GPU.getPartsName()%></td>
        <td data-label="type"><%=GPU.getType()%></td>
        <td data-label="GPU_type"><%=GPU.getGPU_type()%></td>
        <td data-label="chipset"><%=GPU.getChipset()%></td>
        <td data-label="GPU_memory"><%=GPU.getGPU_memory()%></td>
        <td data-label="PowerConsumption"><%=GPU.getPower_consumption()%></td>
        <td data-label="interface_type"><%=GPU.getInterface_type()%></td>
        <td data-label="RGB"><%=GPU.getRGB()%></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

<br>
<br>
<br>
<br>

<a>PowerSupply Table</a>
<table id = "PowerSupply" width="100%">
    <thead>
    <tr>
        <th scope="col">ratings</th>
        <th scope="col">price</th>
        <th scope="col">brand</th>
        <th scope="col">partsName</th>
        <th scope="col">type</th>
        <th scope="col">Wattage</th>
    </tr>
    </thead>

    <tbody>
    <%
        PowerSupplyDAO daoPowerSupply = new  PowerSupplyDAO();
        ArrayList<PowerSupply> PSs = daoPowerSupply.getAllPowerSupply();
        for (PowerSupply PS : PSs) {
    %>
    <tr>
        <td data-label="ratings"><%=PS.getRatings()%></td>
        <td data-label="price"><%=PS.getPrice()%></td>
        <td data-label="brand"><%=PS.getBrand()%></td>
        <td data-label="partsName"><%=PS.getPartsName()%></td>
        <td data-label="type"><%=PS.getType()%></td>
        <td data-label="Wattage"><%=PS.getWattage()%></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>


</body>
</html>
