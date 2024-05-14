<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
try {
	System.out.println("addtocartAction");
    String email = (String) session.getAttribute("email"); // Check if email session is not null

    if (email != null) {
        int id = Integer.parseInt(request.getParameter("productId"));
        int quantity = 1;
        int product_price = 0;
        int product_total = 0;
        int cart_total = 0;
        int z = 0;

        Connection con = ConnectionProvider.getConn();

        // Get product details
        PreparedStatement getProductStmt = con.prepareStatement("SELECT price FROM product WHERE id = ?");
        getProductStmt.setInt(1, id);
        ResultSet productRs = getProductStmt.executeQuery();

        if (productRs.next()) {
            product_price = productRs.getInt("price");
            product_total = product_price;
        }

        // Check if product already exists in cart
        PreparedStatement checkCartStmt = con.prepareStatement("SELECT total, quantity FROM cart WHERE product_id = ? AND email = ?");
        checkCartStmt.setInt(1, id);
        checkCartStmt.setString(2, email);
        ResultSet cartRs = checkCartStmt.executeQuery();

        if (cartRs.next()) {
            cart_total = cartRs.getInt("total");
            cart_total += product_total;
            quantity = cartRs.getInt("quantity");
            quantity += 1;
            z = 1;
        }

        if (z == 1) {
            // Update cart
            PreparedStatement updateCartStmt = con.prepareStatement("UPDATE cart SET total = ?, quantity = ? WHERE product_id = ? ");
            updateCartStmt.setInt(1, cart_total);
            updateCartStmt.setInt(2, quantity);
            updateCartStmt.setInt(3, id);
            updateCartStmt.executeUpdate();
            response.sendRedirect("home.jsp?msg=exist");
        } else {
            // Insert into cart
            PreparedStatement insertCartStmt = con.prepareStatement("INSERT INTO cart (email, product_id, quantity, price, total) VALUES (?, ?, ?, ?, ?)");
            insertCartStmt.setString(1, email);
            insertCartStmt.setInt(2, id);
            insertCartStmt.setInt(3, quantity);
            insertCartStmt.setInt(4, product_price);
            insertCartStmt.setInt(5, product_total);
            insertCartStmt.executeUpdate();
            response.sendRedirect("home.jsp?msg=added");
        }

        con.close();
    } else {
        // Redirect if email session is null
        response.sendRedirect("home.jsp?msg=invalid");
    }
} catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("home.jsp?msg=invalid");
}
%>
