<%--
  Created by IntelliJ IDEA.
  User: gadalaya
  Date: 7/25/2017
  Time: 2:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="database.ConnectionFactory" %>
<%@page import="models.User" %>
<%@ page import="java.util.concurrent.TimeUnit" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
login
<%
    User u= new User();
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    int privilege = u.isValid(username, password);

    switch(privilege) {
        case 2 :
            TimeUnit.MILLISECONDS.sleep(1000);
            out.println("Logged in as Admin succeeded!!");
            TimeUnit.MILLISECONDS.sleep(500);
            out.println("\n---------------------Welcome Admin------------------\n");
           // adminMenu();
            response.sendRedirect("adminMenu.jsp");
            break;
        case 1 :
            TimeUnit.MILLISECONDS.sleep(1000);
            out.println("Logged in as Operator succeeded!!");
            TimeUnit.MILLISECONDS.sleep(500);
            out.println("\n---------------------Welcome Operator------------------\n");
           // operatorMenu();
            response.sendRedirect("operatorMenu.jsp");
            break;
        case -1 :
            TimeUnit.MILLISECONDS.sleep(500);
            out.println("Incorrect Credentials. Login Again......");
            TimeUnit.MILLISECONDS.sleep(500);
           // loginMenu();
            response.sendRedirect("Main.jsp");

            break;
        default :
            out.println("Oops! Try Again!");
            TimeUnit.MILLISECONDS.sleep(1000);
           // String redirectURL = "http://localhost:8080/ur file location/";
            response.sendRedirect("MainLogin.html");
            break;
    }

%>
</body>
</html>
