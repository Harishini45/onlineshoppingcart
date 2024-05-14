<%@page errorPage="error.jsp" %>
<%@ include file="footer.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Website</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-xxxx" crossorigin="anonymous"-->
<script src="https://kit.fontawesome.com/008bc5f708.js" crossorigin="anonymous"></script>
  <style>
  .center-content {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh; /* Adjust as needed */
      
    }
    .form-container {
      padding: 20px;
      width: 400px;
      background-color: white;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
       margin-bottom:180px;
    }
  .btn-outline-danger:hover {
      background-color: grey !important;
      border-color: grey !important;
    }
   
  .btn-outline-danger {
      color: black !important;
      border-color: black !important;
    }
  body{
  
  background-color:blue;
  
  
  }
   .navbar-light .navbar-nav .nav-link {
      color: black;
      font-weight:bold;
      font-size:13px;
      /*padding: 0px 20px;*/
      
    }
   
  
  </style>
</head>
<body>
<%
String email = session.getAttribute("email").toString();

%>
<nav class="navbar navbar-expand-lg navbar-light bg-light" >
  <div class="container">
  <a style = "padding-left:10px;margin-right:20px;color:black;font-weight:bold;"href="home.jsp"> <i class="bi bi-arrow-90deg-left"></i> Back</a>
    <a class="navbar-brand " href="home.jsp"  style="font-size: 13px;font-weight:bold;"> Your Profile(<% out.print(" "+email);%>)</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <a class="nav-link" href="editPassword.jsp">Change Password <i class="fa-solid fa-key"></i> </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="editAddress.jsp">Add or change Address <i class="fa-solid fa-location-dot"></i></a>
        </li>
       
        <li class="nav-item">
          <a class="nav-link" href="editSecurity.jsp">Change Security Question <i class="fa-regular fa-rotate-right"></i></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="editContact.jsp">Change Mobile Number <i class="fa-solid fa-phone"></i></a>
        </li>
      
       <li>
     
      </ul>
      
    </div>
  </div>
</nav>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!-- Bootstrap JS -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>