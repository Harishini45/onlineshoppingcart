<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ include file="footer.jsp" %>
<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    height: calc(80vh - 150px); /* Set body height to 80% of viewport height, subtracting header and footer heights */
    width: 100%; /* Set body width to 100% */
    overflow-y: auto; /* Enable vertical scrolling */
    margin: 0; /* Remove default margin */
    padding: 0; /* Remove default padding */
}

.container-table {
    height: 100%; /* Set the height of the container to 100% */
    width: 100%; /* Set the width of the container to 100% */
    overflow-y: auto; /* Enable vertical scrolling */
}

.table .thead-dark tr th {
    background-color: white;
    color: black;
}

.table tbody th,
.table tbody td {
    background-color: white;
    color: black;
}

.btn-primary {
    color: blue;
    background-color: white;
    border-color: white;
}

.btn-primary:active {
    color: violet;
}

.btn-primary:hover {
    color: lightblue;
    background-color: white;
    border-color: white;
}

h1 {
    text-align: center;
}

body {
    background-color: blue;
}

.msg {
    position: absolute;
    margin-top: 25px;
    font-size: 20px;
    left: 50%;
    color: white;
    text-align: center;
    transform: translate(-50%, -50%);
}

.alert {
    color: red;
    font-size: 20px;
    position: absolute;
    margin-top: 25px;
    left: 50%;
    padding: 5px;
    transform: translate(-50%, -50%);
    text-align: center;
}

h1 {
    color: white;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String msg = request.getParameter("msg");
%>
<% if(msg != null && msg.equals("added") ){%>
 <h3 class ="msg">Product Added Successfully</h3>
<%}%>
<% if(msg != null && msg.equals("exist") ){%>
<h3 class ="msg">Product already exist in your cart! Quantity increased!</h3>
<%}%>
<%if(msg != null && msg.equals("invalid") ){%>
<h3 class ="alert">Some thing went wrong! Try again</h3> 
<%}%>
 <div class="container">
       <h1 class="mt-5">Home <i class="bi bi-house-door-fill"></i></h1>
        <div class="row mt-4">
            <div class="container-table"> <!-- Container for scrolling -->
                <table class="table" style="width: 100%;"> <!-- Set table width to 100% -->
                    <thead class="thead-dark">
                        <tr>
                            <th>ID</th>
                            <th>NAME</th>
                            <th>CATEGORY</th>
                            <th>PRICE</th>
                            <th>ADD TO CART</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            try {
                               Connection con = ConnectionProvider.getConn();

                                // Execute SQL query to fetch product details
                                Statement stmt = con.createStatement();
                                ResultSet rs = stmt.executeQuery("SELECT * FROM product where active = 'Yes'");

                                // Iterate through the result set and display product details
                                while (rs.next()) {
                                    int productId = rs.getInt(1);
                                    String productName = rs.getString(2);
                                    String category = rs.getString(3);
                                   int price = rs.getInt(4);

                                    String stock = rs.getString(5);
                        %>
                                    <tr>
                                        <td><%= productId %></td>
                                        <td><%= productName %></td>
                                        <td><%= category %></td>
                                        <td><%= price %></td>
              
                                         <td><a href="addToCartAction.jsp?productId=<%= productId %>" class="btn btn-primary">ADD TO CART  <i class="bi bi-cart-plus-fill"></i></a></td>
                                      
                                    </tr>
                        <% 
                                }
                                // Close the database connection
                                con.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
