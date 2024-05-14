<%@ page import="java.sql.*" %>
<%@ include file="adminHeader.jsp" %>
<%@ page import="project.ConnectionProvider"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product Listing</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
    .product-card {
        margin-bottom: 20px;
    }
    .msg {
        position: absolute;
        margin-top: 30px;
        font-size: 15px;
        left: 80%;
        color: green;
    }
    .alert {
        color: red;
        font-size: 20px;
        position: absolute;
        margin-top: 10px;
        left: 50%;
        padding: 5px;
        transform: translate(-50%, -50%);
        text-align: center;
    }
    
    /* Added CSS for scrollable table */
    .table-scrollable {
        overflow-y: auto;
        max-height: 500px; /* Adjust as needed */
    }
</style>
</head>
<body>
<%
String msg = request.getParameter("msg");
%>
<% if(msg != null && msg.equals("updated")) {%>
    <h3 class="msg">Product Updated Successfully</h3>
<% } %>
<% if(msg != null && msg.equals("deleted")) {%>
    <h3 class="msg">Product Deleted Successfully</h3>
<% } %>
<% if(msg != null && (msg.equals("notUpdated") || msg.equals("notDeleted"))) {%>
    <h3 class="alert">Something went wrong! Try again</h3>
<% } %>
<div class="container">
    <h1 class="mt-5">All Products & Edit Products</h1>
    <div class="row mt-4">
        <!-- Added table-scrollable class -->
        <table class="table table-scrollable">
            <thead class="thead-dark">
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Stock</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <% 
                try {
                    Connection con = ConnectionProvider.getConn();
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM product");
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
                    <td><%= stock %></td>
                    <td><a href="editProduct.jsp?productId=<%= productId %>" class="btn btn-primary">Edit</a></td>
                    <td><a href="deleteProduct.jsp?productId=<%= productId %>" class="btn btn-danger">Delete</a></td>
                </tr>
                <% 
                    }
                    con.close();
                } catch (Exception e) {
                   // out.println("Error: " + e.getMessage());
                   e.printStackTrace();
                   
                }
                %>
            </tbody>
        </table>
    </div>
</div>
<%@ include file="/footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
