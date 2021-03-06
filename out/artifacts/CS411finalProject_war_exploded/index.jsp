
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
<header id="header">
  <h1>PC Assembler</h1>
  <p>A simple template for your choice of most suitable PC</p>
  <p>Sign in now for better recommendations on PC Parts</p>
</header>

<!-- Signup Form -->
<%--<form id="signup-form" method="post" action="#">--%>
<%--  <input type="email" name="UserId" id="userId1" placeholder="UserId" />--%>
<%--  <br>--%>
<%--  <input type="email" name="UserPassword" id="userPw1" placeholder="Password" />--%>
<%--  <input type="submit" value="Sign Up">--%>
<%--</form>--%>

<form name="link_form" method="post" action="LoginServlet">
  <input type="text" name="username" id="userId" placeholder="UserId" />
  <br>
  <input type="password" name="password" id="userPw" placeholder="Password" />
  <br>
  <input type="submit" value="Sign In">
</form>

<%--<form name="link_form" method="post" action="userMain.jsp">--%>
<%--  <input type="submit" value="jump to userpage">--%>
<%--</form>--%>
<%--&lt;%&ndash;<form name="link_form" method="post" action="showall.jsp">&ndash;%&gt;--%>
<%--&lt;%&ndash;  <input type="submit" value="show all in database">&ndash;%&gt;--%>
</form>
<form name="link_form" method="post" action="signup.jsp">
  <input type="submit" value="Sign Up">
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
<script src="assets/js/index.js"></script>

</body>
</html>