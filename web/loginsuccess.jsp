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
<%--<input type="text" name="haha" id="haha" placeholder=<%session.getAttribute("username");%> />--%>
<%--<input type="text" name="haha" id="haha" placeholder="<%=test%>"/>--%>
<%--<input type="text" name="haha" id="haha" placeholder=<%user.getPassword();%> />--%>
<jsp:forward page="userMain.jsp"></jsp:forward>
</body>
</html>
