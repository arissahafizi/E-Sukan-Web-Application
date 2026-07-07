<%@page import="dao.EquipmentDAO"%>
<%@page import="model.Equipment"%>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
    }

    int equipmentId = Integer.parseInt(request.getParameter("equipmentId"));

    EquipmentDAO dao = new EquipmentDAO();
    Equipment equipment = dao.getEquipmentById(equipmentId);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Equipment Booking</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<h1>Equipment Booking</h1>

<a href="equipment.jsp">Back to Equipment</a>

<hr>

<form action="AddEquipmentBookingServlet" method="post">

    <input type="hidden" name="equipmentId" value="<%= equipment.getEquipmentId() %>">

    Equipment:
    <input type="text" value="<%= equipment.getEquipmentName() %>" readonly><br><br>

    Quantity:
    <input type="number" name="quantity" min="1" max="<%= equipment.getQuantity() %>" required><br><br>

    Return Date:
    <input type="date" name="returnDate" required><br><br>

    <button type="submit">Submit Rental</button>

</form>

</body>
</html>