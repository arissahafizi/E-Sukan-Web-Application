<%@page import="dao.FacilityDAO"%>
<%@page import="model.Facility"%>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
    }

    int facilityId = Integer.parseInt(request.getParameter("facilityId"));

    FacilityDAO dao = new FacilityDAO();
    Facility facility = dao.getFacilityById(facilityId);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Facility Booking</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<h1>Facility Booking</h1>

<a href="facilities.jsp">Back to Facilities</a>

<hr>

<form action="AddFacilityBookingServlet" method="post">

    <input type="hidden" name="facilityId" value="<%= facility.getFacilityId() %>">

    Facility:
    <input type="text" value="<%= facility.getFacilityName() %>" readonly><br><br>

    Date:
    <input type="date" name="bookingDate" required><br><br>

    Time Slot:
    <select name="bookingTime" required>
        <option value="8 AM - 10 AM">8 AM - 10 AM</option>
        <option value="10 AM - 12 PM">10 AM - 12 PM</option>
        <option value="2 PM - 4 PM">2 PM - 4 PM</option>
        <option value="4 PM - 6 PM">4 PM - 6 PM</option>
        <option value="6 PM - 8 PM">6 PM - 8 PM</option>
        <option value="8 PM - 10 PM">8 PM - 10 PM</option>
    </select><br><br>

    <button type="submit">Submit Booking</button>

</form>

</body>
</html>