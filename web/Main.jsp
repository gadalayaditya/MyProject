<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.IOException" %><%--
  Created by IntelliJ IDEA.
  User: gadalaya
  Date: 7/25/2017
  Time: 11:46 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="exception.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    public void loginMenu(JspWriter out)  throws SQLException,IOException
    {

            out.print("<br>Username : &nbsp;");
            out.println("<form action=\"loginMenu.jsp\"><input type=\"text\" id=\"username\"  name=\"username\">");
        out.print("<br>Password : ");
        out.println("<input type=\"password\" id=\"password\" name=\"password\"><br>" );
        out.print("<input type='submit'></form>");




    }
    public void viewMenu(JspWriter out) throws SQLException,IOException {
        out.print("<br>1. View Vehicles<br>2. View Spare Parts<br>3. Back to main menu\tSelect any option :<br> ");
        out.println("<form action='viewMenu.jsp'.jsp'><input type=\"text\" id=\"view\"><br>");
        out.print("<input type='submit'></form>");

    }

%>
<%
    if (request.getParameter("action2") != null) {
        viewMenu(out);

    }
    else
    {
        loginMenu(out);
    }
%>
</body>
</html>
