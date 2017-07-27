<%--
  Created by IntelliJ IDEA.
  User: gadalaya
  Date: 7/26/2017
  Time: 1:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>operatorMenu</title>
</head>
<body>
1. Add Stock:<br>
a.Vehicle:<br>
<form action="opAfterMenuVehicle.jsp">
Enter the Vehicle Model Number :<input type="text" name="model" id="avmodel">
Enter the no. of units to be added:<input type="text" name="n" id="avn">

    <input type="submit" name="avadd" id="avadd">
</form>
b.Spareparts:<br>
<form action="opAfterMenuSpare.jsp">
Enter the SparePart Model Number :<input type="text" name="model" id="asmodel">
    Enter the no. of units to be added :<input type="text" name="n" id="asn">
    <input type="submit" name="asadd" id="asadd">
</form>



2. Sell
a.Vehicle:<br>
<form action="opAfterMenuVehicle.jsp">
    Enter the Vehicle Model Number :<input type="text" name="model" id="svmodel">
    Enter the no. of units to be sold:<input type="text" name="n" id="svn">

    <input type="submit" name="svadd" id="svadd">
</form>
b.Spareparts:<br>
<form action="opAfterMenuSpare.jsp">
    Enter the SparePart Model Number :<input type="text" name="model" id="ssmodel">
    Enter the no. of units to be sold :<input type="text" name="n" id="ssn">
    <input type="submit" name="ssadd" id="ssadd">
</form>
3. Display Stock
<form action="opAfterMenuVehicle.jsp">
<input type="submit" name="dvehicle" id="dvehicle" value="vehicle"><br>
</form>
<form action="opAfterMenuSpare.jsp">
    <input type="submit" name="dspareparts" id="dspareparts" value="spareparts"><br>
</form>

<form action="logout.jsp">
4. Logout<<br>
    <input type="submit"  name="logout"  value="logout"> <br>
</form>
</body>
</html>
