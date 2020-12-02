<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.*" %>
<%@ page import="entity.*" %>
<%@ page import="java.util.Map" %>
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

    <link rel="stylesheet" type="text/css" href="assets/css/datatable.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">

<%--    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">--%>
    <script src="dbmanagePage/assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>


<h1 style="font-size: 24px">History</h1>

<div id = "CPU1" >
<table id="CPU" width="100%" class="display">
    <thead class="text-uppercase">
    <tr>
        <th scope="col">CPU</th>
        <th scope="col">GPU chipset</th>
        <th scope="col">Memory</th>
        <th scope="col">Specifications</th>
        <th scope="col">Delete</th>
    </tr>
    </thead>
    <tbody>
    <%
        String username = (String) session.getAttribute("username");
        session.setAttribute("username", username);
        int reco = 0;
        if (username == null) {
    %>

    <jsp:forward page="index.jsp"></jsp:forward>

    <%
        }
        if (request.getParameter("reco") != null) {
            reco = 1;
            request.setAttribute("reco", null);
        }
        MongoDAO daoHistory = new MongoDAO();
        CPUDAO daoCPU = new CPUDAO();
        GPUDAO daoGPU = new GPUDAO();
        MotherboardDAO daoMB = new MotherboardDAO();
        ComputerCaseDAO daoCase = new ComputerCaseDAO();
        MemoryDAO daoMemory = new MemoryDAO();
        StorageDAO daoStorage = new StorageDAO();
        CoolingSystemDAO daoCooler = new CoolingSystemDAO();
        PowerSupplyDAO daoPS= new PowerSupplyDAO();
        ArrayList<MongoDBresult> history = daoHistory.findUserDocuments(username);
        if (history == null) {
    %>

    <h1>Please add some PCs here.</h1>

    <%
        } else {
        for (MongoDBresult h : history) {
    %>
    <tr>

        <%
        CPU thisCPU = daoCPU.getSpecialCPU(h.getCPU());%>
        <td data-label="CPU" align="center"><%=thisCPU.getPartsName()%>
        </td>
        <%
            String Chip = "";
            if (h.getGPU() != -1) {
                GPU thisGPU = daoGPU.getSpecialGPU(h.getGPU());
                Chip = thisGPU.getChipset();
            }
        %>
        <td data-label="GPU" align="center"><%=Chip%>
        </td>


        <%
            String m1 = "";
            String m2 = "";
            if (h.getMemory() != -1) {
                Memory thisMemory = daoMemory.getSpecialMemory(h.getMemory());
                m1 = thisMemory.getPartsName();
            }
            if (h.getMemory2() != -1) {
                Memory thisMemory2 = daoMemory.getSpecialMemory(h.getMemory2());
                m2 = thisMemory2.getPartsName();
            }
        %>
        <td data-label="Memory" align="center"><%=m1%>
        <br><%=m2%>
        </td>


            <td data-label="show" align="center">
                <form action="userShowSpe.jsp" method="POST">
                    <input type="hidden" name="iCPU" value="<%=h.getCPU()%>"/>
                    <input type="hidden" name="iGPU" value="<%=h.getGPU()%>"/>
                    <input type="hidden" name="iGPU2" value="<%=h.getGPU2()%>"/>
                    <input type="hidden" name="iMB" value="<%=h.getMotherboard()%>"/>
                    <input type="hidden" name="iCooler" value="<%=h.getCoolingsystem()%>"/>
                    <input type="hidden" name="iMemory" value="<%=h.getMemory()%>"/>
                    <input type="hidden" name="iMemory2" value="<%=h.getMemory2()%>"/>
                    <input type="hidden" name="iStorage" value="<%=h.getStorage()%>"/>
                    <input type="hidden" name="iStorage2" value="<%=h.getStorage2()%>"/>
                    <input type="hidden" name="iStorage3" value="<%=h.getStorage3()%>"/>
                    <input type="hidden" name="iStorage4" value="<%=h.getStorage4()%>"/>
                    <input type="hidden" name="iStorage5" value="<%=h.getStorage5()%>"/>
                    <input type="hidden" name="iStorage6" value="<%=h.getStorage6()%>"/>
                    <input type="hidden" name="iCase" value="<%=h.getComputerCase()%>"/>
                    <input type="hidden" name="iPS" value="<%=h.getPowersupply()%>"/>
                    <input type="submit" value="Specifcations" />
                </form>
            </td>

            <td data-label="delete" align="center">
                <form action="MongoDBServlet" method="POST">
                    <input type="hidden" name="methodType" id="methodTypeStoring" value="delete"/>
                    <input type="hidden" name="id" id="idd" value="<%=h.getId()%>"/>
                    <input type="submit" value="Delete" />
                </form>
            </td>
    <%
        }
    %>
    </tbody>
</table>
</div>

<br>

<%
    if (reco == 1) {
        GenerateDAO R = new GenerateDAO();
        Map<String, String> recommend = R.gainRecommand(username);
        daoHistory.insertDocument(recommend, username);
    }
%>
<form name="link_form" method="post" action="userhistory.jsp">
    <input type="hidden" name="reco" value="1">
    <input type="submit" value="See some recommendation">
</form>

<%
    }
%>

<form name="link_form" method="post" action="userShowall.jsp">
    <input type="submit" value="Start a new assemble">
</form>

<form name="link_form" method="post" action="userShowPCexamples.jsp">
    <input type="submit" value="See some examples">
</form>




<script src="dataTable/js/jquery-3.5.1.js"></script>
<%--<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>--%>
<script src="assets/js/usershowall.js"></script>
<script src="assets/js/userhistory.js"></script>
</body>
</html>



