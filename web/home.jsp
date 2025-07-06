<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("username");
    String email = (String) session.getAttribute("email");
    String idStr = (String) session.getAttribute("id");

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
            width: 400px;
            margin: 100px auto;
            padding: 20px;
            background-color: #fff;
            border: 2px solid #ccc;
            border-radius: 8px;
            box-shadow: 2px 2px 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        h2 {
            margin-bottom: 20px;
        }
        table {
            margin: 0 auto 20px;
            border-collapse: collapse;
            width: 100%;
        }
        table, th, td {
            border: 1px solid #aaa;
        }
        th, td {
            padding: 8px;
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
        <table>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Email</th>
            </tr>
            <tr>
                <td><%= idStr != null ? idStr : "N/A" %></td>
                <td><%= username %></td>
                <td><%= email %></td>
            </tr>
        </table>
        <form action="logout" method="post">
            <input type="submit" value="Logout">
        </form>
    </div>
</body>
</html>
