<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fetch Password</title>
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
            background-image: linear-gradient(rgba(0,0,50,0.2),rgba(0,0,50,0.2)), url('img/iu.jpg'); /* Ensure the correct path to your background image */
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
            background-color: #cbbcbc;
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
        .result-box {
            margin-top: 20px;
            color: white;
            font-size: 18px;
        }
        .password-box {
        
            position:fixed;
            color: white;
            font-size: 30px;
            margin-left: 38%
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
            <h1>Fetch Password</h1>
            <form action="forgotPassword.jsp" method="post">
                <div class="input-group">
                    <div class="input-field">
                        <i class="fa-solid fa-envelope"></i>
                        <input type="email" placeholder=" email" name="email" required>
                    </div>
                </div>
                <div class="btn-field">
                    <button type="submit">Submit</button>
                     <button type="button" onclick="location.href='logo.jsp'">Login</button>
                </div>
            </form>
        </div>
        <div class="result-box">
            <%!
                Connection connection = null;
                PreparedStatement preparedStatement = null;
                ResultSet resultSet = null;
                String password = null; // Initialize password variable
            %>
            <%
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/library?user=root&password=Vinu@2002");

                        String query = "SELECT password FROM signin WHERE email = ?";
                        preparedStatement = connection.prepareStatement(query);
                        preparedStatement.setString(1, request.getParameter("email"));
                        resultSet = preparedStatement.executeQuery();

                        if (resultSet.next()) {
                            password = resultSet.getString("password");
                        } else {
                            password = "Invalid username or email";
                        }
                    } catch (SQLException | ClassNotFoundException e) {
                        e.printStackTrace();
                        password = "Error occurred while fetching password";
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
            <div class="password-box">
                <h3>Here is your Password: <%= password %></h3>
            </div>
            <%
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

