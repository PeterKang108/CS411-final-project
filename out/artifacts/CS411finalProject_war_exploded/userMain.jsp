<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">

<!-- Header -->
<%
    String username = (String) session.getAttribute("username");
%>
<header id="header">
    <h1>Hi, <%=username%>!</h1>
</header>

<!-- Signup Form -->


<form name="link_form" method="post" action="userShowPCexamples.jsp">
    New to PC?
    <input type="submit" value="See some Recommendations">
</form>
<form name="link_form" method="post" action="userShowall.jsp">
    Browse the parts,
    <input type="submit" value="Start on your own Build">
</form>
<form name="link_form" method="post" action="userhistory.jsp">
    <input type="submit" value="See History">
</form>

<!-- Footer -->
<footer id="footer">
    <ul class="icons">
        <li><a href="#" class="icon brands fa-twitter"><span class="label">We may have some icons right here</span></a></li>
    </ul>
    <ul class="copyright">
        <li>&copy; Untitled.</li><li>Credits: <a href="https://wiki.illinois.edu/wiki/display/CS411AAFA20/DataBASS">PC Assembler</a></li>
    </ul>
</footer>

<!-- Scripts -->
<script src="assets/js/userlogin.js"></script>

</body>
</html>