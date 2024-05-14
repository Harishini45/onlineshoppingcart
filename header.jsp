<%@page errorPage="error.jsp" %>
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
  <style>
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
    <a class="navbar-brand " href="home.jsp"  style="font-size: 16px;font-weight:bold;"> <% out.print(" "+email);%></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <a class="nav-link" href="home.jsp">Home <i class="bi bi-house-door-fill"></i></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="myCart.jsp">My Cart <i class="bi bi-cart"></i></a>
        </li>
       
        <li class="nav-item">
          <a class="nav-link" href="myOrders.jsp">My Orders <i class="bi bi-basket2"></i></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="changeDetails.jsp">Change Details <i class="bi bi-pencil-square"></i></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="messageUs.jsp">Message Us <i class="bi bi-chat-square-fill"></i></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="about.jsp">About <i class="bi bi-file-person-fill"></i></a>
        </li>
        <li>
        <a class="nav-link" href="logout.jsp">Logout <i class="bi bi-box-arrow-right"></i></a>
      </li>
       <li>
       <form action = "searchHome.jsp" method = "post">
       <input type = "text" placeholder= "search" name="search" style="border-color:grey;border-radius:3px;margin-top:4px;padding-left:40px;" required>
      <a>  <button type="submit" class="btn btn-outline-primary" style="border:none;"><i class="bi bi-search"></i></button></a>
      </form>
       </li>
      </ul>
      
    </div>
  </div>
</nav>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>