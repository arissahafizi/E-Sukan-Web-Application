<%@page import="dao.FacilityDAO"%>
<%@page import="model.Facility"%>

<%
    int facilityId = Integer.parseInt(request.getParameter("facilityId"));

    FacilityDAO dao = new FacilityDAO();
    Facility facility = dao.getFacilityById(facilityId);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Facility</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<h1>Edit Facility</h1>

<a href="manageFacilities.jsp">Back to Manage Facilities</a>

<hr>

<form action="UpdateFacilityServlet" method="post">

    <input type="hidden" name="facilityId" value="<%= facility.getFacilityId() %>">

    Facility Name:
    <input type="text" name="facilityName" value="<%= facility.getFacilityName() %>" required><br><br>

    Location:
    <input type="text" name="location" value="<%= facility.getLocation() %>" required><br><br>

    Capacity:
    <input type="number" name="capacity" value="<%= facility.getCapacity() %>" required><br><br>

    Status:
    <select name="status">
        <option value="Available" <%= facility.getStatus().equals("Available") ? "selected" : "" %>>Available</option>
        <option value="Unavailable" <%= facility.getStatus().equals("Unavailable") ? "selected" : "" %>>Unavailable</option>
        <option value="Maintenance" <%= facility.getStatus().equals("Maintenance") ? "selected" : "" %>>Maintenance</option>
    </select><br><br>

    <button type="submit">Update Facility</button>

</form>

</body>
</html>