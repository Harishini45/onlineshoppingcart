<%@ page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<% 
int id = Integer.parseInt(request.getParameter("id"));
String name = request.getParameter("product_name");
String category = request.getParameter("category");
int price = Integer.parseInt(request.getParameter("price"));




String active = request.getParameter("active");
String activeValue = "No";
if (active != null && active.equals("on")) {
  activeValue = "Yes";
} else {
  activeValue = "No";
}

try (Connection con = ConnectionProvider.getConn();
     PreparedStatement st = con.prepareStatement("insert into product values(?,?,?,?,?)")) {
  st.setInt(1, id);
  st.setString(2, name);
  st.setString(3, category);
  st.setInt(4, price);
  st.setString(5, activeValue);
  
  st.executeUpdate();
  //if the product is set to no that means product is not availabe .in that cases we have to delete that product
  //and address is null means that it is not ordered so we can delete in that cases
  if(activeValue.equals("No")){
	  st.executeUpdate("delete from cart where product_id = '"+id+"' and address is NULL");
	  
  }
  response.sendRedirect("addNewProduct.jsp?msg=success");
} catch (Exception e) {
  e.printStackTrace(); // Log the error instead of printing to console
  response.sendRedirect("addNewProduct.jsp?msg=invalid");
}
%>