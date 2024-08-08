<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create User Profile</title>
    <style>
        /* Use the CSS you provided */
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(rgba(0,0,50,0.8), rgba(0,0,50,0.8)), url('img/io.jpg');
            background-size: cover;
            background-position: center;
        }
        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }
        h1 {
            margin-bottom: 20px;
            color: #3c00a0;
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
        }
        .btn:hover {
            background-color: #311b92;
        }
        h3 {
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
    </style>
</head>
<body>
    <div class="container">
        <h1>Create User Profile</h1>
        <div class="profile-details">
            <%
                Connection connection = null;
                PreparedStatement checkIfExistsStatement = null;
                PreparedStatement insertStatement = null;
                ResultSet resultSet = null;

                // Assuming these values are passed as request parameters
                String enteredName = request.getParameter("name");
                String enteredEmail = request.getParameter("email");
                String userCourse = request.getParameter("course");
                String userBranch = request.getParameter("branch");
                String userSemester = request.getParameter("semester");

                // Retrieve signup details from session
                String signupName = (String) session.getAttribute("signupName");
                String signupEmail = (String) session.getAttribute("signupEmail");

                if (signupName != null && signupEmail != null) {
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/library?user=root&password=Vinu@2002");

                        // Check if entered details match the signup details
                        if (enteredName.equals(signupName) && enteredEmail.equals(signupEmail)) {
                            String insertQuery = "INSERT INTO user (name, email, course, branch, semester) VALUES (?, ?, ?, ?, ?)";
                            insertStatement = connection.prepareStatement(insertQuery);
                            insertStatement.setString(1, enteredName);
                            insertStatement.setString(2, enteredEmail);
                            insertStatement.setString(3, userCourse);
                            insertStatement.setString(4, userBranch);
                            insertStatement.setString(5, userSemester);
                            int rowsInserted = insertStatement.executeUpdate();

                            if (rowsInserted > 0) {
                                out.println("<h3>User profile created successfully!</h3>");
                                out.println("<p><span>Name:</span> " + enteredName + "</p>");
                                out.println("<p><span>Email:</span> " + enteredEmail + "</p>");
                                out.println("<p><span>Course:</span> " + userCourse + "</p>");
                                out.println("<p><span>Branch:</span> " + userBranch + "</p>");
                                out.println("<p><span>Semester:</span> " + userSemester + "</p>");
                            } else {
                                out.println("<h3>Error creating user profile.</h3>");
                            }
                        } else {
                            out.println("<h3>Entered details do not match with signup details.</h3>");
                        }
                    } catch (ClassNotFoundException | SQLException e) {
                        e.printStackTrace();
                        out.println("<h3>An error occurred: " + e.getMessage() + "</h3>");
                    } finally {
                        try {
                            if (resultSet != null) resultSet.close();
                            if (checkIfExistsStatement != null) checkIfExistsStatement.close();    
                            if (insertStatement != null) insertStatement.close();
                            if (connection != null) connection.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                } else {
                    out.println("<h3>No signup details found. Please sign up first.</h3>");
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
