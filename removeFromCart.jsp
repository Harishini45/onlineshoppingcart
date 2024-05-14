<%@ page import = "project.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>
<%
String email = session.getAttribute("email").toString();
int id = Integer.parseInt(request.getParameter("id"));
try{
	Connection con = ConnectionProvider.getConn();
	Statement st = con.createStatement();
//ResultSet rs = st.executeQuery();
st.executeUpdate("delete from cart where product_id='"+id+"' and email = '"+email+"'");
response.sendRedirect("myCart.jsp?msg=removed");
}
catch(Exception e){
	e.printStackTrace();
	
}
%>