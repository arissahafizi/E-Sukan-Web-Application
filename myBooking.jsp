<%@page import="java.util.ArrayList"%>
<%@page import="dao.FacilityBookingDAO"%>
<%@page import="dao.EquipmentBookingDAO"%>
<%@page import="model.FacilityBooking"%>
<%@page import="model.EquipmentBooking"%>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
    }

    int userId = (Integer) session.getAttribute("userId");

    FacilityBookingDAO facilityDao = new FacilityBookingDAO();
    EquipmentBookingDAO equipmentDao = new EquipmentBookingDAO();

    ArrayList<FacilityBooking> facilityList = facilityDao.getBookingsByUser(userId);
    ArrayList<EquipmentBooking> equipmentList = equipmentDao.getBookingsByUser(userId);
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Booking</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<h1>My Booking History</h1>

<a href="userDashboard.jsp">Back to Dashboard</a>

<hr>

<h2>Facility Bookings</h2>

<table border="1" cellpadding="10">
    <tr>
        <th>Booking ID</th>
        <th>Facility</th>
        <th>Date</th>
        <th>Time</th>
        <th>Status</th>
    </tr>

    <%
        for (FacilityBooking b : facilityList) {
    %>

    <tr>
        <td><%= b.getBookingId() %></td>
        <td><%= b.getFacilityName() %></td>
        <td><%= b.getBookingDate() %></td>
        <td><%= b.getBookingTime() %></td>
        <td><%= b.getStatus() %></td>
    </tr>

    <%
        }
    %>

</table>

<hr>

<h2>Equipment Bookings</h2>

<table border="1" cellpadding="10">
    <tr>
        <th>Rental ID</th>
        <th>Equipment</th>
        <th>Quantity</th>
        <th>Return Date</th>
        <th>Status</th>
    </tr>

    <%
        for (EquipmentBooking e : equipmentList) {
    %>

    <tr>
        <td><%= e.getRentalId() %></td>
        <td><%= e.getEquipmentName() %></td>
        <td><%= e.getQuantity() %></td>
        <td><%= e.getReturnDate() %></td>
        <td><%= e.getStatus() %></td>
    </tr>

    <%
        }
    %>

</table>

</body>
</html>