<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.*" %>
<%@ page import="entity.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" autoFlush="false" buffer="300kb"%>
<html>
<head>
    <title>BrowseParts</title>
    <link rel="stylesheet" href="assets/css/usershowall.css" />


<%--    <link rel="stylesheet" href="dbmanagePage/assets/css/bootstrap.min.css">--%>
<%--    <link rel="stylesheet" href="dbmanagePage/assets/css/font-awesome.min.css">--%>
<%--    <link rel="stylesheet" href="dbmanagePage/assets/css/themify-icons.css">--%>
<%--    <link rel="stylesheet" href="dbmanagePage/assets/css/metisMenu.css">--%>
<%--    <link rel="stylesheet" href="dbmanagePage/assets/css/owl.carousel.min.css">--%>
<%--    <link rel="stylesheet" href="dbmanagePage/assets/css/slicknav.min.css">--%>
<%--    <!-- Start datatable css -->--%>
<%--    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">--%>
    <link rel="stylesheet" type="text/css" href="assets/css/datatable.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">

<%--    <link rel="stylesheet" href="dbmanagePage/assets/css/typography.css">--%>
<%--    <link rel="stylesheet" href="dbmanagePage/assets/css/default-css.css">--%>
<%--    <link rel="stylesheet" href="dbmanagePage/assets/css/styles.css">--%>
<%--    <link rel="stylesheet" href="dbmanagePage/assets/css/responsive.css">--%>

    <script src="dbmanagePage/assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>
<div class="page-container">

<br>

<div class="main-content-inner">
    <div class="row">
