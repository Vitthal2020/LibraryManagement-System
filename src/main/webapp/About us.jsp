<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(rgba(0, 0, 50, 0.8), rgba(0, 0, 50, 0.8)), url('img/home_page.jpg');
            background-size: cover;
            background-position: center;
        }
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .brand-title {
            font-size: 24px;
            color: #3c00a0;
        }
        .toggle-button {
            display: none;
            flex-direction: column;
            justify-content: space-between;
            height: 21px;
            cursor: pointer;
        }
        .toggle-button .bar {
            height: 3px;
            width: 25px;
            background-color: #3c00a0;
            border-radius: 10px;
        }
        .navbar-links {
            height: 100%;
        }
        .navbar-links ul {
            margin: 0;
            padding: 0;
            display: flex;
        }
        .navbar-links li {
            list-style: none;
        }
        .navbar-links a {
            text-decoration: none;
            color: #3c00a0;
            padding: 0 15px;
            display: block;
            transition: all 0.3s ease-in-out;
        }
        .navbar-links a:hover {
            color: #311b92;
        }
        .content {
            padding: 20px;
        }
        .content section {
            margin: 20px 0;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .content section h1 {
            color: #3c00a0;
        }
        .content section p {
            color: #333;
            line-height: 1.6;
        }
        @media (max-width: 768px) {
            .toggle-button {
                display: flex;
            }
            .navbar-links {
                display: none;
                width: 100%;
            }
            .navbar-links ul {
                flex-direction: column;
            }
            .navbar-links li {
                text-align: center;
                margin: 10px 0;
            }
            .navbar-links.active {
                display: flex;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="brand-title">My Website</div>
        
          
        
        <div class="navbar-links" id="navbar-links">
            <ul>
                <li><a href="Home.jsp">Home</a></li>
                <li><a href="About us.jsp">About</a></li>
                <li><a href="contact.jsp">Contact</a></li>
            </ul>
        </div>
    </nav>

    <div class="content">
        <section id="about">
            <h1>About Us</h1>
            <p>We are a team of dedicated professionals committed to providing top-notch services. Our mission is to deliver high-quality products that bring value to our customers. With years of experience in the industry, we pride ourselves on our expertise and customer satisfaction.</p>
        </section>
    </div>

   <div class="footer">
        <p>&copy; 2024 Your Library-Management-System. All rights reserved.</p>
        <p><a href="privacy.jsp">Privacy Policy</a> | <a href="terms.jsp">Terms of Service</a></p>
    </div>
</body>
</html>
