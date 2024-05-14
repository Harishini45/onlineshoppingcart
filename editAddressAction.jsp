<%@ page import="java.sql.*"%>
<%@ page import="project.ConnectionProvider"%>
<%
String email = session.getAttribute("email").toString();
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country = request.getParameter("country");
try{
Connection con = ConnectionProvider.getConn();
String sql = "update users set address=?,state=?,city=?,country=? WHERE email = ?";
PreparedStatement pst  = con.prepareStatement(sql);
pst.setString(1,address);
pst.setString(2,state);
pst.setString(3,city);
pst.setString(4,country);
pst.setString(5, email);
int rowsUpdated = pst.executeUpdate();
if (rowsUpdated > 0) {
response.sendRedirect("editAddress.jsp?msg=done");
}
else{
	response.sendRedirect("editAddress.jsp?msg=invalid");
}
}
catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("editAddress.jsp?msg=invalid");
}

%>