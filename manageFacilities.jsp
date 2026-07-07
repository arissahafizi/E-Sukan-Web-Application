<%@page import="java.util.ArrayList"%>
<%@page import="dao.FacilityDAO"%>
<%@page import="model.Facility"%>

<%
    FacilityDAO dao = new FacilityDAO();
    ArrayList<Facility> facilityList = dao.getAllFacilities();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Facilities</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<h1>Manage Facilities</h1>

<a href="adminDashboard.jsp">Back to Dashboard</a>

<hr>

<h2>Add New Facility</h2>

<form action="AddFacilityServlet" method="post">

    Facility Name:
    <input type="text" name="facilityName" required><br><br>

    Location:
    <input type="text" name="location" required><br><br>

    Capacity:
    <input type="number" name="capacity" required><br><br>

    Status:
    <select name="status">
        <option value="Available">Available</option>
        <option value="Unavailable">Unavailable</option>
        <option value="Maintenance">Maintenance</option>
    </select><br><br>

    <button type="submit">Add Facility</button>

</form>

<hr>

<h2>Facility List</h2>

<table border="1" cellpadding="10">
    <tr>
        <th>ID</th>
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
        <td><%= f.getFacilityId() %></td>
        <td><%= f.getFacilityName() %></td>
        <td><%= f.getLocation() %></td>
        <td><%= f.getCapacity() %></td>
        <td><%= f.getStatus() %></td>
        <td>
            <a href="editFacility.jsp?facilityId=<%= f.getFacilityId() %>">Edit</a>
            <a href="DeleteFacilityServlet?facilityId=<%= f.getFacilityId() %>">Delete</a>
        </td>
    </tr>

    <%
        }
    %>

</table>

</body>
</html>