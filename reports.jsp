<%@page import="dao.DashboardDAO"%>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
    }

    DashboardDAO dao = new DashboardDAO();

    int totalFacilities = dao.getTotalFacilities();
    int totalEquipment = dao.getTotalEquipment();
    int totalFacilityBookings = dao.getTotalFacilityBookings();
    int totalEquipmentBookings = dao.getTotalEquipmentBookings();

    String peakUsageHour = dao.getPeakUsageHour();

    int availableEquipment = dao.getAvailableEquipmentCount();
    int damagedEquipment = dao.getDamagedEquipmentCount();
    int maintenanceEquipment = dao.getMaintenanceEquipmentCount();
%>

<!DOCTYPE html>
<html>
<head>
    <title>System Reports</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<h1>Dashboard / System Reports</h1>

<a href="adminDashboard.jsp">Back to Dashboard</a>

<hr>

<h2>System Overview</h2>

<table border="1" cellpadding="10">
    <tr>
        <th>Total Facilities</th>
        <td><%= totalFacilities %></td>
    </tr>

    <tr>
        <th>Total Equipment</th>
        <td><%= totalEquipment %></td>
    </tr>

    <tr>
        <th>Total Facility Bookings</th>
        <td><%= totalFacilityBookings %></td>
    </tr>

    <tr>
        <th>Total Equipment Bookings</th>
        <td><%= totalEquipmentBookings %></td>
    </tr>
</table>

<hr>

<h2>Peak Usage Hours</h2>

<p>Most bookings occur during:</p>

<h3><%= peakUsageHour %></h3>

<hr>

<h2>Inventory Health Report</h2>

<table border="1" cellpadding="10">
    <tr>
        <th>Equipment Status</th>
        <th>Total</th>
    </tr>

    <tr>
        <td>Available</td>
        <td><%= availableEquipment %></td>
    </tr>

    <tr>
        <td>Damaged</td>
        <td><%= damagedEquipment %></td>
    </tr>

    <tr>
        <td>In-Maintenance</td>
        <td><%= maintenanceEquipment %></td>
    </tr>
</table>

</body>
</html>