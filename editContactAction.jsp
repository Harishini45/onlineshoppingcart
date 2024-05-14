<%@ page import="java.sql.*"%>
<%@ page import="project.ConnectionProvider"%>
<%
String email = session.getAttribute("email").toString();
String number = request.getParameter("number");
String pwd = request.getParameter("password");
try{
Connection con = ConnectionProvider.getConn();
String sql = "update users set mobilenumber = ? WHERE email = ? and password = ?";
PreparedStatement pst  = con.prepareStatement(sql);
pst.setString(1, number);
pst.setString(2, email);
pst.setString(3, pwd);
int rowsUpdated = pst.executeUpdate();
if (rowsUpdated > 0) {
response.sendRedirect("editContact.jsp?msg=done");
}
else{
	response.sendRedirect("editContact.jsp?msg=invalid");	
}
}
catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("editContact.jsp?msg=invalid");
}

%>