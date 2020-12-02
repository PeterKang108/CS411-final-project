<%--
  Created by IntelliJ IDEA.
  User: Peter
  Date: 2020/12/2
  Time: 19:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Checking</title>
    <link rel="stylesheet" href="assets/css/usershowall.css" />

    <%--    <!-- Start datatable css -->--%>
    <%--    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">--%>
    <link rel="stylesheet" type="text/css" href="assets/css/datatable.css">
</head>
<body>

<%
    String username = request.getParameter("username");
int CPU = Integer.parseInt(request.getParameter("CPU"));
int GPU = Integer.parseInt(request.getParameter("GPU"));
int GPU2 = Integer.parseInt(request.getParameter("GPU2"));
int Motherboard = Integer.parseInt(request.getParameter("Motherboard"));
int Coolingsystem = Integer.parseInt(request.getParameter("Coolingsystem"));
int Memory = Integer.parseInt(request.getParameter("Memory"));
int Memory2 = Integer.parseInt(request.getParameter("Memory2"));
int Storage = Integer.parseInt(request.getParameter("Storage"));
int Storage2 = Integer.parseInt(request.getParameter("Storage2"));
int Storage3 = Integer.parseInt(request.getParameter("Storage3"));
int Storage4 = Integer.parseInt(request.getParameter("Storage4"));
int Storage5 = Integer.parseInt(request.getParameter("Storage5"));
int Storage6 = Integer.parseInt(request.getParameter("Storage6"));
int ComputerCase = Integer.parseInt(request.getParameter("ComputerCase"));
int Powersupply = Integer.parseInt(request.getParameter("Powersupply"));

if (username == null) {
    session.setAttribute("error", "Please Login");
%>
<jsp:forward page="userShowall.jsp"></jsp:forward>
<%
} else {
    session.setAttribute("username", username);
}
if (CPU == -1) {
    session.setAttribute("error", "Need CPU");
%>
<jsp:forward page="userShowall.jsp"></jsp:forward>
<%
}
if (GPU == -1) {
    session.setAttribute("error", "Need GPU");
%>
<jsp:forward page="userShowall.jsp"></jsp:forward>
<%
}
if (Motherboard == -1) {
    session.setAttribute("error", "Need Motherboard");
%>
<jsp:forward page="userShowall.jsp"></jsp:forward>
<%
}
if (Coolingsystem == -1) {
    session.setAttribute("error", "Need Coolingsystem");
%>
<jsp:forward page="userShowall.jsp"></jsp:forward>
<%
    }
if (Memory == -1) {
    session.setAttribute("error", "Need Memory");
%>
<jsp:forward page="userShowall.jsp"></jsp:forward>
<%
}
if (Storage == -1) {
    session.setAttribute("error", "Need Storage");
%>
<jsp:forward page="userShowall.jsp"></jsp:forward>
<%
}
if (ComputerCase == -1) {
    session.setAttribute("error", "Need ComputerCase");
%>
<jsp:forward page="userShowall.jsp"></jsp:forward>
<%
}
if (Powersupply == -1) {
    session.setAttribute("error", "Need Powersupply");
%>
<jsp:forward page="userShowall.jsp"></jsp:forward>
<%
}
%>
<form name="link_form" method="post" action="MongoDBServlet">
    <input type="hidden" name="methodType" id="methodTypeStoring" value="insert"/>
    <input type="hidden" name="username" id="user name" value="<%=username%>" />
    <input type="hidden" name="CPU" id="CPUID" value="<%=CPU%>" />
    <input type="hidden" name="GPU" id="GPUID" value="<%=GPU%>" />
    <input type="hidden" name="GPU2" id="GPUID2" value="<%=GPU2%>" />
    <input type="hidden" name="Motherboard" id="MotherboardID" value="<%=Motherboard%>" />
    <input type="hidden" name="ComputerCase" id="ComputerCaseID" value="<%=ComputerCase%>" />
    <input type="hidden" name="Memory" id="MemoryID" value="<%=Memory%>" />
    <input type="hidden" name="Memory2" id="Memory2ID" value="<%=Memory2%>" />
    <input type="hidden" name="Storage" id="StorageID" value="<%=Storage%>" />
    <input type="hidden" name="Storage2" id="Storage2ID" value="<%=Storage2%>" />
    <input type="hidden" name="Storage3" id="Storage3ID" value="<%=Storage3%>" />
    <input type="hidden" name="Storage4" id="Storage4ID" value="<%=Storage4%>" />
    <input type="hidden" name="Storage5" id="Storage5ID" value="<%=Storage5%>" />
    <input type="hidden" name="Storage6" id="Storage6ID" value="<%=Storage6%>" />
    <input type="hidden" name="Coolingsystem" id="CoolingsystemID" value="<%=Coolingsystem%>" />
    <input type="hidden" name="Powersupply" id="PowersupplyID" value="<%=Powersupply%>" />
    <input type="submit" value="See your History">
</form>

<script src="assets/js/usershowall.js"></script>
</body>
</html>
