<!DOCTYPE html>
<html>
<head>
    <title>E-Sukan Register</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<h1>Register Page</h1>

<form action="RegisterServlet" method="post">

    Name:
    <input type="text" name="name" required><br><br>

    Email:
    <input type="email" name="email" required><br><br>

    Username:
    <input type="text" name="username" required><br><br>

    Password:
    <input type="password" name="password" required><br><br>

    Confirm Password:
    <input type="password" name="confirmPassword" required><br><br>

    Role:
    <select name="role">
        <option value="student">Student</option>
        <option value="admin">Facility Manager</option>
    </select><br><br>

    <button type="submit">Register</button>

</form>

<p>Already have an account? <a href="login.jsp">Login</a></p>

<p style="color:red;">${errorMessage}</p>

</body>
</html>