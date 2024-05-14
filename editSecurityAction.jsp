<%@ page import="java.sql.*"%>
<%@ page import="project.ConnectionProvider"%>
<%
String email = session.getAttribute("email").toString();
String ques = request.getParameter("question");
String pwd = request.getParameter("password");
try{
Connection con = ConnectionProvider.getConn();
String sql = "update users set securityquestion = ? where email = ? and password = ?";
PreparedStatement pst  = con.prepareStatement(sql);
pst.setString(1,ques);
pst.setString(2, email);
pst.setString(3,pwd);
int rowsUpdated = pst.executeUpdate();
if (rowsUpdated > 0) {
 response.sendRedirect("editSecurity.jsp?msg=done");
}
else{
	response.sendRedirect("editSecurity.jsp?msg=invalid");
}
}
catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("editSecurity.jsp?msg=invalid");
}

%>