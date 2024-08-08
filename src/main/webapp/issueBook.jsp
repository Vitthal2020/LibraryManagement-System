<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Issue Book</title>
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
            background-image: linear-gradient(rgba(0,0,50,0.2),rgba(0,0,50,0.2)), url('img/de.jpg'); /* Ensure the correct path to your background image */
            background-position: center;
            background-size: cover;
            position: relative;
        }
        .form-box {
            width: 30%;
            position: absolute;
            top: 50%;
            left: 20%;
            transform: translate(-50%, -50%);
            background-color: #665e5e;
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
     <script src="https://kit.fontawesome.com/333fad35b3.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <div class="form-box">
            <h1>Issue Book</h1>
            <form method="post">
                <div class="input-group">
                    <div class="input-field">
                  <i class="fa-sharp fa-solid fa-book-blank"></i>
                        <input type="text" placeholder="Book ID" name="bookid" required>
                    </div>
                    <div class="input-field">
                        <input type="text" placeholder="Student ID" name="studentid" required>
                    </div>
                    <div class="input-field">
                        <input type="date" placeholder="Issue Date" name="issuedate" required>
                    </div>
                    <div class="input-field">
                        <input type="date" placeholder="Due Date" name="duedate" required>
                    </div>
                     <div class="input-field">
                        <input type="text" placeholder="status" name="status" value="status" required>
                    </div>
                    <div class="input-field">
                        <input type="text" placeholder="Author" name="author" value="author" required>
                    </div>
                </div>
                <div class="btn-field">
                    <button type="submit">Issue Book</button>
                    <button type="button" onclick="window.location.href='Home.jsp';">Cancel</button>
                </div>
            </form>

            
        </div>
        
        <div class="result-box">
           <%!
                Connection connection = null;
                PreparedStatement issueStatement = null;
            %>
    
    <%  if ("POST".equalsIgnoreCase(request.getMethod())) {
                    String bookid = request.getParameter("bookid");
                    String studentid = request.getParameter("studentid");
                    String issuedate = request.getParameter("issuedate");
                    String duedate = request.getParameter("duedate");
                    String author = request.getParameter("author");
                    String status = request.getParameter("status");

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        String jdbcURL = "jdbc:mysql://localhost:3306/library";
                        String dbUser = "root";
                        String dbPassword = "Vinu@2002";
                        connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                        // Insert into issueBook table
                        String issueQuery = "INSERT INTO issueBook  VALUES (?, ?, ?, ?, ?, ?)";
                        issueStatement = connection.prepareStatement(issueQuery);
                        issueStatement.setString(1, bookid);
                        issueStatement.setString(2, studentid);
                        issueStatement.setString(3, issuedate);
                        issueStatement.setString(4, duedate);
                        issueStatement.setString(5, author);
                        issueStatement.setString(6, status);
                        int issueResult = issueStatement.executeUpdate();

                        if (issueResult > 0) {
                            out.println("<h3>Book issued successfully!</h3>");
                        } else {
                            out.println("<h3>Failed to issue book.</h3>");
                        }
                    } catch (ClassNotFoundException | SQLException e) {
                        e.printStackTrace();
                        out.println("<h3>An error occurred: " + e.getMessage() + "</h3>");
                    } finally {
                        try {
                            if (issueStatement != null) 
                            	issueStatement.close();
                            if (connection != null)
                            	connection.close();
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
