<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "editDetailsHeader.jsp" %>
<%@ page import="java.sql.*"%>
<%@ page import="project.ConnectionProvider"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS for eCommerce look -->
    <link href="styles.css" rel="stylesheet">
    <style>
    
    body{
    background-color:blue;}
    </style>
</head>
<body>
    
    <%
   
    Connection con = ConnectionProvider.getConn();
    String sql = "SELECT name, email, mobilenumber, securityquestion FROM users WHERE email = ?";
    PreparedStatement pst  = con.prepareStatement(sql);
    pst.setString(1, email);

    // Execute the query
  ResultSet  rst = pst.executeQuery();

    // Process the result set
    if (rst.next()) {
        
    
    
    
    %>
    <!-- User Details -->
    <div class="container my-5">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-header text-white" style="background-color:grey;font-weight:bold;text-align:center;">
                     <i class="bi bi-person-circle"></i> User Information
                    </div>
                    <div class="card-body">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <th>Name:</th>
                                    <td><%= rst.getString("name")  %></td>
                                </tr>
                                <tr>
                                    <th>Email:</th>
                                    <td><%= email %></td>
                                </tr>
                                <tr>
                                    <th>Mobile Number:</th>
                                    <td><%= rst.getString("mobilenumber")%></td>
                                </tr>
                                <tr>
                                    <th>Security Question:</th>
                                    <td><%= rst.getString("securityquestion")%></td>
                                </tr>
                                <!-- Add more fields if needed -->
                            </tbody>
                            <%} %>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
