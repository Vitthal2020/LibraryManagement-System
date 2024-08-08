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
            <h1>New User</h1>
            <form method="post" action="Userprofile.jsp">
                <div class="input-group">
                    <div class="input-field">
                    <i class="fa-solid fa-id-badge"></i>
                        <input type="text" placeholder="ID" name="id" required>
                    </div>
                    <div class="input-field">
                      <i class="fa-solid fa-user"></i>
                        <input type="text" placeholder="Name" name="name" required>
                    </div>
                    <div class="input-field">
                        <i class="fa-solid fa-envelope"></i>
                        <input type="email" placeholder="Email" name="email" required>
                    </div>
                    <div class="input-field">
                    <i class="fa-brands fa-discourse"></i>
                        <input type="text" placeholder="Course" name="course" required>
                    </div>
                    <div class="input-field">
                    <i class="fa-sharp fa-solid fa-code-branch"></i>
                        <input type="text" placeholder="Branch" name="branch" required>
                    </div>
                    <div class="input-field">
                    <i class="fa-solid fa-building-columns"></i>
                        <input type="text" placeholder="Semester" name="semester" required>
                    </div>
                </div>
                <div class="btn-field">
                </div>
                 <div class="btn-field">
                    <button type="submit"> <i class="fa-solid fa-right-from-bracket"></i>Submit</button>
                     <button type="button" onclick="window.location.href='Home.jsp';">Cancle</button>
                </div>
                </form>
                </div>
                </div>
                 <div class="footer">
        <p>&copy; 2024 Your Library-Management-System. All rights reserved.</p>
        <p><a href="privacy.jsp">Privacy Policy</a> | <a href="terms.jsp">Terms of Service</a></p>
    </div>
                </body>
                </html>