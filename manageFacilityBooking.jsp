<%@page import="java.util.ArrayList"%>
<%@page import="dao.FacilityBookingDAO"%>
<%@page import="model.FacilityBooking"%>

<%
    FacilityBookingDAO dao = new FacilityBookingDAO();
    ArrayList<FacilityBooking> bookingList = dao.getAllBookings();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Facility Bookings</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<h1>Manage Facility Bookings</h1>

<a href="adminDashboard.jsp">Back to Dashboard</a>

<hr>

<table border="1" cellpadding="10">
    <tr>
        <th>Booking ID</th>
        <th>User ID</th>
        <th>Facility</th>
        <th>Date</th>
        <th>Time</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

    <%
        for (FacilityBooking b : bookingList) {
    %>

    <tr>
        <td><%= b.getBookingId() %></td>
        <td><%= b.getUserId() %></td>
        <td><%= b.getFacilityName() %></td>
        <td><%= b.getBookingDate() %></td>
        <td><%= b.getBookingTime() %></td>
        <td><%= b.getStatus() %></td>
        <td>
            <a href="UpdateFacilityBookingStatusServlet?bookingId=<%= b.getBookingId() %>&status=Approved">Approve</a>
            <a href="UpdateFacilityBookingStatusServlet?bookingId=<%= b.getBookingId() %>&status=Rejected">Reject</a>
        </td>
    </tr>

    <%
        }
    %>

</table>

</body>
</html>