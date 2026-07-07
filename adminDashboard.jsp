<%@page import="dao.DashboardDAO"%>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String role = (String) session.getAttribute("role");

    if (!"admin".equalsIgnoreCase(role)) {
        response.sendRedirect("userDashboard.jsp");
        return;
    }

    DashboardDAO dashboardDao = new DashboardDAO();

    int totalFacilities = dashboardDao.getTotalFacilities();
    int totalEquipment = dashboardDao.getTotalEquipment();
    int totalFacilityBookings = dashboardDao.getTotalFacilityBookings();
    int totalEquipmentBookings = dashboardDao.getTotalEquipmentBookings();
    String peakUsageHour = dashboardDao.getPeakUsageHour();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<h1>Facility Manager Dashboard</h1>

<p>Welcome, ${username}</p>

<ul>
    <li><a href="manageFacilities.jsp">Manage Facilities</a></li>
    <li><a href="manageEquipment.jsp">Manage Equipment</a></li>
    <li><a href="manageFacilityBooking.jsp">Manage Facility Bookings</a></li>
    <li><a href="manageEquipmentBooking.jsp">Manage Equipment Bookings</a></li>
    <li><a href="reports.jsp">Reports</a></li>
    <li><a href="LogoutServlet">Logout</a></li>
</ul>

<hr>

<h2>System Summary</h2>

<p>Total Facilities: <%= totalFacilities %></p>
<p>Total Equipment: <%= totalEquipment %></p>
<p>Total Facility Bookings: <%= totalFacilityBookings %></p>
<p>Total Equipment Bookings: <%= totalEquipmentBookings %></p>
<p>Peak Usage Hours: <%= peakUsageHour %></p>

</body>
</html>