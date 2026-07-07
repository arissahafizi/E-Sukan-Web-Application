<%@page import="dao.DashboardDAO"%>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int userId = (Integer) session.getAttribute("userId");

    DashboardDAO dashboardDao = new DashboardDAO();

    int totalFacilityBookings = dashboardDao.getUserFacilityBookings(userId);
    int totalEquipmentBookings = dashboardDao.getUserEquipmentBookings(userId);

    int totalBookings = totalFacilityBookings + totalEquipmentBookings;
%>

<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
</head>
<body>

<h1>Student Dashboard</h1>

<p>Welcome, <strong>${username}</strong></p>

<ul>
    <li><a href="userDashboard.jsp">Dashboard</a></li>
    <li><a href="facilities.jsp">Book Facilities</a></li>
    <li><a href="equipment.jsp">Book Equipment</a></li>
    <li><a href="myBooking.jsp">My Booking</a></li>
    <li><a href="LogoutServlet">Logout</a></li>
</ul>

<hr>

<h2>Booking Summary</h2>

<table border="1" cellpadding="10">
    <tr>
        <th>Total Bookings</th>
        <td><%= totalBookings %></td>
    </tr>

    <tr>
        <th>Facility Bookings</th>
        <td><%= totalFacilityBookings %></td>
    </tr>

    <tr>
        <th>Equipment Bookings</th>
        <td><%= totalEquipmentBookings %></td>
    </tr>
</table>

</body>
</html>