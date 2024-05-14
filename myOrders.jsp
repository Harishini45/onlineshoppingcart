<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="header.jsp"  %>
<%@ include file = "footer.jsp" %>
<%@ page import = "project.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cart</title>
<style>
.table .thead-dark  tr th {
    background-color: white; /* Change background color */
    color: black; /* Change text color */
}

.table tbody th,
.table tbody td {
    background-color: white; /* Change background color */
    color: black; /* Change text color */
}
.msg{
 position: absolute;
 margin-top:25px;
 font-size:20px;
 left:50%;
 color:white;
  text-align: center;
  transform: translate(-50%, -50%);
 
}
.alert{
color:red;

font-size:20px;
 position: absolute;
   margin-top:25px;
   left:50%;
   padding:5px;
    transform: translate(-50%, -50%);
    text-align: center;

}
h1{
color:white;
text-align:center;
}
</style>
</head>
<body>
<% 
String msg = request.getParameter("msg"); 
//String email = (String) session.getAttribute("email");
%>
<% if(msg != null && msg.equals("notPossible")) {%>
    <h3 class="msg">There is only one Quantity! So click on remove!</h3>
<% } %>
<% if(msg != null && msg.equals("inc")) {%>
    <h3 class="msg">Quantity Increased Successfully!</h3>
<% } %>
<% if(msg != null && msg.equals("dec")) {%>
    <h3 class="msg">Quantity Decreased Successfully!</h3> 
<% } %>
<% if(msg != null && msg.equals("removed")) {%>
    <h3 class="msg">Product Successfully Removed!</h3> 
<% } %>
<%  
try {
    Connection con = ConnectionProvider.getConn();
    int total = 0;
    int sno = 0;
    PreparedStatement stmt = con.prepareStatement("SELECT sum(total) FROM cart where email = ? ");
    stmt.setString(1, email);
    ResultSet rs = stmt.executeQuery();
    while (rs.next()) {
        total = rs.getInt(1);
    }
%>
<div class="container">
    <h1 class="mt-5">My Orders <i class="bi bi-cart-fill"></i></h1>
    <div class="row mt-4">
        <table class="table">
            <thead class="thead-dark">
                
                <tr>
                    <th>S.NO</th>
                    <th>PRODUCT NAME</th>
                    <th>CATEGORY</th>
                    <th><i class="bi bi-currency-rupee"> PRICE</th>
                    <th>QUANTITY</th>
                    <th><i class="bi bi-currency-rupee"> SUB TOTAL</th>
                    <th>ORDER DATE</th>
                    <th>EXPECTED DELIVERY DATE</th>
                    <th>PAYMENT METHOD</th>
                    <th>STATUS</th>
                </tr>
            </thead>
            <tbody>
                <% 
                PreparedStatement rs2 = con.prepareStatement("SELECT * FROM product INNER JOIN products_ordered ON product.id = products_ordered.product_id where products_ordered.email = ? and products_ordered.orderDate is not null");
                rs2.setString(1, email);
                ResultSet rs3 = rs2.executeQuery();
                while(rs3.next()) {
                    sno++;
                %>
                <tr>
                    <td><%= sno %></td>
                    <td><%= rs3.getString("name") %></td>
                    <td><%= rs3.getString("category") %></td>
                    <td><i class="bi bi-currency-rupee"></i> <%= rs3.getString("price") %></td>
                    <td> <%= rs3.getInt("quantity") %></td>
                    <td><i class="bi bi-currency-rupee"></i><%= rs3.getInt("total") %></td>
                    <td><%=rs3.getString("orderDate") %></td>
                    <td><%=rs3.getString("deliveryDate") %></td>
                    <td><%=rs3.getString("paymentMethod") %></td>
                    <td><%=rs3.getString("status") %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>
<%  
    con.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>
</body>
</html>