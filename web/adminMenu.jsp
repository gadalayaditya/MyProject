<%--
  Created by IntelliJ IDEA.
  User: gadalaya
  Date: 7/26/2017
  Time: 9:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>adminMenu</title>
</head>
<body>
<form action="adminAfterMenu.jsp" method="get">
    1. Register Operator<br>
    Enter user name:<input type="text" id="user_name" name="user_name" ><br>
    Enter password:<input type="text" id="password" name="password"><br>
  &nbsp;
    <input type="submit" name="register" id="register">
    </form><br>
<form action="adminAfterMenu.jsp">
2. Terminate Operator<br>
    Enter user name you want to delete:<input type="text" id="username" name="username"><br>
    <input type="submit" id="terminate" name="terminate">
</form><br>
<form action="item.jsp">
    3. Stock
    <input type="submit"  name="vehicle"  value="vehicle"><br>
    <input type="submit"  name="spareparts"  value="spareparts">
</form>
<form action="logout.jsp">
    <br>4. Logout
    <input type="submit"  name="logout"  value="logout"> <br>
</form>



</body>
</html>
