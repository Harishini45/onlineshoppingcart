<%@ include file ="adminHeader.jsp"  %>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            background-color: white;
        }
    </style>
    <meta charset="UTF-8">
    <title>My Orders</title>
</head>
<body>
<%
String msg = request.getParameter("msg");
%>
<% if(msg != null && msg.equals("cancel")) {%>
    <h3 class="msg">Order Cancelled Successfully</h3>
<% } %>
<% if(msg != null && msg.equals("delivered")) {%>
    <h3 class="msg">Order Delivered Successfully</h3>
<% } %>
<% if(msg != null && msg.equals("invalid")) {%>
    <h3 class="msg">Something went wrong! Try Again!</h3> 
<% } %>

<div class="container">
    <h1 class="mt-5"> Orders Received <i class="bi bi-cart-fill"></i></h1>
    <div class="row mt-4">
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th>MOBILE NUMBER</th>
                    <th>PRODUCT NAME</th>
                    <th>QUANTITY</th>
                    <th><i class="bi bi-currency-rupee"></i> SUB TOTAL</th>
                    <th>ADDRESS</th>
                    <th>CITY</th>
                    <th>STATE</th>
                    <th>COUNTRY</th>
                    <th>ORDER DATE</th>
                    <th>EXPECTED DELIVERY DATE</th>
                    <th>PAYMENT METHOD</th>
                    <th>STATUS</th>
                    <th>ACTION</th>
                </tr>
            </thead>
            <tbody>
                <% 
                try {
                    Connection con = ConnectionProvider.getConn();
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM products_ordered INNER JOIN product ON product.id = products_ordered.product_id WHERE products_ordered.orderDate IS NOT NULL AND products_ordered.status = 'processing'");
                    ResultSet rs = ps.executeQuery();
                    while(rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("mobileNumber") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getInt("quantity") %></td>
                    <td><i class="bi bi-currency-rupee"></i> <%= rs.getInt("total") %></td>
                    <td><%= rs.getString("address") %></td>
                    <td><%= rs.getString("city") %></td>
                    <td><%= rs.getString("state") %></td>
                    <td><%= rs.getString("country") %></td>
                    <td><%= rs.getString("orderDate") %></td>
                    <td><%= rs.getString("deliveryDate") %></td>
                    <td><%= rs.getString("paymentMethod") %></td>
                    <td><%= rs.getString("status") %></td>
                    <td>
                        <a href="cancelOrdersAction.jsp?id=<%= rs.getInt("order_id")%>&email=<%= rs.getString("email")%>">Cancel <i class="bi bi-x-square-fill"></i></a>
                        
                        <a href="deliveredOrdersAction.jsp?id=<%= rs.getInt("order_id")%>&email=<%= rs.getString("email")%>">Delivered <i class="fa-solid fa-check"></i></a>
                    </td>
                </tr>
                <% 
                    }
                    rs.close();
                    ps.close();
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
            </tbody>
        </table>
    </div>
</div>
<%@ include file = "../footer.jsp" %>
</body>
</html>
