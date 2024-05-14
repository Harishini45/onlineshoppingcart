<%@ include file ="header.jsp"  %>
<%@ include file = "footer.jsp" %>
<%@ page import = "project.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>
<head>
    <style>
        /* Your CSS styles here */
    </style>
</head>
<body>
    <div class="container">
        <h1 class="mt-5">Home <i class="bi bi-house-door-fill"></i></h1>
        <div class="row mt-4">
            <table class="table">
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
                        String search = request.getParameter("search");
                        if (search == null || search.trim().isEmpty()) {
                            // If search parameter is empty, redirect to an error page or display a message
                            response.sendRedirect("error.jsp");
                        } else {
                            // Execute SQL query to fetch product details matching the search criteria
                            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM product WHERE (name LIKE ? OR category LIKE ?) AND active = 'Yes'");
                            pstmt.setString(1, "%" + search + "%");
                            pstmt.setString(2, "%" + search + "%");
                            ResultSet rs = pstmt.executeQuery();

                            // Check if any products are found
                            if (!rs.next()) {
                                out.println("<tr><td colspan='5'>No products found matching your search criteria.</td></tr>");
                            } else {
                                // Iterate through the result set and display product details
                                do {
                                    int productId = rs.getInt(1);
                                    String productName = rs.getString(2);
                                    String category = rs.getString(3);
                                    int price = rs.getInt(4);
                    %>
                    <tr>
                        <td><%= productId %></td>
                        <td><%= productName %></td>
                        <td><%= category %></td>
                        <td><%= price %></td>
                        <td><a href="addToCartAction.jsp?productId=<%= productId %>" class="btn btn-primary">ADD TO CART  <i class="bi bi-cart-plus-fill"></i></a></td>
                    </tr>
                    <% 
                                } while (rs.next());
                            }
                            // Close the result set and prepared statement
                            rs.close();
                            pstmt.close();
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
</body>