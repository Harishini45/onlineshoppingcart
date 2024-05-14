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
System.out.println("mycart");
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
    <h1 class="mt-5">My Cart <i class="bi bi-cart-fill"></i></h1>
    <div class="row mt-4">
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th style="background-color: yellow;">TOTAL : <i class="bi bi-currency-rupee"><%=total %></i></th>
                    <% if(total>0) { %>
                        <th style="color: violet;"><a href="addressPaymentForOrder.jsp">PROCEED TO ORDER</a></th>
                    <% } %>
                </tr>
                <tr>
                    <th>S.NO</th>
                    <th>PRODUCT NAME</th>
                    <th>CATEGORY</th>
                    <th>PRICE</th>
                    <th>QUANTITY</th>
                    <th>SUB TOTAL</th>
                    <th>REMOVE <i class="bi bi-trash"></i></th>
                </tr>
            </thead>
            <tbody>
                <% 
                PreparedStatement rs2 = con.prepareStatement("SELECT product.*, cart.quantity, cart.total FROM product INNER JOIN cart ON product.id = cart.product_id where cart.email = ? ");
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
                    <td> <a href="incDecQuantityAction.jsp?id=<%=rs3.getInt("id")%>&quantity=inc"><i class="bi bi-plus-circle-fill"></i></a> <%= rs3.getInt("quantity") %><a href= "incDecQuantityAction.jsp?id=<%=rs3.getInt("id")%>&quantity=dec"><i class="bi bi-dash-circle-fill"></i></a></td>
                    <td><i class="bi bi-currency-rupee"></i><%= rs3.getInt("total") %></td>
                    <td><a href="removeFromCart.jsp?id=<%= rs3.getInt("id") %>" class="btn btn-primary">Remove  <i class="bi bi-trash"></i></a></td>
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
