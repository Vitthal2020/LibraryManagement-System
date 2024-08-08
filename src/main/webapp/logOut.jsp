<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout</title>
   
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            background-image:url("img/login page.jpg");
            text-align: center;
            padding-top: 100px;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            width: 50%;
            margin: auto;
        }
        h2 {
            color: #333;
        }
        .btn {
            background-color: #f44336;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            font-size: 25px;
        }
        .btn:hover {
            background-color: #df2e1c;
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
        <h2>You have been logged out successfully.</h2>
        <a href="logo.jsp" class="btn">Login Again</a>
    </div>
    
    <%!
        Connection connection = null;
        Statement statement = null;
    %>
    
    <% 
     
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcURL = "jdbc:mysql://localhost:3306/library?user=root&password=Vinu@2002";
           
            
            connection = DriverManager.getConnection(jdbcURL);
            
            
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
     <div class="footer">
        <p>&copy; 2024 Your Library-Management-System. All rights reserved.</p>
        <p><a href="privacy.jsp">Privacy Policy</a> | <a href="terms.jsp">Terms of Service</a></p>
    </div>
</body>
</html>
