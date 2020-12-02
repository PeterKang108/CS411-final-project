<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.*" %>
<%@ page import="entity.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" autoFlush="false" buffer="300kb"%>
<%--
  Created by IntelliJ IDEA.
  User: Peter
  Date: 2020/12/2
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Specifications</title>
    <link rel="stylesheet" href="assets/css/usershowall.css" />

    <%--    <!-- Start datatable css -->--%>
    <%--    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">--%>
    <link rel="stylesheet" type="text/css" href="assets/css/datatable.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
    <%--    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">--%>
    <%--    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">--%>
    <%--    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">--%>
    <%--    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">--%>
    <script src="dbmanagePage/assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>

<%
    int iCPU = Integer.parseInt(request.getParameter("iCPU"));
    int iGPU = Integer.parseInt(request.getParameter("iGPU"));
    int iGPU2 = Integer.parseInt(request.getParameter("iGPU2"));
    int iMB = Integer.parseInt(request.getParameter("iMB"));
    int iCooler = Integer.parseInt(request.getParameter("iCooler"));
    int iMemory = Integer.parseInt(request.getParameter("iMemory"));
    int iMemory2 = Integer.parseInt(request.getParameter("iMemory2"));
    int iStorage = Integer.parseInt(request.getParameter("iStorage"));
    int iStorage2 = Integer.parseInt(request.getParameter("iStorage2"));
    int iStorage3 = Integer.parseInt(request.getParameter("iStorage3"));
    int iStorage4 = Integer.parseInt(request.getParameter("iStorage4"));
    int iStorage5 = Integer.parseInt(request.getParameter("iStorage5"));
    int iStorage6 = Integer.parseInt(request.getParameter("iStorage6"));
    int iCase = Integer.parseInt(request.getParameter("iCase"));
    int iPS = Integer.parseInt(request.getParameter("iPS"));
%>

<form name="link_form" method="post" action="userhistory.jsp">
    <input type="submit" value="Return to History">
</form>
<form name="link_form" method="post" action="userShowPCexamples.jsp">
    <input type="submit" value="See more examples">
</form>

<div id = "CPU1" style="text-align:center;">
    <br>
    <table id="CPU" class="text-center" >
        <thead class="text-uppercase">
        <tr>
            <th scope="col">partsName</th>
            <th scope="col">ratings</th>
            <th scope="col">price</th>
            <th scope="col">brand</th>
            <th scope="col">type</th>
            <th scope="col">Power Consumption</th>
            <th scope="col">Compatible Socket</th>
            <th scope="col">Integrated Graphics</th>
        </tr>
        </thead>
        <tbody>
        <%
            CPUDAO daoCPU = new  CPUDAO();
            CPU cpu = daoCPU.getSpecialCPU(iCPU);
        %>
        <tr>
            <td data-label="partsName" align="center"><%=cpu.getPartsName()%>
            </td>
            <td data-label="ratings" align="center"><%=cpu.getRatings()%>
            </td>
            <td data-label="price" align="center"><%=cpu.getPrice()%>
            </td>
            <td data-label="brand" align="center"><%=cpu.getBrand()%>
            </td>
            <td data-label="type"><%=cpu.getType()%></td>
            <td data-label="Power Consumption" align="center"><%=cpu.getPower_consumption()%>W
            </td>
            <td data-label="Compatible Socket" align="center"><%=cpu.getCompatible_socket()%>
            </td>
            <td data-label="Integrated Graphics" align="center"><%=cpu.getIntegrated_graphics()%>
            </td>
        </tr>
        </tbody>
    </table>
</div>

<br>

<div id = "Motherboard1" >
    <br>
    <table id = "Motherboard" width="100%" style="text-align:center">
        <thead>
        <tr>
            <th scope="col">partsName</th>
            <th scope="col">ratings</th>
            <th scope="col">price</th>
            <th scope="col">brand</th>
            <th scope="col">type</th>
            <th scope="col">Compatible Socket</th>
            <th scope="col">PCIe Version</th>
            <th scope="col">Number of PCIe X1 port</th>
            <th scope="col">USB 3.0 Support?</th>
            <th scope="col">Number of M.2 port</th>
            <th scope="col">size</th>
        </tr>
        </thead>

        <tbody>
        <%
            MotherboardDAO daoMB = new MotherboardDAO();
            Motherboard M = daoMB.getSpecialMotherboard(iMB);
        %>
        <tr>
            <td data-label="partsName"><%=M.getPartsName()%></td>
            <td data-label="ratings"><%=M.getRatings()%></td>
            <td data-label="price"><%=M.getPrice()%></td>
            <td data-label="brand"><%=M.getBrand()%></td>
            <td data-label="type"><%=M.getType()%></td>
            <td data-label="Compatible Socket"><%=M.getCompatible_socket()%></td>
            <td data-label="PCIe_version"><%=M.getPCIe_version()%></td>
            <td data-label="number_of_PCIe_X1"><%=M.getNumber_of_PCIe_X1()%></td>
            <td data-label="Number of m.2"><%=M.getNumber_of_m2()%></td>
            <td data-label="USB3.0 supported?"><%=M.getUSB3_supported()%></td>
            <td data-label="Motherboard Type"><%=M.getMotherboard_type()%></td>
        </tr>
        </tbody>
    </table>
