<%@page import="java.util.ArrayList"%>
<%@page import="dao.EquipmentDAO"%>
<%@page import="model.Equipment"%>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
    }

    EquipmentDAO dao = new EquipmentDAO();
    ArrayList<Equipment> equipmentList = dao.getAllEquipment();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Book Equipment</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<h1>Book Sports Equipment</h1>

<a href="userDashboard.jsp">Back to Dashboard</a>

<hr>

<table border="1" cellpadding="10">
    <tr>
        <th>Equipment</th>
        <th>Quantity</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

    <%
        for (Equipment e : equipmentList) {
    %>

    <tr>
        <td><%= e.getEquipmentName() %></td>
        <td><%= e.getQuantity() %></td>
        <td><%= e.getStatus() %></td>
        <td>
            <% if (e.getStatus().equalsIgnoreCase("Available") && e.getQuantity() > 0) { %>
                <a href="equipmentBooking.jsp?equipmentId=<%= e.getEquipmentId() %>">Rent</a>
            <% } else { %>
                Unavailable
            <% } %>
        </td>
    </tr>

    <%
        }
    %>

</table>

</body>
</html>