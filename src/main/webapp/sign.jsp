<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up Page</title>
    <style>
        /* Use the CSS you provided */
        * {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            box-sizing: border-box;
        }
        .container {
            width: 100%;
            height: 100vh;
            background-image: linear-gradient(rgba(0,0,50,0.8),rgba(0,0,50,0.8)), url('img/background.png');
            background-position: center;
            background-size: cover;
            position: relative;
        }
        .form-box {
            width: 30%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
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
            margin-left: 15%;
            font-size: 30px;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-box">
            <h1>Sign Up</h1>
            <form method="post" action="">
                <div class="input-group">
                    <div class="input-field">
                        <i class="fa-solid fa-user"></i>
                        <input type="text" placeholder="Name" name="username" required>
                    </div>
                    <div class="input-field">
                        <i class="fa-solid fa-envelope"></i>
                        <input type="email" placeholder="Email" name="email" required>
                    </div>
                    <div class="input-field">
                        <i class="fa-solid fa-lock"></i>
                        <input type="password" placeholder="Password" name="password" required>
                    </div>
                    <p>Forgot password <a href="forgotPassword.jsp">Click here!</a></p>
                </div>
                <div class="btn-field">
                    <button type="submit">Sign Up</button>
                    <button type="button" onclick="location.href='logo.jsp'">Sign In</button>
                </div>
            </form>
        </div>
        <div class="result-box">
            <%
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    String username = request.getParameter("username");
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");
                    Connection connection = null;
                    PreparedStatement preparedStatement = null;
                    ResultSet resultSet = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/library?user=root&password=Vinu@2002");
                        String checkQuery = "SELECT * FROM signin WHERE username = ?";
                        preparedStatement = connection.prepareStatement(checkQuery);
                        preparedStatement.setString(1, username);
                        resultSet = preparedStatement.executeQuery();
                        if (resultSet.next()) {
                            out.println("<h3 class='result-box'>Username already exists. Please choose another username.!!!</h3>");
                        } else {
                            String insertQuery = "INSERT INTO signin (username, email, password) VALUES (?, ?, ?)";
                            preparedStatement = connection.prepareStatement(insertQuery);
                            preparedStatement.setString(1, username);
                            preparedStatement.setString(2, email);
                            preparedStatement.setString(3, password);
                            preparedStatement.executeUpdate();
                            
                            // Store signup details in session
                            session.setAttribute("signupName", username);
                            session.setAttribute("signupEmail", email);
                            
                            response.sendRedirect("Home.jsp");
                        }
                    } catch (ClassNotFoundException | SQLException e) {
                        e.printStackTrace();
                        out.println("<h3 class='result-box'>An error occurred</h3>");
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
    <!-- Footer -->
</body>
</html>
