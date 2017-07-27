<%--
  Created by IntelliJ IDEA.
  User: gadalaya
  Date: 7/26/2017
  Time: 4:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.User"%>
<%@ page errorPage="exception.jsp" %>
<%@ page import=" database.ConnectionFactory"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<html>
<head>
    <title>Logout</title>
</head>
<body>
<%

    String sql = "insert into logs(username, time, description) values(?, ?, ?)";
    Connection con =ConnectionFactory.getConnection();
    PreparedStatement st = con.prepareStatement(sql);

    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    Calendar cal = Calendar.getInstance();
    String dd = dateFormat.format(cal.getTime());
    User u = new User();
    String user_name = u.getUsername();

    st.setString(1, user_name);
    st.setString(2, dd);
    st.setString(3, "logout");

    int i = st.executeUpdate();

    if(i == 1) {
    out.println("Logged out successfully!");
    u.logoutUpdate();
    out.print("<a href=\"MainLogin.html\">MainLogin</a>");
    }
    else
    out.println("Try Again");


%>

</body>
</html>
