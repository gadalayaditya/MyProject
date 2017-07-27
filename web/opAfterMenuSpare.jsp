<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="database.ConnectionFactory" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="models.SparePart" %><%--
  Created by IntelliJ IDEA.
  User: gadalaya
  Date: 7/26/2017
  Time: 7:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Spareparts-Operator</title>
</head>
<body>
<%
    Connection conn = ConnectionFactory.getConnection();
    Statement stmt = conn.createStatement();
    ResultSet rs1;
    String model;int n,k;
    if (request.getParameter("asadd") != null) {
        model = request.getParameter("model");
        n = Integer.parseInt(request.getParameter("n"));
        SparePart sp = new SparePart();
      k=  sp.add_sparePartsStocks(model, n);
      if(k==1) {
          out.println("Spare Part Added");
      }
      else {
          out.println("Spare Part Adding error  try again");
      }

    }
    else if (request.getParameter("ssadd") != null) {
        model = request.getParameter("model");
        n = Integer.parseInt(request.getParameter("n"));
        SparePart sp = new SparePart();
       k= sp.sell_spareParts(model, n);
        if(k==1){
            out.println("Spare Part(s) Sold");
        }
        else {
            out.println("Spare Part(s) selling error try again");
        }

    }
    else {

        rs1 = stmt.executeQuery("select * from spareparts");
        while(rs1.next()) {
            out.println("SparePart ID : " + rs1.getInt(1) + ",  Name : " + rs1.getString(3) + ",  Units : " + rs1.getInt(6));
        }
    }
%>
</body>
</html>
