<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Messages</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
          
            margin: 0;
            padding: 0;
            background: #decece;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }
        .container {
            
            padding: 30px ;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 40%;
           margin-right:30%;
            text-align: center;
        }
        h1 {
            
            color: #3c00a0;
        }
        .message-list {
            margin-top: 20%;
        }
        .message {
            background-color:#3c00a0 ;
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: left;
        }
        .message p {
            font-size: 16px;
            color: #fff;
            margin: 10px 0;
        }
        .message p strong {
            font-weight: bold;
        }
        .btn {
            display: inline-block;
            margin-bottom: 20px;
            padding: 10px ;
            font-size: 20px;
            color: #fff;
            background-color: #3c00a0;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        .btn:hover {
            background-color: #311b92;
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
        <h1>View Messages</h1>
        <div class="message-list">
            <% 
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String jdbcURL = "jdbc:mysql://localhost:3306/library?user=root&password=Vinu@2002";
                    conn = DriverManager.getConnection(jdbcURL);

                   
                    String name = request.getParameter("name");
                    String email = request.getParameter("email");
                    String message = request.getParameter("message");

                    if (name != null && email != null && message != null) {
                        String insertQuery = "INSERT INTO message (name, email, message) VALUES (?, ?, ?)";
                        stmt = conn.prepareStatement(insertQuery);
                        stmt.setString(1, name);
                        stmt.setString(2, email);
                        stmt.setString(3, message);
                        stmt.executeUpdate();
                    }

                    // Retrieve and display all messages from database
                    String selectQuery = "SELECT * FROM message";
                    stmt = conn.prepareStatement(selectQuery);
                    rs = stmt.executeQuery();

                    while (rs.next()) {
                        String msgName = rs.getString("name");
                        String msgEmail = rs.getString("email");
                        String msgContent = rs.getString("message");

                        out.println("<div class='message'>");
                        out.println("<p><strong>Name:</strong> " + msgName + "</p>");
                        out.println("<p><strong>Email:</strong> " + msgEmail + "</p>");
                        out.println("<p><strong>Message:</strong> " + msgContent + "</p>");
                        out.println("</div>");
                    }

                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                    out.println("<p>An error occurred while saving or fetching messages.</p>");
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </div>
        <a href="contact.jsp" class="btn">Back to Contact page</a>
    </div>

 <div class="footer">
        <p>&copy; 2024 Your Library-Management-System. All rights reserved.</p>
        <p><a href="privacy.jsp">Privacy Policy</a> | <a href="terms.jsp">Terms of Service</a></p>
    </div>
    </body>
</html>
