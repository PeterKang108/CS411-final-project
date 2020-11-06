<%--
  Created by IntelliJ IDEA.
  User: tzx72
  Date: 11/6/2020
  Time: 9:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Query a specific partID</title>
</head>
<body>
<div style="text-align:center;margin-top: 120px">
    <form action="showspecific.jsp" method="post">
        <table style="margin-left:40%">
            <tr>
                PartsID：<input type="text" name="PartsID">
            </tr>
            <tr>
                <input type="submit" value="query">
            </tr>
        </table>
    </form>
</div>
</body>
</html>
