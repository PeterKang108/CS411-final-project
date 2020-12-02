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
    <link rel="stylesheet" href="assets/css/usershowall.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">
</head>
<body>

<table id="PC" width="100%" class="display">
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
        String username = (String) session.getAttribute("username");
        System.out.println(username);
        MongoDAO daoHistory = new MongoDAO();
        ArrayList<MongoDBresult> history = daoHistory.findUserDocuments(username);
        for (MongoDBresult h : history) {
    %>
    <tr>
        <td data-label="CPU" align="center"><%=h.getCPU()%>
        </td>
        <td data-label="GPU" align="center"><%=h.getGPU()%>
        </td>
        <td data-label="GPU2" align="center"><%=h.getGPU2()%>
        </td>
        <td data-label="Motherboard" align="center"><%=h.getMotherboard()%>
        </td>
        <td data-label="Case" align="center"><%=h.getComputerCase()%>W
        </td>
        <td data-label="Memory" align="center"><%=h.getMemory()%>
        </td>
        <td data-label="Memory2" align="center"><%=h.getMemory2()%>
        </td>
        <td data-label="Memory2" align="center"><%=h.getStorage()%>
        </td>
        <td data-label="Storage" align="center"><%=h.getStorage2()%>
        </td>
        <td data-label="Storage2" align="center"><%=h.getStorage3()%>
        </td>
        <td data-label="Storage3" align="center"><%=h.getStorage4()%>
        </td>
        <td data-label="Storage4" align="center"><%=h.getStorage5()%>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

<script src="dataTable/js/jquery-3.5.1.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
<script src="assets/js/usershowall.js"></script>
<script src="assets/js/userhistory.js"></script>
</body>
</html>



