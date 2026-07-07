<%@page import="java.util.ArrayList"%>
<%@page import="dao.EquipmentBookingDAO"%>
<%@page import="model.EquipmentBooking"%>

<%
    EquipmentBookingDAO dao = new EquipmentBookingDAO();
    ArrayList<EquipmentBooking> bookingList = dao.getAllBookings();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Equipment Bookings</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<h1>Manage Equipment Bookings</h1>

<a href="adminDashboard.jsp">Back to Dashboard</a>

<hr>

<table border="1" cellpadding="10">
    <tr>
        <th>Rental ID</th>
        <th>User ID</th>
        <th>Equipment</th>
        <th>Quantity</th>
        <th>Return Date</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

    <%
        for (EquipmentBooking b : bookingList) {
    %>

    <tr>
        <td><%= b.getRentalId() %></td>
        <td><%= b.getUserId() %></td>
        <td><%= b.getEquipmentName() %></td>
        <td><%= b.getQuantity() %></td>
        <td><%= b.getReturnDate() %></td>
        <td><%= b.getStatus() %></td>
        <td>
            <a href="UpdateEquipmentBookingStatusServlet?rentalId=<%= b.getRentalId() %>&status=Approved">Approve</a>
            |
            <a href="UpdateEquipmentBookingStatusServlet?rentalId=<%= b.getRentalId() %>&status=Rejected">Reject</a>
            |
            <a href="UpdateEquipmentBookingStatusServlet?rentalId=<%= b.getRentalId() %>&status=Returned">Returned</a>
        </td>
    </tr>

    <%
        }
    %>

</table>

</body>
</html>