</div>

<br>

<div id = "CoolingSystem1">
    <br>
    <table id = "CoolingSystem" width="100%" style="text-align:center">
        <thead>
        <tr>
            <th scope="col">partsName</th>
            <th scope="col">ratings</th>
            <th scope="col">price</th>
            <th scope="col">brand</th>
            <th scope="col">type</th>
            <th scope="col">Cooler Type</th>
            <th scope="col">Radiator Size</th>
            <th scope="col">RGB</th>
            <th scope="col">Compatible Socket</th>
        </tr>
        </thead>

        <tbody>
        <%
            CoolingSystemDAO daoCooler = new CoolingSystemDAO();
            CoolingSystem Cooler = daoCooler.getSpecialCoolingSystem(iCooler);
        %>
        <tr>
            <td data-label="partsName"><%=Cooler.getPartsName()%></td>
            <td data-label="ratings"><%=Cooler.getRatings()%></td>
            <td data-label="price"><%=Cooler.getPrice()%></td>
            <td data-label="brand"><%=Cooler.getBrand()%></td>
            <td data-label="type"><%=Cooler.getType()%></td>
            <td data-label="cooler type"><%=Cooler.getCooler_type()%></td>
            <td data-label="Radiator Size"><%=Cooler.getRadiator_size()%></td>
            <td data-label="RGB"><%=Cooler.getRGB()%></td>
            <td data-label="Compatible Socket"><%=Cooler.getCompatible_socket()%></td>
        </tr>
        </tbody>
    </table>
</div>

<br>

<div id = "Memory1">
    <br>
    <table id = "Memory" width="100%" style="text-align:center">
        <thead>
        <tr>
            <th scope="col">partsName</th>
            <th scope="col">ratings</th>
            <th scope="col">price</th>
            <th scope="col">brand</th>
            <th scope="col">type</th>
            <th scope="col">modules</th>
            <th scope="col">RAM_type</th>
        </tr>
        </thead>

        <tbody>
        <%
            MemoryDAO daoMemory = new MemoryDAO();
            Memory Memory = daoMemory.getSpecialMemory(iMemory);
        %>
        <tr>
            <td data-label="partsName"><%=Memory.getPartsName()%></td>
            <td data-label="ratings"><%=Memory.getRatings()%></td>
            <td data-label="price"><%=Memory.getPrice()%></td>
            <td data-label="brand"><%=Memory.getBrand()%></td>
            <td data-label="type"><%=Memory.getType()%></td>
            <td data-label="Modules"><%=Memory.getModules()%></td>
            <td data-label="RAM_type"><%=Memory.getRAM_type()%></td>
        </tr>
        <%
            if (iMemory2 != -1) {
                Memory Memory2 = daoMemory.getSpecialMemory(iMemory2);
        %>
        <tr>
            <td data-label="partsName"><%=Memory2.getPartsName()%></td>
            <td data-label="ratings"><%=Memory2.getRatings()%></td>
            <td data-label="price"><%=Memory2.getPrice()%></td>
            <td data-label="brand"><%=Memory2.getBrand()%></td>
            <td data-label="type"><%=Memory2.getType()%></td>
            <td data-label="Modules"><%=Memory2.getModules()%></td>
            <td data-label="RAM_type"><%=Memory2.getRAM_type()%></td>
        </tr>
        <%}%>
        </tbody>
    </table>
</div>

<br>


