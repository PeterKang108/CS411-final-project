<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.*" %>
<%@ page import="entity.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" autoFlush="false" buffer="300kb"%>
<html>
<head>
    <title>BrowseParts</title>
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

<br>

<%
    //CPU
    int addedCPU = -1;
    if (session.getAttribute("addCPU") != null) {
        addedCPU = Integer.parseInt((String)session.getAttribute("addCPU"));
        session.setAttribute("addCPU", null);
    }
    String addedCPUname = "";
    if (addedCPU > 100) {
        addedCPUname = (String) session.getAttribute("addCPUname");
        session.setAttribute("addCPUname", null);
    }


    //MB
    int addedMB = -1;
    if (session.getAttribute("addMB") != null) {
        addedMB = Integer.parseInt((String)session.getAttribute("addMB"));
        session.setAttribute("addMB", null);
    }
    String addedMBname = "";
    if (addedMB > 100) {
        addedMBname = (String) session.getAttribute("addMBname");
        session.setAttribute("addMBname", null);
    }
//    String addedMBsocket = "";
//    if (addedMB > 100) {
//        addedMBsocket = (String) session.getAttribute("addMBsocket");
//    }

    //Cooler
    int addedCooler = -1;
    if (session.getAttribute("addCooler") != null) {
        addedCooler = Integer.parseInt((String)session.getAttribute("addCooler"));
        session.setAttribute("addCooler", null);
    }
    String addedCoolername = "";
    if (addedCooler > 100) {
        addedCoolername = (String) session.getAttribute("addCoolername");
        session.setAttribute("addCoolername", null);
    }

    //Memory
    int addedMemory = -1;
    if (session.getAttribute("addMemory") != null) {
        addedMemory = Integer.parseInt((String)session.getAttribute("addMemory"));
        session.setAttribute("addMemory", null);
    }
    String addedMemoryname = "";
    if (addedMemory > 100) {
        addedMemoryname = (String) session.getAttribute("addMemoryname");
        session.setAttribute("addMemoryname", null);
    }

    //Memory2
    int addedMemory2 = -1;
    if (session.getAttribute("addMemory2") != null) {
        addedMemory2 = Integer.parseInt((String)session.getAttribute("addMemory2"));
        session.setAttribute("addMemory2", null);
    }
    String addedMemory2name = "";
    if (addedMemory2 > 100) {
        addedMemory2name = (String) session.getAttribute("addMemory2name");
        session.setAttribute("addMemory2name", null);
    }

    //Storage
    int addedStorage = -1;
    if (session.getAttribute("addStorage") != null) {
        addedStorage = Integer.parseInt((String)session.getAttribute("addStorage"));
        session.setAttribute("addStorage", null);
    }
    String addedStoragename = "";
    if (addedStorage > 100) {
        addedStoragename = (String) session.getAttribute("addStoragename");
        session.setAttribute("addStoragename", null);
    }

    //Storage2
    int addedStorage2 = -1;
    if (session.getAttribute("addStorage2") != null) {
        addedStorage2 = Integer.parseInt((String)session.getAttribute("addStorage2"));
        session.setAttribute("addStorage2", null);
    }
    String addedStorage2name = "";
    if (addedStorage2 > 100) {
        addedStorage2name = (String) session.getAttribute("addStorage2name");
        session.setAttribute("addStorage2name", null);
    }

    //Storage3
    int addedStorage3 = -1;
    if (session.getAttribute("addStorage3") != null) {
        addedStorage3 = Integer.parseInt((String)session.getAttribute("addStorage3"));
        session.setAttribute("addStorage3", null);
    }
    String addedStorage3name = "";
    if (addedStorage3 > 100) {
        addedStorage3name = (String) session.getAttribute("addStorage3name");
        session.setAttribute("addStorage3name", null);
    }

    //Storage4
    int addedStorage4 = -1;
    if (session.getAttribute("addStorage4") != null) {
        addedStorage4 = Integer.parseInt((String)session.getAttribute("addStorage4"));
        session.setAttribute("addStorage4", null);
    }
    String addedStorage4name = "";
    if (addedStorage4 > 100) {
        addedStorage4name = (String) session.getAttribute("addStorage4name");
        session.setAttribute("addStorage4name", null);
    }

    //Storage5
    int addedStorage5 = -1;
    if (session.getAttribute("addStorage5") != null) {
        addedStorage5 = Integer.parseInt((String)session.getAttribute("addStorage5"));
        session.setAttribute("addStorage5", null);
    }
    String addedStorage5name = "";
    if (addedStorage5 > 100) {
        addedStorage5name = (String) session.getAttribute("addStorage5name");
        session.setAttribute("addStorage5name", null);
    }

    //Storage6
    int addedStorage6 = -1;
    if (session.getAttribute("addStorage6") != null) {
        addedStorage6 = Integer.parseInt((String)session.getAttribute("addStorage6"));
        session.setAttribute("addStorage6", null);
    }
    String addedStorage6name = "";
    if (addedStorage6 > 100) {
        addedStorage6name = (String) session.getAttribute("addStorage6name");
        session.setAttribute("addStorage6name", null);
    }

    //Case
    int addedCase = -1;
    if (session.getAttribute("addCase") != null) {
        addedCase = Integer.parseInt((String)session.getAttribute("addCase"));
        session.setAttribute("addCase", null);
    }
    String addedCasename = "";
    if (addedCase > 100) {
        addedCasename = (String) session.getAttribute("addCasename");
        session.setAttribute("addCasename", null);
    }

    //GPU
    int addedGPU = -1;
    if (session.getAttribute("addGPU") != null) {
        addedGPU = Integer.parseInt((String)session.getAttribute("addGPU"));
        session.setAttribute("addGPU", null);
    }
    String addedGPUname = "";
    if (addedGPU > 100) {
        addedGPUname = (String) session.getAttribute("addGPUname");
        session.setAttribute("addGPUname", null);
    }

    //GPU2
    int addedGPU2 = -1;
    if (session.getAttribute("addGPU2") != null) {
        addedGPU2 = Integer.parseInt((String)session.getAttribute("addGPU2"));
        session.setAttribute("addGPU2", null);
    }
    String addedGPU2name = "";
    if (addedGPU2 > 100) {
        addedGPU2name = (String) session.getAttribute("addGPU2name");
        session.setAttribute("addGPU2name", null);
    }

    //Power Supply
    int addedPS = -1;
    if (session.getAttribute("addPS") != null) {
        addedPS = Integer.parseInt((String)session.getAttribute("addPS"));
        session.setAttribute("addPS", null);
    }
    String addedPSname = "";
    if (addedPS > 100) {
        addedPSname = (String) session.getAttribute("addPSname");
        session.setAttribute("addPSname", null);
    }
