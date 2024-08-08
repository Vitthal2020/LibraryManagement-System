<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(rgba(0,0,50,0.8), rgba(0,0,50,0.8)), url('img/book.jpg');
            background-size: cover;
            background-position: center;
        }
        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: left;
        }
        h1 {
            margin-bottom: 20px;
            color: #3c00a0;
            text-align: center;
        }
        .profile-details p {
            font-size: 18px;
            margin: 10px 0;
            color: #333;
        }
        .profile-details p span {
            font-weight: bold;
        }
        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 18px;
            color: #fff;
            background-color: #3c00a0;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
        }
        .btn:hover {
            background-color: #311b92;
        }
        .error-message, .success-message {
            color: red;
            font-size: 18px;
            text-align: center;
            margin-top: 20px;
        }
        .success-message {
            color: green;
        }
        
         .footer {
            background-color: #3c00a0;
            color: #fff;
            text-align: center;
            padding: 20px 0;
            position: absolute;
            bottom: 0;
            width: 100%;
        }
        .footer a {
            color: #fff;
            text-decoration: none;
            margin: 0 10px;
        }
        .footer a:hover {
            text-decoration: underline;
        }
        .footer p {
            margin: 5px 0;
        }
       
        .div{
       
        font-size: 20px;
        color:
        }
        .div1{
        margin-right: 5%;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>User Profile</h1>
        <div class="profile-details">
            <%!
                Connection connection = null;
                PreparedStatement preparedStatement = null;
                ResultSet resultSet = null;
            %>
            <%
                String userId = request.getParameter("id");
                boolean userExists = false;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/library?user=root&password=Vinu@2002");

                    // Check if user exists
                    String selectQuery = "SELECT * FROM user WHERE id = ?";
                    preparedStatement = connection.prepareStatement(selectQuery);
                    preparedStatement.setString(1, userId);
                    resultSet = preparedStatement.executeQuery();

                    if (resultSet.next()) {
                        userExists = true;
                        out.println("<p><span>ID:</span> " + resultSet.getString("id") + "</p>");
                        out.println("<p><span>Name:</span> " + resultSet.getString("name") + "</p>");
                        out.println("<p><span>Course:</span> " + resultSet.getString("course") + "</p>");
                        out.println("<p><span>Branch:</span> " + resultSet.getString("branch") + "</p>");
                        out.println("<p><span>Semester:</span> " + resultSet.getString("semester") + "</p>");
                    } else {
                        out.println("<div class='error-message'>User not found.</div>");
                    }
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                    out.println("<h3>An error occurred: " + e.getMessage() + "</h3>");
                } finally {
                    try {
                        if (resultSet != null) resultSet.close();
                        if (preparedStatement != null) preparedStatement.close();
                        if (connection != null) connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </div>
        <a href="Home.jsp" class="btn">Back to Home</a>
    </div>

 <div class="footer">
        <p>&copy; 2024 Your Library-Management-System. All rights reserved.</p>
        <p><a href="privacy.jsp">Privacy Policy</a> | <a href="terms.jsp">Terms of Service</a></p>
    </div>
    </body>
</html>
