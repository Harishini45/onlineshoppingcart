<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@page errorPage="error.jsp" %>
<%
String email = session.getAttribute("email").toString();
String status = "processing";
try {
    Connection con = ConnectionProvider.getConn();
    
    // Update the status of items in the cart to "processing"
    PreparedStatement updateStatusStmt = con.prepareStatement("UPDATE cart SET status = ? WHERE email = ? AND status = 'bill'");
    updateStatusStmt.setString(1, status);
    updateStatusStmt.setString(2, email);
    updateStatusStmt.executeUpdate();
    updateStatusStmt.close();
    
    // Insert cart items into the "products_ordered" table
    PreparedStatement insertStmt = con.prepareStatement("INSERT INTO products_ordered (email, product_id, quantity, price, total, address, city, state, country, mobileNumber, orderDate, deliveryDate, paymentMethod, transactionId, status) SELECT email, product_id, quantity, price, total, address, city, state, country, mobileNumber, orderDate, deliveryDate, paymentMethod, transactionId, ? FROM cart WHERE email = ?");
    insertStmt.setString(1, status);
    insertStmt.setString(2, email);
    insertStmt.executeUpdate();
    insertStmt.close();
    
    // Clear the cart for the specified email
    PreparedStatement clearCartStmt = con.prepareStatement("DELETE FROM cart WHERE email = ?");
    clearCartStmt.setString(1, email);
    clearCartStmt.executeUpdate();
    clearCartStmt.close();
    
    // Redirect to the home page or any other appropriate page
    response.sendRedirect("home.jsp");
} catch(Exception e) {
    e.printStackTrace();
    // Redirect to an error page
    //response.sendRedirect("error.jsp");
}
%>
