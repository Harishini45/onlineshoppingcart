<%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<%
String email = session.getAttribute("email").toString();
String subject = request.getParameter("subject");
String message = request.getParameter("message");
try{
	Connection con = ConnectionProvider.getConn();
	String sql = "insert into message(email,subject,body) values(?,?,?)";
	PreparedStatement pst  = con.prepareStatement(sql);
	pst.setString(1,email);
	pst.setString(2, subject);
	pst.setString(3,message);

	int rows = pst.executeUpdate();
	if(rows > 0){
		response.sendRedirect("messageUs.jsp?msg=valid");
	}
	else{
		response.sendRedirect("messageUs.jsp?msg=invalid");
	}
}
catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("messageUs.jsp?msg=invalid");
}
%>
