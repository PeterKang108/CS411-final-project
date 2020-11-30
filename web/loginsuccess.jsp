<%@ page import="entity.Useraccount" %><%--
  Created by IntelliJ IDEA.
  User: tzx72
  Date: 2020/11/28
  Time: 21:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SUCCESS</title>
</head>
<body>
<%
    String username =(String) request.getAttribute("username");
    session.setAttribute("username", username);

%>
<jsp:forward page="userShowall.jsp"></jsp:forward>
</body>
</html>
