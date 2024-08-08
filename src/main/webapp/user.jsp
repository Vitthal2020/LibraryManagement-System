<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add User</title>
    <script src="https://kit.fontawesome.com/333fad35b3.js" crossorigin="anonymous"></script>
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
            background-image: linear-gradient(rgba(0,0,50,0.5),rgba(0,0,50,0.5)), url('img/oi.jpg');
            background-position: center;
            background-size: cover;
            position: relative;
        }
        .form-box {
            width: 30%;
            position: absolute;
            top: 50%;
            left: 30%;
            transform: translate(-50%, -50%);
          background-color:#cbbcbc;
            padding: 50px 20px 70px;
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
        .input-field i {
            margin-left: 20px;
            color: #999;
            font-size: 30px;
        }
        form p {
            text-align: left;
            font-size: 20px;
        }
        form p a {
            text-decoration: none;
            color: #3c00a0;
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
        .result-box{
        margin-left: 15%;
        font-size: 30px;
        color: white;
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
        <div class="form-box">
            <h1>Add User</h1>
            <form method="post" action="ufinduser.jsp">
                <div class="input-group">
                    <div class="input-field">
                    <i class="fa-solid fa-id-badge"></i>
                        <input type="text" placeholder="ID" name="id" required>
                    </div>
                    <div class="input-field">
                      <i class="fa-solid fa-user"></i>
                        <input type="text" placeholder="Name" name="name">
                    </div>
                    <div class="input-field">
                        <i class="fa-solid fa-envelope"></i>
                        <input type="email" placeholder="Email" name="email" required>
                    </div>
                    <div class="input-field">
                    <i class="fa-brands fa-discourse"></i>
                        <input type="text" placeholder="Course" name="course">
                    </div>
                    <div class="input-field">
                    <i class="fa-sharp fa-solid fa-code-branch"></i>
                        <input type="text" placeholder="Branch" name="branch">
                    </div>
                    <div class="input-field">
                    <i class="fa-solid fa-building-columns"></i>
                        <input type="text" placeholder="Semester" name="semester">
                    </div>
                </div>
                <div class="btn-field">
                    <button type="submit"> <i class="fa-solid fa-right-from-bracket"></i>Submit</button>
                     <button type="button" onclick="window.location.href='profile.jsp';">create user</button>
                </div>
            </form>
        </div>
        <div class="result-box">
        
        <%
            Connection connection = null;
            PreparedStatement preparedStatement = null;
            
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String id = request.getParameter("id");
                String name = request.getParameter("name");
                String course = request.getParameter("course");
                String branch = request.getParameter("branch");
                String semester = request.getParameter("semester");

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/library?user=root&password=Vinu@2002");

                    String insertQuery = "INSERT INTO user (id, name, course, branch, semester) VALUES (?, ?, ?, ?, ?)";
                    preparedStatement = connection.prepareStatement(insertQuery);
                    preparedStatement.setString(1, id);
                    preparedStatement.setString(2, name);
                    preparedStatement.setString(3, course);
                    preparedStatement.setString(4, branch);
                    preparedStatement.setString(5, semester);
                    
                    int result = preparedStatement.executeUpdate(); // Execute the insert query

                    if (result > 0) {
                        out.println("<h3>User added successfully!</h3>");
                    } else {
                        out.println("<h3>Failed to add user.</h3>");
                    }
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                    out.println("<h3 class='error-box'>Class not found: " + e.getMessage() + "</h3>");
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("<h3 class='error-box'>SQL error: " + e.getMessage() + "</h3>");
                } finally {
                    try {
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
</body>
 <div class="footer">
        <p>&copy; 2024 Your Library-Management-System. All rights reserved.</p>
        <p><a href="privacy.jsp">Privacy Policy</a> | <a href="terms.jsp">Terms of Service</a></p>
    </div>
</html>
