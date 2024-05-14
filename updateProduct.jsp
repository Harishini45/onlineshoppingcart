<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>

<%
int id = Integer.parseInt(request.getParameter("id"));
String name = request.getParameter("product_name");
String category = request.getParameter("category");
int price = Integer.parseInt(request.getParameter("price"));
String active = request.getParameter("active");
String activeValue = (active != null && active.equals("on")) ? "Yes" : "No";

Connection con = null;
PreparedStatement pstmt = null;

try {
    con = ConnectionProvider.getConn();
    String query = "UPDATE product SET name=?, category=?, price=?, active=? WHERE id=?";
    pstmt = con.prepareStatement(query);
    pstmt.setString(1, name);
    pstmt.setString(2, category);
    pstmt.setInt(3, price);
    pstmt.setString(4, activeValue);
    pstmt.setInt(5, id);
    pstmt.executeUpdate();

    if (activeValue.equals("No")) {
        PreparedStatement pst = con.prepareStatement("DELETE FROM cart WHERE product_id = ? AND address IS NULL");
        pst.setInt(1, id);
        pst.executeUpdate();
        pst.close();
    }

    response.sendRedirect("allProductEditProduct.jsp?msg=updated");
} catch (SQLException e) {
    e.printStackTrace();
    response.sendRedirect("allProductEditProduct.jsp?msg=notUpdated");
} finally {
    try {
        if (pstmt != null) pstmt.close();
        if (con != null) con.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
