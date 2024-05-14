<%@ page language="java" import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<% 
int id = Integer.parseInt(request.getParameter("id"));
String  email = request.getParameter("email");
String status = "Delivered";
try{
Connection con = ConnectionProvider.getConn();
Statement st = con.createStatement();
st.executeUpdate("update products_ordered set status ='"+status+"' where order_id='"+id+"' and email = '"+email+"'");
response.sendRedirect("ordersReceived.jsp?msg=delivered");
}
catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("ordersReceived.jsp?msg=invalid");
	
}
%>