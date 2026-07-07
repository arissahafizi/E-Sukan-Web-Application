<%@page import="java.util.ArrayList"%>
<%@page import="dao.FacilityDAO"%>
<%@page import="model.Facility"%>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
    }

    FacilityDAO dao = new FacilityDAO();
    ArrayList<Facility> facilityList = dao.getAllFacilities();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Book Facilities</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<h1>Book Sport Facilities</h1>

<a href="userDashboard.jsp">Back to Dashboard</a>

<hr>

<table border="1" cellpadding="10">
    <tr>
        <th>Facility</th>
        <th>Location</th>
        <th>Capacity</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

    <%
        for (Facility f : facilityList) {
    %>

    <tr>
        <td><%= f.getFacilityName() %></td>
        <td><%= f.getLocation() %></td>
        <td><%= f.getCapacity() %></td>
        <td><%= f.getStatus() %></td>
        <td>
            <% if (f.getStatus().equalsIgnoreCase("Available")) { %>
                <a href="facilityBooking.jsp?facilityId=<%= f.getFacilityId() %>">Book Now</a>
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