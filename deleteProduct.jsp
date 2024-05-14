<%@ page import="project.ConnectionProvider"%>
<%@page import ="java.sql.*" %>
<%

	int id = Integer.parseInt(request.getParameter("productId"));
try {
    Connection con = ConnectionProvider.getConn();
     
    PreparedStatement pstmt = con.prepareStatement("DELETE FROM product WHERE id = ?");
    pstmt.setInt(1, id);
    int rowsAffected = pstmt.executeUpdate();
    response.sendRedirect("allProductEditProduct.jsp?msg=deleted");
}
catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("allProductEditProduct.jsp?msg=notDeleted");
}
	%>