<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Return Book</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            box-sizing: border-box;
        }
        .container {
            width: 100%;
            height: 100vh;
            background-image: linear-gradient(rgba(0,0,50,0.2),rgba(0,0,50,0.2)), url('img/pu.jpg'); /* Ensure the correct path to your background image */
            background-position: center;
            background-size: cover;
            position: relative;
        }
        .form-box {
            width: 30%;
            position: absolute;
            top: 50%;
            left: 18%;
            transform: translate(-50%, -50%);
            background-color: #afadad;
            padding: 50px 60px 70px;
            text-align: center;
        }
        .form-box h1 {
            font-size: 30px;
            margin-bottom: 60px;
            color: #3c00a0;
            position: relative;
        }
        .form-box h1::after {
            content: '';
            width: 30px;
            height: 4px;
            border-radius: 3px;
            background: #3c00a0;
            position: absolute;
            bottom: -12px;
            left: 50%;
            transform: translateX(-50%);
        }
        .input-field {
            background: #eaeaea;
            margin: 15px 0;
            border-radius: 3px;
            display: flex;
            align-items: center;
            max-height: 65px;
            transition: max-height 0.2s;
        }
        input {
            width: 100%;
            font-size: 20px;
            background: transparent;
            border: 0;
            outline: 0;
            padding: 18px 15px;
            margin-left: 20px;
        }
        .btn-field {
            width: 70%;
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            margin-left: 15%;
        }
        .btn-field button {
            flex-basis: 48%;
            background: #3c00a0;
            color: #fff;
            height: 60px;
            border-radius: 40px;
            font-size: 20px;
            border: 0;
            outline: 0;
            cursor: pointer;
            transition: 0.3s;
        }
        .btn-field button:hover {
            background: #311b92;
        }
        .result-box {
            margin-top: 20px;
            color: white;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-box">
            <h1>Return Book</h1>
            <form method="post" action="Return.jsp">
                <div class="input-group">
                    <div class="input-field">
                        <input type="text" placeholder="Book ID" name="bookid" required>
                    </div>
                    <div class="input-field">
                        <input type="text" placeholder="Student ID" name="studentid" required>
                    </div>
                </div>
                <div class="btn-field">
                    <button type="submit">Return Book</button>
                    <button type="button" onclick="window.location.href='Home.jsp';">Cancel</button>
                </div>
            </form>
        </div>
        <div class="result-box">
            <%!
            Connection connection = null;
            PreparedStatement returnStatement = null;
            PreparedStatement updateStatusStatement = null;
            %>
            <%
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String bookid = request.getParameter("bookid");
                String studentid = request.getParameter("studentid");  

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/library?user=root&password=Vinu@2002");

                    // Check if the book is issued to the user
                    String returnQuery = "DELETE FROM issueBook WHERE bookid = ? AND studentid = ?";         
                    returnStatement = connection.prepareStatement(returnQuery);
                    returnStatement.setString(1, bookid);
                    returnStatement.setString(2, studentid);

                    int returnResult = returnStatement.executeUpdate();
                    if (returnResult > 0) {
                        // Update book status to 'available'
                        String updateStatusQuery = "UPDATE books SET stats = 'available' WHERE id=?";
                        updateStatusStatement = connection.prepareStatement(updateStatusQuery);
                        updateStatusStatement.setString(1, bookid);

                        int updateResult = updateStatusStatement.executeUpdate();
                        if (updateResult > 0) {
                            out.println("<h3>Book returned successfully!</h3>");
                        } else {
                            out.println("<h3>Failed to update book status.</h3>");
                        }
                    } else {
                        out.println("<h3>Failed to return book.</h3>");
                    }
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                    out.println("<h3>An error occurred: " + e.getMessage() + "</h3>");
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