<div id = "Storage1">
    <br>
    <table id = "Storage" width="100%" style="text-align:center">
        <thead>
        <tr>
            <th scope="col">partsName</th>
            <th scope="col">ratings</th>
            <th scope="col">price</th>
            <th scope="col">brand</th>
            <th scope="col">type</th>
            <th scope="col">storage_type</th>
            <th scope="col">capacity</th>
            <th scope="col">interface</th>
        </tr>
        </thead>

        <tbody>
        <%
            StorageDAO daoStorage = new StorageDAO();
            Storage Storage = daoStorage.getSpecialStorage(iStorage);
        %>
        <tr>
            <td data-label="partsName"><%=Storage.getPartsName()%></td>
            <td data-label="ratings"><%=Storage.getRatings()%></td>
            <td data-label="price"><%=Storage.getPrice()%></td>
            <td data-label="brand"><%=Storage.getBrand()%></td>
            <td data-label="type"><%=Storage.getType()%></td>
            <td data-label="storage_type"><%=Storage.getStorage_type()%></td>
            <td data-label="capacity"><%=Storage.getCapacity()%></td>
            <td data-label="interface"><%=Storage.getInterface()%></td>
        </tr>
        <%
            if (iStorage2 != -1) {
                Storage Storage2 = daoStorage.getSpecialStorage(iStorage2);
        %>
        <tr>
            <td data-label="partsName"><%=Storage2.getPartsName()%></td>
            <td data-label="ratings"><%=Storage2.getRatings()%></td>
            <td data-label="price"><%=Storage2.getPrice()%></td>
            <td data-label="brand"><%=Storage2.getBrand()%></td>
            <td data-label="type"><%=Storage2.getType()%></td>
            <td data-label="storage_type"><%=Storage2.getStorage_type()%></td>
            <td data-label="capacity"><%=Storage2.getCapacity()%></td>
            <td data-label="interface"><%=Storage2.getInterface()%></td>
        </tr>
        <%
            }
            if (iStorage3 != -1) {
                Storage Storage3 = daoStorage.getSpecialStorage(iStorage3);
        %>
        <tr>
            <td data-label="partsName"><%=Storage3.getPartsName()%></td>
            <td data-label="ratings"><%=Storage3.getRatings()%></td>
            <td data-label="price"><%=Storage3.getPrice()%></td>
            <td data-label="brand"><%=Storage3.getBrand()%></td>
            <td data-label="type"><%=Storage3.getType()%></td>
            <td data-label="storage_type"><%=Storage3.getStorage_type()%></td>
            <td data-label="capacity"><%=Storage3.getCapacity()%></td>
            <td data-label="interface"><%=Storage3.getInterface()%></td>
        </tr>
        <%
            }
            if (iStorage4 != -1) {
                Storage Storage4 = daoStorage.getSpecialStorage(iStorage4);
        %>
        <tr>
            <td data-label="partsName"><%=Storage4.getPartsName()%></td>
            <td data-label="ratings"><%=Storage4.getRatings()%></td>
            <td data-label="price"><%=Storage4.getPrice()%></td>
            <td data-label="brand"><%=Storage4.getBrand()%></td>
            <td data-label="type"><%=Storage4.getType()%></td>
            <td data-label="storage_type"><%=Storage4.getStorage_type()%></td>
            <td data-label="capacity"><%=Storage4.getCapacity()%></td>
            <td data-label="interface"><%=Storage4.getInterface()%></td>
        </tr>
        <%
            }
            if (iStorage5 != -1) {
                Storage Storage5 = daoStorage.getSpecialStorage(iStorage5);
        %>
        <tr>
            <td data-label="partsName"><%=Storage5.getPartsName()%></td>
            <td data-label="ratings"><%=Storage5.getRatings()%></td>
            <td data-label="price"><%=Storage5.getPrice()%></td>
            <td data-label="brand"><%=Storage5.getBrand()%></td>
            <td data-label="type"><%=Storage5.getType()%></td>
            <td data-label="storage_type"><%=Storage5.getStorage_type()%></td>
            <td data-label="capacity"><%=Storage5.getCapacity()%></td>
            <td data-label="interface"><%=Storage5.getInterface()%></td>
        </tr>
        <%
            }
            if (iStorage6 != -1) {
                Storage Storage6 = daoStorage.getSpecialStorage(iStorage6);
        %>
        <tr>
            <td data-label="partsName"><%=Storage6.getPartsName()%></td>
            <td data-label="ratings"><%=Storage6.getRatings()%></td>
            <td data-label="price"><%=Storage6.getPrice()%></td>
            <td data-label="brand"><%=Storage6.getBrand()%></td>
            <td data-label="type"><%=Storage6.getType()%></td>
            <td data-label="storage_type"><%=Storage6.getStorage_type()%></td>
            <td data-label="capacity"><%=Storage6.getCapacity()%></td>
            <td data-label="interface"><%=Storage6.getInterface()%></td>
        </tr>
        <%}%>
        </tbody>
    </table>
