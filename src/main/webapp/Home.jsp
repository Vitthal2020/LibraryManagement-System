      <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Management System</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to external CSS -->
    <script src="https://kit.fontawesome.com/333fad35b3.js" crossorigin="anonymous"></script>
    <style>
    body {
    font-family: 'Poppins', sans-serif;
    padding: 0;
    background: linear-gradient(rgba(0, 0, 50, 0.3), rgba(0, 0, 50, 0.3)), url('img/oo.jpg');
    background-size: cover;
    background-position: center;
    
}
.navbar {
    display: block;
    padding: 20px 20%;
    font-size: 25px;
    background-color: #fff;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}
.navbar-links ul {
    margin: 0;
    padding: 0;
    list-style: none;
    overflow: hidden;
}
.navbar-links li {
    display: inline;
    padding-right: 20px;
}
.navbar-links a {
    text-decoration: none;
    color: #3c00a0;
    padding: 0 15px;
    display: inline-block;
    font-size:20px;
    transition: all 0.3s ease-in-out;
}
.navbar-links a:hover {
    color: #311b92;
}

.container {
    text-align: center;
    margin-right: 2%;
    
}
.container h1 {
    color: #fff;
    background-color: #3c00a0;
    height:50px;
    margin-top: 1px;
}
.link-box {
    display: block;
    width: 400px;
    height: 70px;
    margin: 10px 30px;
    padding: 20px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    text-align: center;
    transition: transform 0.3s;
    line-height: 60px;
}
.link-box:hover {

    transform: scale(1.05);
}
.link-box a {
    text-decoration: none;
    color: #fff;
    font-size: 30px;
    display: block;
    background-color: #3c00a0;
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
    margin: 0;
}
    
    
    </style>
</head>
<body>
   

    <div class="container">
        <h1>Welcome to the Library Management System</h1>
        <div class="link-box">
            <a href="user.jsp">Register User</a>
        </div>
        <div class="link-box">
            <a href="addBook.jsp">Add Book</a>
        </div>
        <div class="link-box">
            <a href="Userprofile.jsp">User Profile</a>
        </div>
        <div class="link-box">
            <a href="issueBook.jsp">Issue Book</a>
        </div>
        <div class="link-box">
            <a href="Return.jsp">Return Book</a>
        </div>
        <div class="link-box">
            <a href="details.jsp">Book Details</a>
        </div>
        <div class="link-box">
            <a href="logOut.jsp">Log Out</a>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2024 Your Library Name. All rights reserved.</p>
        <p><a href="privacy.jsp">Privacy Policy</a> | <a href="terms.jsp">Terms of Service</a></p>
    </div>
</body>
</html>
      