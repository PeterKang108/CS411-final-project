<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.*" %>
<%@ page import="entity.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" autoFlush="false" buffer="300kb"%>
<%--
  Created by IntelliJ IDEA.
  User: Peter
  Date: 2020/11/30
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UserHistory</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">
</head>
<body>
<table id="CPU" width="100%" class="display">
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

<table id = "Motherboard" width="100%" class="display">
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

<table id="example" class="display" style="width:100%">
    <thead>
    <tr>
        <th>Name</th>
        <th>Position</th>
        <th>Office</th>
        <th>Age</th>
        <th>Start date</th>
        <th>Salary</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>Tiger Nixon</td>
        <td>System Architect</td>
        <td>Edinburgh</td>
        <td>61</td>
        <td>2011/04/25</td>
        <td>$320,800</td>
    </tr>
    <tr>
        <td>Garrett Winters</td>
        <td>Accountant</td>
        <td>Tokyo</td>
        <td>63</td>
        <td>2011/07/25</td>
        <td>$170,750</td>
    </tr>
    <tr>
        <td>Ashton Cox</td>
        <td>Junior Technical Author</td>
        <td>San Francisco</td>
        <td>66</td>
        <td>2009/01/12</td>
        <td>$86,000</td>
    </tr>
    </tbody>
</table>

<script src="dataTable/js/jquery-3.5.1.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>

<script src="assets/js/userhistory.js"></script>
</body>
</html>



