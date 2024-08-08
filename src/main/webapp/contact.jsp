<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(rgba(0, 0, 50, 0.3), rgba(0, 0, 50, 0.3)), url('img/home page.jpg');
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
            margin: 20px 20%;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            width:60%;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .content section h1 {
            color: #3c00a0;
        }
        .content section p {
            color: #333;
            line-height: 1.6;
        }
        .contact-form {
            display: flex;
            flex-direction: column;
            gap: 10px;
            background-color: #bfabab;
        }
        .contact-form input,
        .contact-form textarea {
            width: 70%;
            font-size: 20px;
            background: transparent;
            border: 0;
            outline: 0;
            padding: 18px 15px;
            margin-left: 20px;
             background: #eaeaea;
            margin: 15px 0;
            border-radius: 3px;
            display: flex;
            align-items: center;
            max-height: 65px;
            transition: max-height 0.2s;
        }
        .contact-form button {
            padding: 10px;
            font-size: 18px;
            color: #fff;
            background-color: #3c00a0;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100px;
            align-self: flex-end;
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
        .contact-form button:hover {
            background-color: #311b92;
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
   

    <div class="content">
        <section id="contact">
            <h1>Contact Us</h1>
           
            <form class="contact-form" action="submition.jsp">
             <input type="text" name="id" placeholder="Your id"  required>
                <input type="text" name="name" placeholder="Your Name"  required>
                <input type="email" name="email" placeholder="Your Email" required>
                <textarea name="message" rows="5" placeholder="Your Message"  required></textarea>
                <button type="submit">Send</button>
            </form>
        </section>
    </div>

    <div class="footer">
        <p>&copy; 2024 Your Library-Management-System. All rights reserved.</p>
        <p><a href="privacy.jsp">Privacy Policy</a> | <a href="terms.jsp">Terms of Service</a></p>
    </div>
    
</body>
</html>