</div>

<br>

<div id = "ComputerCase1" >
    <br>
    <table id = "ComputerCase" width="100%" style="text-align:center">
        <thead>
        <tr>
            <th scope="col">partsName</th>
            <th scope="col">ratings</th>
            <th scope="col">price</th>
            <th scope="col">brand</th>
            <th scope="col">type</th>
            <th scope="col">Case Type</th>
            <th scope="col">Case Cooler</th>
            <th scope="col">RGB</th>
            <th scope="col">Side Panel</th>
        </tr>
        </thead>

        <tbody>
        <%
            ComputerCaseDAO daoCase = new ComputerCaseDAO();
            ComputerCase Case = daoCase.getSpecialComputerCase(iCase);
        %>
        <tr>
            <td data-label="partsName"><%=Case.getPartsName()%></td>
            <td data-label="ratings"><%=Case.getRatings()%></td>
            <td data-label="price"><%=Case.getPrice()%></td>
            <td data-label="brand"><%=Case.getBrand()%></td>
            <td data-label="type"><%=Case.getType()%></td>
            <td data-label="case_type"><%=Case.getCase_type()%></td>
            <td data-label="case_cooler"><%=Case.getNumber_of_case_fan()%></td>
            <td data-label="RGB"><%=Case.getRGB()%></td>
            <td data-label="side_panel"><%=Case.getSide_panel()%></td>
        </tr>
        </tbody>
    </table>
</div>

<br>


<div id = "GPU1" >
    <br>
    <table id = "GPU" width="100%" style="text-align:center">
        <thead>
        <tr>
            <th scope="col">partsName</th>
            <th scope="col">ratings</th>
            <th scope="col">price</th>
            <th scope="col">brand</th>
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
            GPUDAO daoGPU = new GPUDAO();
            if (iGPU != -1) {
                GPU GPU = daoGPU.getSpecialGPU(iGPU);
        %>
        <tr>
            <td data-label="partsName"><%=GPU.getPartsName()%></td>
            <td data-label="ratings"><%=GPU.getRatings()%></td>
            <td data-label="price"><%=GPU.getPrice()%></td>
            <td data-label="brand"><%=GPU.getBrand()%></td>
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
            if (iGPU2 != -1) {
                GPU GPU2 = daoGPU.getSpecialGPU(iGPU2);
        %>
        <tr>
            <td data-label="partsName"><%=GPU2.getPartsName()%></td>
            <td data-label="ratings"><%=GPU2.getRatings()%></td>
            <td data-label="price"><%=GPU2.getPrice()%></td>
            <td data-label="brand"><%=GPU2.getBrand()%></td>
            <td data-label="type"><%=GPU2.getType()%></td>
            <td data-label="GPU_type"><%=GPU2.getGPU_type()%></td>
            <td data-label="chipset"><%=GPU2.getChipset()%></td>
            <td data-label="GPU_memory"><%=GPU2.getGPU_memory()%></td>
            <td data-label="PowerConsumption"><%=GPU2.getPower_consumption()%></td>
            <td data-label="interface_type"><%=GPU2.getInterface_type()%></td>
            <td data-label="RGB"><%=GPU2.getRGB()%></td>
        </tr>
        <%}%>
        </tbody>
    </table>
</div>

<br>

<div id = "PowerSupply1" >
    <br>
    <table id = "PowerSupply" width="100%" style="text-align:center">
        <thead>
        <tr>
            <th scope="col">partsName</th>
            <th scope="col">ratings</th>
            <th scope="col">price</th>
            <th scope="col">brand</th>
            <th scope="col">type</th>
            <th scope="col">Wattage</th>
        </tr>
        </thead>

        <tbody>
        <%
            PowerSupplyDAO daoPS= new PowerSupplyDAO();
            PowerSupply PS = daoPS.getSpecialPowerSupply(iPS);
        %>
        <tr>
            <td data-label="partsName"><%=PS.getPartsName()%></td>
            <td data-label="ratings"><%=PS.getRatings()%></td>
            <td data-label="price"><%=PS.getPrice()%></td>
            <td data-label="brand"><%=PS.getBrand()%></td>
            <td data-label="type"><%=PS.getType()%></td>
            <td data-label="Wattage"><%=PS.getWattage()%></td>
        </tr>
        </tbody>
    </table>
</div>


<script src="dataTable/js/jquery-3.5.1.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
<script src="assets/js/usershowall.js"></script>
<script src="assets/js/userhistory.js"></script>

</body>
</html>
