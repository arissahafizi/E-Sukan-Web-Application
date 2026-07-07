<%@page import="java.util.ArrayList"%>
<%@page import="dao.EquipmentDAO"%>
<%@page import="model.Equipment"%>

<%
    EquipmentDAO dao = new EquipmentDAO();
    ArrayList<Equipment> equipmentList = dao.getAllEquipment();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Equipment</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<h1>Manage Equipment</h1>

<a href="adminDashboard.jsp">Back to Dashboard</a>

<hr>

<h2>Add Equipment</h2>

<form action="AddEquipmentServlet" method="post">

    Equipment Name:
    <input type="text" name="equipmentName" required><br><br>

    Quantity:
    <input type="number" name="quantity" required><br><br>

    Status:
    <select name="status">
        <option value="Available">Available</option>
        <option value="Damaged">Damaged</option>
        <option value="In-Maintenance">In-Maintenance</option>
    </select><br><br>

    <button type="submit">Add Equipment</button>

</form>

<hr>

<h2>Equipment List</h2>

<table border="1" cellpadding="10">
    <tr>
        <th>ID</th>
        <th>Equipment</th>
        <th>Quantity</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

    <%
        for (Equipment e : equipmentList) {
    %>

    <tr>
        <td><%= e.getEquipmentId() %></td>
        <td><%= e.getEquipmentName() %></td>
        <td><%= e.getQuantity() %></td>
        <td><%= e.getStatus() %></td>
        <td>
            <a href="editEquipment.jsp?equipmentId=<%= e.getEquipmentId() %>">Edit</a>
            |
            <a href="DeleteEquipmentServlet?equipmentId=<%= e.getEquipmentId() %>">Delete</a>
        </td>
    </tr>

    <%
        }
    %>

</table>

</body>
</html>