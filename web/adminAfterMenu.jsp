<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="database.ConnectionFactory" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.io.IOException" %>
<%@ page import="models.users.Admin" %>
<%@ page import="java.util.concurrent.TimeUnit" %><%--
  Created by IntelliJ IDEA.
  User: gadalaya
  Date: 7/26/2017
  Time: 10:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="exception.jsp" %>
<html>
<head>
    <title>AdminOperator</title>
</head>
<body>
<%


        Admin a = new Admin();
        if (request.getParameter("register") != null) {
            String user_name = request.getParameter("user_name");
            String password = request.getParameter("password");
            int val = a.add_operator(user_name, password);
            if (val == 0) {
                out.print("unsuccessfull");



            } else {
                out.print("successfull");
            }

        } else if (request.getParameter("terminate") != null) {

            String user_name = request.getParameter("username");
            int val = a.remove_operator(user_name);
            if (val == 0) {
                out.print("unsuccessfull");



            } else {
                out.print("successfull");
            }

        }


%>
<a href="adminMenu.jsp">adminMenu</a>
</body>
</html>