<div class="col-12 mt-5">
    <div class="card">
        <div class="card-body">
            <div class="data-tables">
                <table id="dataTable" class="text-center">
                    <thead class="text-uppercase">
                    <tr>
                        <th scope="col">PartsID</th>
                        <th scope="col">ratings</th>
                        <th scope="col">price</th>
                        <th scope="col">brand</th>
                        <th scope="col">partsName</th>
                        <th scope="col">type</th>
                        <th scope="col">delete</th>
                        <th scope="col">update</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        PartsDAO dao = new  PartsDAO();
                        ArrayList<Parts> parts = dao.getAllParts();
                        for (Parts part : parts) {
                    %>
                    <tr>
                        <th data-label="PartsID"><%=part.getPartsID() %>
                        </th>
                        <td data-label="ratings"><%=part.getRatings()%>
                        </td>
                        <td data-label="price"><%=part.getPrice()%>
                        </td>
                        <td data-label="brand"><%=part.getBrand()%>
                        </td>
                        <td data-label="partsName"><%=part.getPartsName()%>
                        </td>
                        <td data-label="type"><%=part.getType()%>
                        </td>
                        <td><i class="ti-trash" href="DeleteServlet?id=<%=part.getPartsID() %>"></i></td>
                        <td><a href="updatePrice.jsp?id=<%=part.getPartsID() %>">update Id</a>
                            <a href="updatePrice.jsp?id=<%=part.getPartsID() %>">update Ratings</a>
                            <a href="updatePrice.jsp?id=<%=part.getPartsID() %>">update Price</a>
                            <a href="updatePrice.jsp?id=<%=part.getPartsID() %>">update Brand</a>
                            <a href="updatePrice.jsp?id=<%=part.getPartsID() %>">update Name</a>
                            <a href="updatePrice.jsp?id=<%=part.getPartsID() %>">update Type</a></td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

    </div>
</div>
<button onclick="openCPU()">CPU</button>


<%--<a>CPU Table</a>--%>
        <div class="row">
            <div class="col-12 mt-5">
                <div class="card">
                    <div class="card-body">
                        <div class="data-tables">
                            <table id="dataTable2" class="text-center" display = "none">
                                <thead class="text-uppercase">
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
                                    <td data-label="ratings" align="center"><%=cpu.getRatings()%>
                                    </td>
                                    <td data-label="price" align="center"><%=cpu.getPrice()%>
                                    </td>
                                    <td data-label="brand" align="center"><%=cpu.getBrand()%>
                                    </td>
                                    <td data-label="partsName" align="center"><%=cpu.getPartsName()%>
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
                    </div>
                </div>
            </div>
        </div>

<%--<table id = "CPU" width="100%" display = "none">--%>
<%--    <thead>--%>
<%--        <tr>--%>
<%--            <th scope="col">ratings</th>--%>
<%--            <th scope="col">price</th>--%>
<%--            <th scope="col">brand</th>--%>
<%--            <th scope="col">partsName</th>--%>
<%--            <th scope="col">Power Consumption</th>--%>
<%--            <th scope="col">Compatible Socket</th>--%>
<%--            <th scope="col">Integrated Graphics</th>--%>
<%--        </tr>--%>
<%--    </thead>--%>

<%--    <tbody>--%>
<%--        <%--%>
<%--            CPUDAO daoCPU = new  CPUDAO();--%>
<%--            ArrayList<CPU> CPUs = daoCPU.getAllCPU();--%>
<%--            for (CPU cpu : CPUs) {--%>
<%--        %>--%>
<%--        <tr>--%>
<%--            <td data-label="ratings" align="center"><%=cpu.getRatings()%>--%>
<%--            </td>--%>
<%--            <td data-label="price" align="center"><%=cpu.getPrice()%>--%>
<%--            </td>--%>
<%--            <td data-label="brand" align="center"><%=cpu.getBrand()%>--%>
<%--            </td>--%>
<%--            <td data-label="partsName" align="center"><%=cpu.getPartsName()%>--%>
<%--            </td>--%>
<%--            <td data-label="Power Consumption" align="center"><%=cpu.getPower_consumption()%>W--%>
<%--            </td>--%>
<%--            <td data-label="Compatible Socket" align="center"><%=cpu.getCompatible_socket()%>--%>
<%--            </td>--%>
<%--            <td data-label="Integrated Graphics" align="center"><%=cpu.getIntegrated_graphics()%>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <%--%>
<%--            }--%>
<%--        %>--%>
<%--    </tbody>--%>
<%--</table>--%>

<br>
<br>


<button onclick="openMotherboard()">Motherboard</button>
<%--<a>Motherboard Table</a>--%>
<table id = "Motherboard" width="100%" display = "none">
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


<button onclick="openCoolers()">Cooling System</button>
<%--<a>Cooling System Table</a>--%>
<table id = "Cooling System" width="100%" display = "none">
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


<button onclick="openMemory()">Memory</button>
<%--<a>Memory Table</a>--%>
<table id = "Memory" width="100%" display = "none">
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


<button onclick="openStorage()">Storage</button>
<%--<a>Storage Table</a>--%>
<table id = "Storage" width="100%" display = "none">
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


<button onclick="openCase()">Cases</button>
<%--<a>Case Table</a>--%>
<table id = "ComputerCase" width="100%" display = "none">
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


<button onclick="openGPU()">Graphic Cards</button>
<%--<a>GPU Table</a>--%>
<table id = "GPU" width="100%" display = "none">
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

<button onclick="openPS()">Power Supply</button>
<%--<a>PowerSupply Table</a>--%>
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
<br>
<br>
    <a>start your own build</a>
    <form name="link_form" method="post" action="MongoDBServlet">
        <input type="hidden" name="methodType" id="methodTypeStoring" value="insert"/>
        <br>
        <input type="hidden" name="username" id="Username" value=session.getAttribute("username")/>
        <br>
        <input type="text" name="CPU" id="CPUID" placeholder="CPUID" />
        <br>
        <input type="text" name="GPU" id="GPUID" placeholder="GPUID" />
        <br>
        <input type="text" name="Motherboard" id="MotherboardID" placeholder="MotherboardID" />
        <br>
        <input type="text" name="ComputerCase" id="ComputerCaseID" placeholder="ComputerCaseID" />
        <br>
        <input type="text" name="Memory" id="MemoryID" placeholder="MemoryID" />
        <br>
        <input type="text" name="Memory2" id="Memory2ID" placeholder="Memory2ID" />
        <br>
        <input type="text" name="Storage" id="StorageID" placeholder="StorageID" />
        <br>
        <input type="text" name="Storage2" id="Storage2ID" placeholder="Storage2ID" />
        <br>
        <input type="text" name="Storage3" id="Storage3ID" placeholder="Storage3ID" />
        <br>
        <input type="text" name="Storage4" id="Storage4ID" placeholder="Storage4ID" />
        <br>
        <input type="text" name="Storage5" id="Storage5ID" placeholder="Storage5ID" />
        <br>
        <input type="text" name="Storage6" id="Storage6ID" placeholder="Storage6ID" />
        <br>
        <input type="text" name="Coolingsystem" id="CoolingsystemID" placeholder="CoolingsystemID" />
        <br>
        <input type="text" name="Powersupply" id="PowersupplyID" placeholder="PowersupplyID" />
        <br>
        <input type="submit" value="Assemble">
    </form>

</div>

<script src="assets/js/usershowall.js"></script>

<script src="dbmanagePage/assets/js/vendor/jquery-2.2.4.min.js"></script>

<script src="dbmanagePage/assets/js/popper.min.js"></script>
<script src="dbmanagePage/assets/js/bootstrap.min.js"></script>
<script src="dbmanagePage/assets/js/owl.carousel.min.js"></script>
<script src="dbmanagePage/assets/js/metisMenu.min.js"></script>
<script src="dbmanagePage/assets/js/jquery.slimscroll.min.js"></script>
<script src="dbmanagePage/assets/js/jquery.slicknav.min.js"></script>

<!-- Start datatable js -->
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>

<script src="dbmanagePage/assets/js/plugins.js"></script>
<script src="dbmanagePage/assets/js/scripts.js"></script>


</body>
</html>