%>


<button onclick="openCPU()">CPU</button>
<div id = "CPU1" style="text-align:center; display:none">
    <br>
<table id="CPU" class="text-center" >
    <thead class="text-uppercase">
    <tr>
        <th scope="col">check</th>
        <th scope="col">partsName</th>
        <th scope="col">ratings</th>
        <th scope="col">price</th>
        <th scope="col">brand</th>
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
//            if (addedMBsocket != null) {
//                if (cpu.getCompatible_socket() != addedMBsocket) {
//                    continue;
//                }
//            }
    %>
    <tr>
        <td data-label="choice" align="center">
            <form method="POST" action="tempSave.jsp">
                <input type="hidden" name="addCPU" value="<%=cpu.getPartsID()%>"/>
                <input type="hidden" name="addCPUname" value="<%=cpu.getPartsName()%>"/>
                <input type="hidden" name="position" value="1"/>
                <input type="submit" value="Add" />
            </form>
        </td>
        <td data-label="partsName" align="center"><%=cpu.getPartsName()%>
        </td>
        <td data-label="ratings" align="center"><%=cpu.getRatings()%>
        </td>
        <td data-label="price" align="center"><%=cpu.getPrice()%>
        </td>
        <td data-label="brand" align="center"><%=cpu.getBrand()%>
        </td>
        <td data-label="Power Consumption" align="center"><%=cpu.getPower_consumption()%>W
        </td>
        <td data-label="Compatible Socket" align="center"><%=cpu.getCompatible_socket()%>
        </td>
        <td data-label="Integrated Graphics" align="center"><%=cpu.getIntegrated_graphics()%>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</div>

