<%@page errorPage="adminError.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Website</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
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
      font-size:15px;
      
    }
  
  </style>
</head>
<body>
<%
String email = session.getAttribute("email").toString();

%>
<nav class="navbar navbar-expand-lg navbar-light bg-light" >
  <div class="container">
    <a class="navbar-brand" href="adminHome.jsp">Shopping Cart</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <a class="nav-link" href="addNewProduct.jsp">Add New Product</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="allProductEditProduct.jsp">All Products & Edit Products</a>
        </li>
       
        <li class="nav-item">
          <a class="nav-link" href="messagesReceived.jsp">Messages Received</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="ordersReceived.jsp">Orders Received</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="cancelledOrders.jsp">Cancel Orders</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="deliveredOrders.jsp">Delivered Orders</a>
        </li>
      </ul>
      <form class="form-inline my-2 my-lg-0" action = "../logout.jsp">
        <button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Logout</button>
      </form>
    </div>
  </div>
</nav>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
