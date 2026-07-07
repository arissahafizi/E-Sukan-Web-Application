<!DOCTYPE html>
<html>
<head>
    <title>E-Sukan Login</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<h1>E-Sukan Login</h1>

<form action="LoginServlet" method="post">

    Username:
    <input type="text" name="username" required><br><br>

    Password:
    <input type="password" name="password" required><br><br>

    <button type="submit">Login</button>

</form>

<p>Don't have an account? <a href="register.jsp">Register</a></p>

<p style="color:red;">${errorMessage}</p>

</body>
</html>