<br>

<button onclick="openMotherboard()">Motherboard</button>
<%--<a>Motherboard Table</a>--%>
<div id = "Motherboard1" style="display:none">
    <br>
<table id = "Motherboard" width="100%" style="text-align:center">
    <thead>
    <tr>
        <th scope="col">check</th>
        <th scope="col">partsName</th>
        <th scope="col">ratings</th>
        <th scope="col">price</th>
        <th scope="col">brand</th>
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
        ArrayList<Motherboard> Motherboards = daoMB.getAllMotherboard();
        for (Motherboard M : Motherboards) {
    %>
    <tr>
        <td data-label="choice">
            <form action="tempSave.jsp" method="POST">
                <input type="hidden" name="addMB" value="<%=M.getPartsID()%>"/>
                <input type="hidden" name="addMBname" value="<%=M.getPartsName()%>"/>
                <input type="hidden" name="position" value="4"/>
                <input type="submit" value="Add" />
            </form>
        </td>
        <td data-label="partsName"><%=M.getPartsName()%></td>
        <td data-label="ratings"><%=M.getRatings()%></td>
        <td data-label="price"><%=M.getPrice()%></td>
        <td data-label="brand"><%=M.getBrand()%></td>
        <td data-label="Compatible Socket"><%=M.getCompatible_socket()%></td>
        <td data-label="PCIe_version"><%=M.getPCIe_version()%></td>
        <td data-label="number_of_PCIe_X1"><%=M.getNumber_of_PCIe_X1()%></td>
        <td data-label="Number of m.2"><%=M.getNumber_of_m2()%></td>
        <td data-label="USB3.0 supported?"><%=M.getUSB3_supported()%></td>
        <td data-label="Motherboard Type"><%=M.getMotherboard_type()%></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</div>

<br>

<button onclick="openCoolers()">Cooling System</button>
<%--<a>Cooling System Table</a>--%>
<div id = "CoolingSystem1" style="display:none">
    <br>
<table id = "CoolingSystem" width="100%" style="text-align:center">
    <thead>
    <tr>
        <th scope="col">check</th>
        <th scope="col">partsName</th>
        <th scope="col">ratings</th>
        <th scope="col">price</th>
        <th scope="col">brand</th>
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
        <td data-label="choice">
            <form action="tempSave.jsp" method="POST">
                <input type="hidden" name="addCooler" value="<%=Cooler.getPartsID()%>"/>
                <input type="hidden" name="addCoolername" value="<%=Cooler.getPartsName()%>"/>
                <input type="hidden" name="position" value="14"/>
                <input type="submit" value="Add" />
            </form>
        </td>
        <td data-label="partsName"><%=Cooler.getPartsName()%></td>
        <td data-label="ratings"><%=Cooler.getRatings()%></td>
        <td data-label="price"><%=Cooler.getPrice()%></td>
        <td data-label="brand"><%=Cooler.getBrand()%></td>
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
</div>

<br>

<button onclick="openMemory()">Memory</button>
<div id = "Memory1" style="display:none">
    <br>
<table id = "Memory" width="100%" style="text-align:center">
    <thead>
    <tr>
        <th scope="col">check</th>
        <th scope="col">partsName</th>
        <th scope="col">ratings</th>
        <th scope="col">price</th>
        <th scope="col">brand</th>
<%--        <th scope="col">type</th>--%>
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
        <td data-label="choice">
            <form action="tempSave.jsp" method="POST">
                <input type="hidden" name="addMemory" value="<%=Memory.getPartsID()%>"/>
                <input type="hidden" name="addMemoryname" value="<%=Memory.getPartsName()%>"/>
                <input type="hidden" name="position" value="6"/>
                <input type="submit" value="Add" />
            </form>
        </td>
        <td data-label="partsName"><%=Memory.getPartsName()%></td>
        <td data-label="ratings"><%=Memory.getRatings()%></td>
        <td data-label="price"><%=Memory.getPrice()%></td>
        <td data-label="brand"><%=Memory.getBrand()%></td>
<%--        <td data-label="type"><%=Memory.getType()%></td>--%>
        <td data-label="Modules"><%=Memory.getModules()%></td>
        <td data-label="RAM_type"><%=Memory.getRAM_type()%></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</div>

<br>


<button onclick="openStorage()">Storage</button>
<div id = "Storage1" style="display:none">
    <br>
<table id = "Storage" width="100%" style="text-align:center">
    <thead>
    <tr>
        <th scope="col">check</th>
        <th scope="col">partsName</th>
        <th scope="col">ratings</th>
        <th scope="col">price</th>
        <th scope="col">brand</th>
<%--        <th scope="col">type</th>--%>
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
        <td data-label="choice">
            <form action="tempSave.jsp" method="POST">
                <input type="hidden" name="addStorage" value="<%=Storage.getPartsID()%>"/>
                <input type="hidden" name="addStoragename" value="<%=Storage.getPartsName()%>"/>
                <input type="hidden" name="position" value="8"/>
                <input type="submit" value="Add" />
            </form>
        </td>
        <td data-label="partsName"><%=Storage.getPartsName()%></td>
        <td data-label="ratings"><%=Storage.getRatings()%></td>
        <td data-label="price"><%=Storage.getPrice()%></td>
        <td data-label="brand"><%=Storage.getBrand()%></td>
<%--        <td data-label="type"><%=Storage.getType()%></td>--%>
        <td data-label="storage_type"><%=Storage.getStorage_type()%></td>
        <td data-label="capacity"><%=Storage.getCapacity()%></td>
        <td data-label="interface"><%=Storage.getInterface()%></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</div>

<br>


<button onclick="openCase()">Cases</button>
<div id = "ComputerCase1" style="display:none">
    <br>
<table id = "ComputerCase" width="100%" style="text-align:center">
    <thead>
    <tr>
        <th scope="col">check</th>
        <th scope="col">partsName</th>
        <th scope="col">ratings</th>
        <th scope="col">price</th>
        <th scope="col">brand</th>
<%--        <th scope="col">type</th>--%>
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
        <td data-label="choice">
            <form action="tempSave.jsp" method="POST">
                <input type="hidden" name="addCase" value="<%=Case.getPartsID()%>"/>
                <input type="hidden" name="addCasename" value="<%=Case.getPartsName()%>"/>
                <input type="hidden" name="position" value="5"/>
                <input type="submit" value="Add" />
            </form>
        </td>
        <td data-label="partsName"><%=Case.getPartsName()%></td>
        <td data-label="ratings"><%=Case.getRatings()%></td>
        <td data-label="price"><%=Case.getPrice()%></td>
        <td data-label="brand"><%=Case.getBrand()%></td>
<%--        <td data-label="type"><%=Case.getType()%></td>--%>
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
</div>

<br>


<button onclick="openGPU()">Graphic Cards</button>
<div id = "GPU1" style="display:none">
    <br>
<table id = "GPU" width="100%" style="text-align:center">
    <thead>
    <tr>
        <th scope="col">check</th>
        <th scope="col">partsName</th>
        <th scope="col">ratings</th>
        <th scope="col">price</th>
        <th scope="col">brand</th>
<%--        <th scope="col">type</th>--%>
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
        <td data-label="choice">
            <form action="tempSave.jsp" method="POST">
                <input type="hidden" name="addGPU" value="<%=GPU.getPartsID()%>"/>
                <input type="hidden" name="addGPUname" value="<%=GPU.getPartsName()%>"/>
                <input type="hidden" name="position" value="2"/>
                <input type="submit" value="Add" />
            </form>
        </td>
        <td data-label="partsName"><%=GPU.getPartsName()%></td>
        <td data-label="ratings"><%=GPU.getRatings()%></td>
        <td data-label="price"><%=GPU.getPrice()%></td>
        <td data-label="brand"><%=GPU.getBrand()%></td>
<%--        <td data-label="type"><%=GPU.getType()%></td>--%>
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
</div>

<br>

<button onclick="openPS()">Power Supply</button>
<div id = "PowerSupply1" style="display:none">
    <br>
<table id = "PowerSupply" width="100%" style="text-align:center">
    <thead>
    <tr>
        <th scope="col">check</th>
        <th scope="col">partsName</th>
        <th scope="col">ratings</th>
        <th scope="col">price</th>
        <th scope="col">brand</th>
<%--        <th scope="col">type</th>--%>
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
        <td data-label="choice">
            <form action="tempSave.jsp" method="POST">
                <input type="hidden" name="addPS" value="<%=PS.getPartsID()%>"/>
                <input type="hidden" name="addPSname" value="<%=PS.getPartsName()%>"/>
                <input type="hidden" name="position" value="15"/>
                <input type="submit" value="Add" />
            </form>
        </td>
        <td data-label="partsName"><%=PS.getPartsName()%></td>
        <td data-label="ratings"><%=PS.getRatings()%></td>
        <td data-label="price"><%=PS.getPrice()%></td>
        <td data-label="brand"><%=PS.getBrand()%></td>
<%--        <td data-label="type"><%=PS.getType()%></td>--%>
        <td data-label="Wattage"><%=PS.getWattage()%></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</div>


<%
    String username = (String) session.getAttribute("username");
%>

<br>
<h1><%=username%>, Start your own build</h1>
<h1><%=(String)session.getAttribute("error")%></h1>
<table  style="text-align: center; font-size: 20px;">
    <thead>
    <tr>
        <th scope="col" style="text-align: center; font-size: 24px;">Parts Type</th>
        <th scope="col" style="text-align: center; font-size: 24px;">Added Parts Name</th>
        <th scope="col" style="text-align: center; font-size: 24px;">Delete</th>
    </tr>
    <br>
    </thead>
    <tbody>
    <tr>
        <th scope="col"><br></th>
        <th scope="col"></th>
        <th scope="col"></th>
    </tr>
    <tr>
        <th scope="col"><br></th>
        <th scope="col"></th>
        <th scope="col"></th>
    </tr>
    <tr>
        <th>CPU</th>
        <th><%=addedCPUname%></th>
        <th>
            <form action="tempSave.jsp" method="POST">
                <input type="hidden" name="addCPU" value="-1"/>
                <input type="hidden" name="addCPUname" value=""/>
                <input type="hidden" name="position" value="1"/>
                <input type="submit" value="Delete" />
            </form>
        </th>
    </tr>
    <tr>
        <th>Motherboard</th>
        <th><%=addedMBname%></th>
        <td>
            <form action="tempSave.jsp" method="POST">
                <input type="hidden" name="addMB" value="-1"/>
                <input type="hidden" name="addMBname" value=""/>
                <input type="hidden" name="position" value="4"/>
                <input type="submit" value="Delete" />
            </form>
        </td>
    </tr>
    <tr>
        <th>Cooler</th>
        <th><%=addedCoolername%></th>
        <td>
            <form action="tempSave.jsp" method="POST">
                <input type="hidden" name="addCooler" value="-1"/>
                <input type="hidden" name="addCoolername" value=""/>
                <input type="hidden" name="position" value="14"/>
                <input type="submit" value="Delete" />
            </form>
        </td>
    </tr>
    <tr>
        <th>Memory</th>
        <th><%=addedMemoryname%></th>
        <td>
            <form action="tempSave.jsp" method="POST">
                <input type="hidden" name="addMemory1" value="-1"/>
                <input type="hidden" name="addMemory1name" value=""/>
                <input type="hidden" name="position" value="6"/>
                <input type="submit" value="Delete" />
            </form>
        </td>
    </tr>
    <tr>
        <th>Memory</th>
        <th><%=addedMemory2name%></th>
        <td>
            <form action="tempSave.jsp" method="POST">
                <input type="hidden" name="addMemory2" value="-1"/>
                <input type="hidden" name="addMemory2name" value=""/>
                <input type="hidden" name="position" value="7"/>
                <input type="submit" value="Delete" />
            </form>
        </td>
    </tr>
    <tr>
        <th>Storage</th>
        <th><%=addedStoragename%></th>
        <td>
            <form action="tempSave.jsp" method="POST">
                <input type="hidden" name="addStorage1" value="-1"/>
                <input type="hidden" name="addStorage1name" value=""/>
                <input type="hidden" name="position" value="8"/>
                <input type="submit" value="Delete" />
            </form>
        </td>
    </tr>
    <tr>
        <th>Storage</th>
        <th><%=addedStorage2name%></th>
        <td>
            <form action="tempSave.jsp" method="POST">
                <input type="hidden" name="addStorage2" value="-1"/>
                <input type="hidden" name="addStorage2name" value=""/>
                <input type="hidden" name="position" value="9"/>
                <input type="submit" value="Delete" />
            </form>
        </td>
    </tr>
    <tr>
        <th>Storage</th>
        <th><%=addedStorage3name%></th>
        <td>
            <form action="tempSave.jsp" method="POST">
                <input type="hidden" name="addStorage3" value="-1"/>
                <input type="hidden" name="addStorage3name" value=""/>
                <input type="hidden" name="position" value="10"/>
                <input type="submit" value="Delete" />
            </form>
        </td>
    </tr>
    <tr>
        <th>Storage</th>
        <th><%=addedStorage4name%></th>
        <td>
            <form action="tempSave.jsp" method="POST">
                <input type="hidden" name="addStorage4" value="-1"/>
                <input type="hidden" name="addStorage4name" value=""/>
                <input type="hidden" name="position" value="11"/>
                <input type="submit" value="Delete" />
            </form>
        </td>
    </tr>
    <tr>
        <th>Storage</th>
        <th><%=addedStorage5name%></th>
        <td>
            <form action="tempSave.jsp" method="POST">
                <input type="hidden" name="addStorage5" value="-1"/>
                <input type="hidden" name="addStorage5name" value=""/>
                <input type="hidden" name="position" value="12"/>
                <input type="submit" value="Delete" />
            </form>
        </td>
    </tr>
    <tr>
        <th>Storage</th>
        <th><%=addedStorage6name%></th>
        <td>
            <form action="tempSave.jsp" method="POST">
                <input type="hidden" name="addStorage6" value="-1"/>
                <input type="hidden" name="addStorage6name" value=""/>
                <input type="hidden" name="position" value="13"/>
                <input type="submit" value="Delete" />
            </form>
        </td>
    </tr>
    <tr>
        <th>Case</th>
        <th><%=addedCasename%></th>
        <td>
            <form action="tempSave.jsp" method="POST">
                <input type="hidden" name="addCase" value="-1"/>
                <input type="hidden" name="addCasename" value=""/>
                <input type="hidden" name="position" value="5"/>
                <input type="submit" value="Delete" />
            </form>
        </td>
    </tr>
    <tr>
        <th>Video Card</th>
        <th><%=addedGPUname%></th>
        <td>
            <form action="tempSave.jsp" method="POST">
                <input type="hidden" name="addGPU1" value="-1"/>
                <input type="hidden" name="addGPU1name" value=""/>
                <input type="hidden" name="position" value="2"/>
                <input type="submit" value="Delete" />
            </form>
        </td>
    </tr>
    <tr>
        <th>Second Video Card</th>
        <th><%=addedGPU2name%></th>
        <td>
            <form action="tempSave.jsp" method="POST">
                <input type="hidden" name="addGPU2" value="-1"/>
                <input type="hidden" name="addGPU2name" value=""/>
                <input type="hidden" name="position" value="3"/>
                <input type="submit" value="Delete" />
            </form>
        </td>
    </tr>
    <tr>
        <th>Power Supply</th>
        <th><%=addedPSname%></th>
        <td>
            <form action="tempSave.jsp" method="POST">
                <input type="hidden" name="addPS" value="-1"/>
                <input type="hidden" name="addPSname" value=""/>
                <input type="hidden" name="position" value="15"/>
                <input type="submit" value="Delete" />
            </form>
        </td>
    </tr>
    </tbody>
</table>



<form name="link_form" method="post" action="checkOnSubmit.jsp">

    <input type="hidden" name="methodType" id="methodTypeStoring" value="insert"/>
    <input type="hidden" name="username" id="user name" value="<%=username%>" />
    <input type="hidden" name="CPU" id="CPUID" value="<%=addedCPU%>" />
    <input type="hidden" name="GPU" id="GPUID" value="<%=addedGPU%>" />
    <input type="hidden" name="GPU2" id="GPUID2" value="<%=addedGPU2%>" />
    <input type="hidden" name="Motherboard" id="MotherboardID" value="<%=addedMB%>" />
    <input type="hidden" name="ComputerCase" id="ComputerCaseID" value="<%=addedCase%>" />
    <input type="hidden" name="Memory" id="MemoryID" value="<%=addedMemory%>" />
    <input type="hidden" name="Memory2" id="Memory2ID" value="<%=addedMemory2%>" />
    <input type="hidden" name="Storage" id="StorageID" value="<%=addedStorage%>" />
    <input type="hidden" name="Storage2" id="Storage2ID" value="<%=addedStorage2%>" />
    <input type="hidden" name="Storage3" id="Storage3ID" value="<%=addedStorage3%>" />
    <input type="hidden" name="Storage4" id="Storage4ID" value="<%=addedStorage4%>" />
    <input type="hidden" name="Storage5" id="Storage5ID" value="<%=addedStorage5%>" />
    <input type="hidden" name="Storage6" id="Storage6ID" value="<%=addedStorage6%>" />
    <input type="hidden" name="Coolingsystem" id="CoolingsystemID" value="<%=addedCooler%>" />
    <input type="hidden" name="Powersupply" id="PowersupplyID" value="<%=addedPS%>" />
    <br>
    <input type="submit" value="Assemble">
</form>


<%--<script src="assets/js/Datatable.js"></script>--%>


<%--<script src="dbmanagePage/assets/js/vendor/jquery-2.2.4.min.js"></script>--%>

<%--&lt;%&ndash;<script src="dbmanagePage/assets/js/popper.min.js"></script>&ndash;%&gt;--%>
<%--<script src="dbmanagePage/assets/js/bootstrap.min.js"></script>--%>
<%--<script src="dbmanagePage/assets/js/owl.carousel.min.js"></script>--%>
<%--<script src="dbmanagePage/assets/js/metisMenu.min.js"></script>--%>
<%--<script src="dbmanagePage/assets/js/jquery.slimscroll.min.js"></script>--%>
<%--&lt;%&ndash;<script src="dbmanagePage/assets/js/jquery.slicknav.min.js"></script>&ndash;%&gt;--%>

<%--<!-- Start datatable js -->--%>
<%--<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>--%>
<%--<script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>--%>
<%--<script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>--%>
<%--<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>--%>
<%--<script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>--%>

<%--<script src="dbmanagePage/assets/js/plugins.js"></script>--%>
<%--<script src="dbmanagePage/assets/js/scripts.js"></script>--%>


<script src="dataTable/js/jquery-3.5.1.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
<script src="assets/js/usershowall.js"></script>
<script src="assets/js/userhistory.js"></script>

</body>
</html>
