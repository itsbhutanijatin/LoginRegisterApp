<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    String email = (String) session.getAttribute("email");

    if (username == null || email == null) {
        response.sendRedirect("login.html");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
        .container {
            width: 350px;
            margin: 100px auto;
            padding: 20px;
            background-color: #fff;
            border: 2px solid #ccc;
            border-radius: 8px;
            box-shadow: 2px 2px 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        h2 {
            margin-bottom: 10px;
        }
        p {
            margin-bottom: 20px;
            font-size: 14px;
            color: #555;
        }
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #2e8b57;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #246b45;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome <%= username %>!</h2>
        <p>Your Email: <%= email %></p>
        <form action="logout" method="post">
            <input type="submit" value="Logout">
        </form>
    </div>
</body>
</html>
