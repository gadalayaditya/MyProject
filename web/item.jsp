<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Scanner" %>
<%@ page import="models.Vehicle" %>
<%@ page import="models.SparePart" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="database.ConnectionFactory" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="models.User" %><%--
  Created by IntelliJ IDEA.
  User: gadalaya
  Date: 7/26/2017
  Time: 10:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Items</title>
</head>
<body>
<%!
    class ItemVS{
        public  void addVehicle(JspWriter out) throws SQLException, IOException, InterruptedException {


            out.println("Enter Vehicle name");
            out.print("<input type=\"text\" id=\"vname\">");
            out.println("Enter model number");
            out.print("<input type=\"text\" id=\"vmodel\">");
            out.println("Enter brand name");
            out.print("<input type=\"text\" id=\"vbrand\">");
            out.println("Enter price of vehicle");
            out.print("<input type=\"text\" id=\"vprice\">");
            out.println("Enter units of vehicle");
            out.print("<input type=\"text\" id=\"vunits\">");
            out.println("Enter tax incurred ");
            out.print("<input type=\"text\" id=\"vtax\">");
            out.println("Enter profit incurred");
            out.print("<input type=\"text\" id=\"vprofits\">");


        }
        public  void removeVehicle(JspWriter out) throws SQLException, IOException, InterruptedException {

            out.println("Enter model number of vehicle you want to delete");
            out.print("<input type=\"text\" id=\"dvmodel\">");

        }
        public  void addSparepart(JspWriter out) throws SQLException, IOException, InterruptedException {
            out.println("Enter sparpart name");
            out.print("<input type=\"text\" id=\"sname\">");
            out.println("Enter model number");
            out.print("<input type=\"text\" id=\"smodel\">");
            out.println("Enter brand name");
            out.print("<input type=\"text\" id=\"sbrand\">");
            out.println("Enter price of sparepart");
            out.print("<input type=\"text\" id=\"sprice\">");
            out.println("Enter units of sparepart");
            out.print("<input type=\"text\" id=\"sunits\">");
            out.println("Enter sparepart's vehicle ID");
            out.print("<input type=\"text\" id=\"sid\">");
            out.println("Enter tax incurred ");
            out.print("<input type=\"text\" id=\"stax\">");

        }

    public  void removeSparepart(JspWriter out) throws SQLException, IOException, InterruptedException {

        out.println("Enter model number of sparepart you want to delete");
        out.print("<input type=\"text\" id=\"dsmodel\">");

    }
}
 %>    Vehicle v = new Vehicle();
            v.add_vehicle(model,name,brand,price,units,tax,profit);

     v.remove_vehicle(dvmodel);


            SparePart sp = new SparePart();
            sp.add_sparepart(smodel,sname,sbrand,sprice,sunits,vehicle_id,stax);


            sp.remove_sparepart(dsmodel);






<%
    ItemVS obj = new ItemVS();
    if (request.getParameter("vehicle") != null) {


%>
<form action="Vfteritem.jsp"></form>
    <input type="submit" onclick="obj.addVehicle(out)" value="addVehicle">
    <input type="submit" onclick="obj.removeVehicle(out)" value="removeVehicle">


<form action="adminMenu.jsp">
    <input type="submit"  value="back">
</form>>

<form action="logout.jsp">
    <input type="submit"  value="logout">
</form>
<%
    }

    else if (request.getParameter("spareparts") != null) {


%>

<input type="submit" onsubmit="obj.addsparepart(out)" value="addSparepart">
<input type="submit" onsubmit="obj.removesparepart(out)" value="removeSparepart">
<form action="adminMenu.jsp">
<input type="submit"  value="back">
</form>>

<form action="logout.jsp">
<input type="submit"  value="logout">
</form>
<%
    }
%>

</body>
</html>
