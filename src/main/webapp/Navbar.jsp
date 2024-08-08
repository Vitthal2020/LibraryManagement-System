<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" type="text/css" href="book.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navbar with Slides</title>
    <script src="https://kit.fontawesome.com/333fad35b3.js" crossorigin="anonymous"></script>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(rgba(0, 0, 50, 0.3), rgba(0, 0, 50, 0.3)), url('img/ai.jpg');
            background-size: cover;
            background-position: center;
           
            
        }
         .footer {
            background-color: #3c00a0;
            color: #fff;
            text-align: center;
            padding: 20px 0;
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
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid btn div">
    <a class="navbar-brand btn btn-outline-primary " href="#"><i class="fa-solid fa-house btn "></i>Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item div">
          <a class="nav-link active btn btn-outline-primary" aria-current="page" href="#">About us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"></a>
        </li>
        <li class="nav-item">
          <a class="nav-link btn btn-outline-primary"aria-current="page" href="contact.jsp">Contact Us</a>
        </li>
        
      </ul>
    </div>
    <nav class="navbar bg-body-tertiary ">
  <div class="container-fluid">
    <form class="d-flex">
     
       
       <a class="btn btn-success div1"aria-current="page" href="sign.jsp">Login</a>
       <a class="btn btn-danger div1"aria-current="page" href="logOut.jsp">LogOut</a>
    </form>
  </div>
</nav>
  </div>
</nav>
        <div class="book">
            <div class="image-container">
              <a href="https://en.wikipedia.org/wiki/B._R._Ambedkar"> <img src="img/ambedkar.jpg" alt="Ambedkar"></a>
                <div class="image-text">Biography
               <li>ID:1100035</li>
              <li>Author:BR.Ambedkar</li>
                </div>
                 <button>Click>></button>
            </div>
            <div class="image-container">
               <a href="https://en.wikipedia.org/wiki/C_(programming_language)"><img src="img/c.jpg" alt="C"></a>
                <div class="image-text">
                   C-Language
                 <li>ID:1100078</li>
                <li>Author:Dennis-Retchie</li>
          
                </div>
                <button>Click>></button>
            </div>
            <div class="image-container">
              <a href="https://en.wikipedia.org/wiki/Swami_Vivekananda">  <img src="img/viveka.jpg" alt="Vivekananda"></a>
                <div class="image-text">Yoga
                 <li>ID:1100067</li>
                  <li>Author:Vivekananda</li>
              
                </div>
                <button>Click>></button>
            </div>
            <div class="image-container">
              <a href="https://en.wikipedia.org/wiki/A._P._J._Abdul_Kalam">  <img src="img/kalam.jpg" alt="Kalam"></a>
                <div class="image-text">Wings of Fire
                 <li>ID:1100089</li>
                  <li>Author:Abdul-Kalam</li>
                </div>
                <button>Click>></button>
                
            </div>
             <div class="image-container">
              <a href="https://en.wikipedia.org/wiki/Atal_Bihari_Vajpayee">  <img src="img/atal.jpg" alt="Kalam"></a>
                <div class="image-text">baratratna
                 <li>ID:1100094</li>
                  <li>Author:Pawan Sikkha</li>
                </div>
                <button>Cliick>>></button>
                
            </div>
           
        </div>
       
    <div class="footer">
        <p>&copy; 2024 Your Library-Management-System. All rights reserved.</p>
        <p><a href="privacy.jsp">Privacy Policy</a> | <a href="terms.jsp">Terms of Service</a></p>
    </div>
    
    
</body>
</html>
