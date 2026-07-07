<%@page import="dao.EquipmentDAO"%>
<%@page import="model.Equipment"%>

<%
    int equipmentId = Integer.parseInt(request.getParameter("equipmentId"));

    EquipmentDAO dao = new EquipmentDAO();
    Equipment equipment = dao.getEquipmentById(equipmentId);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Equipment</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<h1>Edit Equipment</h1>

<a href="manageEquipment.jsp">Back to Manage Equipment</a>

<hr>

<form action="UpdateEquipmentServlet" method="post">

    <input type="hidden" name="equipmentId" value="<%= equipment.getEquipmentId() %>">

    Equipment Name:
    <input type="text" name="equipmentName" value="<%= equipment.getEquipmentName() %>" required><br><br>

    Quantity:
    <input type="number" name="quantity" value="<%= equipment.getQuantity() %>" required><br><br>

    Status:
    <select name="status">
        <option value="Available" <%= equipment.getStatus().equals("Available") ? "selected" : "" %>>Available</option>
        <option value="Damaged" <%= equipment.getStatus().equals("Damaged") ? "selected" : "" %>>Damaged</option>
        <option value="In-Maintenance" <%= equipment.getStatus().equals("In-Maintenance") ? "selected" : "" %>>In-Maintenance</option>
    </select><br><br>

    <button type="submit">Update Equipment</button>

</form>

</body>
</html>