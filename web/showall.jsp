
<%@ page import="entity.Parts" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.PartsDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Showall$</title>
</head>
<body>
<tr>
    <td>PartsID</td>
    <td>ratings</td>
    <td>price</td>
    <td>brand</td>
    <td>partsName</td>
    <td>type</td>
    <td>delete</td>
    <td>update</td>

<%--    <td><a href="DeleteServlet?id=<%=part.getPartsID() %>">delete</a>|<a href="updatePrice.jsp?id=<%=part.getPartsName() %>">update price</a></td>--%>
</tr>
<br>
<%
    PartsDAO dao = new  PartsDAO();
    ArrayList<Parts> parts = dao.getAllParts();
    for(int i = 0;i<parts.size();i++){
        Parts part = parts.get(i);
%>

<tr>
    <td><%=part.getPartsID() %></td>
    <td><%=part.getRatings()%></td>
    <td><%=part.getPrice()%></td>
    <td><%=part.getBrand()%></td>
    <td><%=part.getPartsName()%></td>
    <td><%=part.getType()%></td>

    <td><a href="DeleteServlet?id=<%=part.getPartsID() %>">delete</a>|<a href="updatePrice.jsp?id=<%=part.getPartsID() %>">update price</a></td>
</tr>
<br>
<%
    }
%><br><br>
<a href="${pageContext.request.contextPath}/insertnew.jsp">insert</a><br>
<a href="${pageContext.request.contextPath}/index.jsp">back</a><br>
</body>
</html>
