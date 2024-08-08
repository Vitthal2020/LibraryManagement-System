<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Find Book Status</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(rgba(0,0,50,0.2), rgba(0,0,50,0.2)), url('img/tg.jpg');
            background-size: cover;
            background-position: center;
        }
        .container {
            background-color: #afadad;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 600px;
            text-align: center;
            
        }
        h1 {
            margin-bottom: 20px;
            color: #3c00a0;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        input[type="submit"] {
            background-color: #3c00a0;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 25px;
        }
        .result-box {
            margin-top: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f0f0f0;
        }
        .footer {
            background-color: #3c00a0;
            color: #fff;
            text-align: center;
            
            position: fixed;
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
    </style>
</head>
<body>
    <div class="container">
        <h1>Find Book Status</h1>
        <form method="post">
            <label for="bookId">Enter Book ID:</label>
            <input type="text" id="bookId" name="bookId" required>
            <input type="submit" value="Find Status">
        </form>
        <div class="result-box">
            <%!
                Connection connection = null;
                PreparedStatement preparedStatement = null;
                ResultSet resultSet = null;
            %>
            <%
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    String bookId = request.getParameter("bookId");

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/library?user=root&password=Vinu@2002");

                        String selectQuery = "SELECT * FROM issueBook WHERE bookId = ? AND status = 'issued'";
                        preparedStatement = connection.prepareStatement(selectQuery);
                        preparedStatement.setString(1, bookId);
                        resultSet = preparedStatement.executeQuery();

                        if (resultSet.next()) {
                            out.println("<h3>Book ID: " + bookId + "</h3>");
                            out.println("<h3>author: " + resultSet.getString("author") + "</h3>");
                            out.println("<h3>Status: Issued</h3>");
                            out.println("<h3>Student ID: " + resultSet.getString("studentId") + "</h3>");
                            
                            out.println("<h3>Issue Date: " + resultSet.getString("issuedate") + "</h3>");
                            out.println("<h3>Due Date: " + resultSet.getString("duedate") + "</h3>");
                        } else {
                            out.println("<h3>Book ID: " + bookId + "</h3>");
                            
                            out.println("<h3>Status: Available (Not Issued)</h3>");
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
                }
            %>
        </div>
    </div>
    <div class="footer">
        <p>&copy; 2024 Your Library-Management-System. All rights reserved.</p>
        <p><a href="privacy.jsp">Privacy Policy</a> | <a href="terms.jsp">Terms of Service</a></p>
    </div>
</body>
</html>
