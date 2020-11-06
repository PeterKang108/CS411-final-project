<%@ page import="DAO.PartsDAO" %>
<%@ page import="entity.Parts" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>specific query result</title>
</head>
<body>
<%
    String idStr = request.getParameter("PartsID");
    int id = Integer.valueOf(idStr);
    PartsDAO dao = new  PartsDAO();
    ArrayList<Parts> parts = dao.getPartswithid(id);
    for(int i = 0; i< ((ArrayList<?>) parts).size(); i++){
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
<%
    }
%>
<a href="/index.jsp">back</a><br>
</body>
</html>
