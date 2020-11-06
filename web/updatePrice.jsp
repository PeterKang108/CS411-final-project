<%--
  Created by IntelliJ IDEA.
  User: tzx72
  Date: 11/6/2020
  Time: 10:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String temp = request.getParameter("id");
System.out.print(temp);%>
<html>
<head>
    <title>update price</title>
</head>
<body>
<div style="text-align:center;margin-top: 120px">
    <form action="UpdatePriceServlet?id=<%=temp%>"; method="post">
        <table style="margin-left:40%">
            <tr>
                Price：<input type="text" name="price">
            </tr>
            <tr>
                <input type="submit" value="update">
            </tr>
        </table>
    </form>
</div>
</body>
</html>
