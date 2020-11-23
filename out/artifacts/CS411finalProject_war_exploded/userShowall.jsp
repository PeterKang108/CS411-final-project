<%@ page import="entity.Parts" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.PartsDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>BrowseParts</title>
</head>
<body>

<table id = "CPU" width="100%">
    <thead>
        <tr>
    <%--        <th scope="col">PartsID</th>--%>
            <th scope="col">ratings</th>
            <th scope="col">price</th>
            <th scope="col">brand</th>
            <th scope="col">partsName</th>
            <th scope="col">type</th>
    <%--        <th scope="col">delete</th>--%>
    <%--        <th scope="col">update</th>--%>
            <th scope="col">Power Consumption</th>
            <th scope="col">Compatible Socket</th>
            <th scope="col">Integrated Graphics</th>
        </tr>
    </thead>

    <tbody>
        <%
            PartsDAO dao1 = new  PartsDAO();
            ArrayList<Parts> CPUs = dao1.getAllParts();
            for (Parts CPU : CPUs) {
        %>
        <tr>
<%--            <th data-label="PartsID"><%=CPU.getPartsID() %>--%>
<%--            </th>--%>
            <td data-label="ratings"><%=CPU.getRatings()%>
            </td>
            <td data-label="price"><%=CPU.getPrice()%>
            </td>
            <td data-label="brand"><%=CPU.getBrand()%>
            </td>
            <td data-label="partsName"><%=CPU.getPartsName()%>
            </td>
            <td data-label="type"><%=CPU.getType()%>
            </td>
<%--            <td data-label="Power Consumption"><%=CPU.getPower()%>--%>
<%--            </td>--%>
<%--            <td data-label="Compatible Socket"><%=CPU.getSocket()%>--%>
<%--            </td>--%>
<%--            <td data-label="Integrated Graphics"><%=CPU.getIntegratedGraphics()%>--%>
<%--            </td>--%>
        </tr>
        <%
            }
        %>
    </tbody>
</table>

<br>
<br>

<table id = "Motherboard" width="100%">
    <thead>
    <tr>
        <%--        <th scope="col">PartsID</th>--%>
        <th scope="col">ratings</th>
        <th scope="col">price</th>
        <th scope="col">brand</th>
        <th scope="col">partsName</th>
        <th scope="col">type</th>
        <%--        <th scope="col">delete</th>--%>
        <%--        <th scope="col">update</th>--%>
        <th scope="col">Compatible Socket</th>
        <th scope="col">Number of PCIe 4.0</th>
        <th scope="col">Number of PCIe 3.0</th>
        <th scope="col">Number of PCIe 2.0</th>
        <th scope="col">Power Consumption</th>
        <th scope="col">USB 3.0 Support?</th>
        <th scope="col">Number of M.2 port</th>
        <th scope="col">size</th>
    </tr>
    </thead>

    <tbody>
    <%
        PartsDAO dao2 = new  PartsDAO();
        ArrayList<Parts> Motherboards = dao2.getAllParts();
        for (Parts M : Motherboards) {
    %>
    <tr>
        <%--            <th data-label="PartsID"><%=CPU.getPartsID() %>--%>
        <%--            </th>--%>
        <td data-label="ratings"><%=M.getRatings()%></td>
        <td data-label="price"><%=M.getPrice()%></td>
        <td data-label="brand"><%=M.getBrand()%></td>
        <td data-label="partsName"><%=M.getPartsName()%></td>
        <td data-label="type"><%=M.getType()%></td>
<%--        <td data-label="Compatible Socket"><%=CPU.getSocket()%></td>--%>
<%--        <td data-label="number_of_PCIe_4.0"><%=CPU.getnumber_of_PCIe_4()%></td>--%>
<%--        <td data-label="number_of_PCIe_3.0"><%=CPU.getnumber_of_PCIe_3()%></td>--%>
<%--        <td data-label="number_of_PCIe_2.0"><%=CPU.getnumber_of_PCIe_2()%></td>--%>
<%--        <td data-label="power_consumption"><%=CPU.getpower_consumption()%></td>--%>
<%--        <td data-label="Number of m.2"><%=CPU.getpower_consumption()%></td>--%>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

<br>
<br>

<table id = "Cooling System" width="100%">
    <thead>
    <tr>
        <%--        <th scope="col">PartsID</th>--%>
        <th scope="col">ratings</th>
        <th scope="col">price</th>
        <th scope="col">brand</th>
        <th scope="col">partsName</th>
        <th scope="col">type</th>
        <%--        <th scope="col">delete</th>--%>
        <%--        <th scope="col">update</th>--%>
        <th scope="col">Cooler Type</th>
        <th scope="col">Radiator Size</th>
        <th scope="col">RGB</th>
        <th scope="col">Compatible Socket</th>
    </tr>
    </thead>

    <tbody>
    <%
        PartsDAO daoCoolingSystem = new  PartsDAO();
        ArrayList<Parts> Coolers = daoCoolingSystem.getAllParts();
        for (Parts Cooler : Coolers) {
    %>
    <tr>
        <%--            <th data-label="PartsID"><%=CPU.getPartsID() %>--%>
        <%--            </th>--%>
        <td data-label="ratings"><%=Cooler.getRatings()%></td>
        <td data-label="price"><%=Cooler.getPrice()%></td>
        <td data-label="brand"><%=Cooler.getBrand()%></td>
        <td data-label="partsName"><%=Cooler.getPartsName()%></td>
        <td data-label="type"><%=Cooler.getType()%></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>


</body>
</html>
