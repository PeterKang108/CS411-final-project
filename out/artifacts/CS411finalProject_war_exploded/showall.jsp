
<%@ page import="entity.Parts" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.PartsDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Showall$</title>
</head>
<body>
    <table class="ui celled table">
        <thead>
        <tr><th>PartsID</th>
            <th>ratings</th>
            <th>price</th>
            <th>brand</th>
            <th>partsName</th>
            <th>type</th>
            <th>delete</th>
            <th>update</th>
        </tr></thead>
        <tbody>
        <%
            PartsDAO dao = new  PartsDAO();
            ArrayList<Parts> parts = dao.getAllParts();
            for(int i = 0;i<parts.size();i++){
                Parts part = parts.get(i);
        %>
        <tr>
            <td data-label="PartsID"><%=part.getPartsID() %></td>
            <td data-label="ratings"><%=part.getRatings()%></td>
            <td data-label="price"><%=part.getPrice()%></td>
            <td data-label="brand"><%=part.getBrand()%></td>
            <td data-label="partsName"><%=part.getPartsName()%></td>
            <td data-label="type"><%=part.getType()%></td>
            <td><a href="DeleteServlet?id=<%=part.getPartsID() %>">delete</a></td>
            <td><a href="updatePrice.jsp?id=<%=part.getPartsID() %>">update price</a></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>


<a href="${pageContext.request.contextPath}/insertnew.jsp">insert</a><br>
<a href="${pageContext.request.contextPath}/index.jsp">back</a><br>
</body>
</html>
