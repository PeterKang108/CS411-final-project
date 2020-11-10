
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>


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
<form id="signup-form" method="post" action="#">
  <input type="email" name="UserId" id="userId" placeholder="UserId" />
  <br>
  <input type="email" name="UserPassword" id="userPw" placeholder="Password" />
  <input type="submit" value="Sign In" />
</form>


<form name="link_form" method="post" action="showall.jsp">
  <input type="submit" value="show all in database">
</form>
<form name="link_form" method="post" action="queueid.jsp">
  <input type="submit" value="show information of a specfic part">
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