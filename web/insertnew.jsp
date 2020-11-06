<%--
  Created by IntelliJ IDEA.
  User: tzx72
  Date: 11/6/2020
  Time: 9:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Insert</title>
</head>
<body>
<div style="text-align:center;margin-top: 120px">
    <form action="InsertServlet" method="post">
        <table style="margin-left:40%">
            <tr>
                PartsID：<input type="text" name="PartsID">
            </tr>
            <tr>
                ratings：<input type="text" name="ratings">
            </tr>
            <tr>
                price：<input type="text" name="price">
            </tr>
            <tr>
                brand：<input type="text" name="brand">
            </tr>
            <tr>
                partsName：<input type="text" name="partsName">
            </tr>
            <tr>
                type：<input type="text" name="type">
            </tr>
            <tr>
                <input type="submit" value="insert">
            </tr>
        </table>
    </form>
</div>
</body>
</html>
