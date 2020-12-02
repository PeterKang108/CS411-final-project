<%--
  Created by IntelliJ IDEA.
  User: Peter
  Date: 2020/12/2
  Time: 18:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.*" %>
<%@ page import="entity.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" autoFlush="false" buffer="300kb"%>
<html>
<head>
    <title>Show Some Example</title>
    <link rel="stylesheet" href="assets/css/usershowall.css" />

<%--    <link rel="stylesheet" type="text/css" href="assets/css/datatable.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">--%>
    <%--    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">--%>
    <%--    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">--%>
    <script src="dbmanagePage/assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>





<body>
<table id="PC" width="100%" class="display">
    <thead class="text-uppercase">
    <tr>
        <th scope="col">CPU</th>
        <th scope="col">GPU chipset</th>
        <th scope="col">Memory</th>
        <th scope="col">Specifications</th>
        <th scope="col">Add to History</th>
    </tr>
    </thead>
    <tbody>
    <%
        String username = (String) session.getAttribute("username");
        MongoDAO daoHistory = new MongoDAO();
        CPUDAO daoCPU = new CPUDAO();
        GPUDAO daoGPU = new GPUDAO();
        MotherboardDAO daoMB = new MotherboardDAO();
        ComputerCaseDAO daoCase = new ComputerCaseDAO();
        MemoryDAO daoMemory = new MemoryDAO();
        StorageDAO daoStorage = new StorageDAO();
        CoolingSystemDAO daoCooler = new CoolingSystemDAO();
        PowerSupplyDAO daoPS= new PowerSupplyDAO();
        ArrayList<MongoDBresult> history = daoHistory.findUserDocuments("admin");
        for (MongoDBresult h : history) {
    %>
    <tr>
            <%CPU thisCPU = daoCPU.getSpecialCPU(h.getCPU());%>
        <td data-label="CPU" align="center"><%=thisCPU.getPartsName()%>
        </td>
            <%
            String Chip = "";
            if (h.getGPU() != -1) {
                GPU thisGPU = daoGPU.getSpecialGPU(h.getGPU());
                Chip = thisGPU.getChipset();
            }%>
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


<%--            <%int StorageCapacity = 0;%>--%>

<%--        <td data-label="Storage" align="center"><%=StorageCapacity%>--%>
<%--        </td>--%>

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


        <td align="center">
            <form action="userhistory.jsp" method="POST">
                <input type="submit" value="Add" />
            </form>
        </td>



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
