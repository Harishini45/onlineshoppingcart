<%@ include file ="adminHeader.jsp"  %>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deliver</title>
</head>
<body>


<div class="container">
    <h1 class="mt-5">Delivered Orders <i class="bi bi-cart-fill"></i></h1>
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
                    
                </tr>
            </thead>
            <tbody>
                <% 
                try {
                    Connection con = ConnectionProvider.getConn();
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM cart INNER JOIN product ON product.id = cart.product_id WHERE cart.email = ? AND cart.orderDate IS NOT NULL AND cart.status='Delivered'");
                    ps.setString(1, email);
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