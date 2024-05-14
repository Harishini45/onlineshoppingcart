<%@ page import="java.sql.*"%>
<%@ page import="project.ConnectionProvider"%>
<%
String email = session.getAttribute("email").toString();
String  npwd = request.getParameter("newpwd");
String  opwd = request.getParameter("oldpwd");
String confirmpwd  = request.getParameter("confirmpwd");

try{
	
Connection con = ConnectionProvider.getConn();
String sql = "SELECT password FROM users WHERE email = ?";
PreparedStatement pst  = con.prepareStatement(sql);
pst.setString(1, email);

// Execute the query
ResultSet  rst = pst.executeQuery();
String oldpassword  =  "";
// Process the result set
while (rst.next()) {
	oldpassword=rst.getString("password");
}
if(!opwd.equals(oldpassword)){
	response.sendRedirect("editPassword.jsp?msg=wrong");
}
else if(!npwd.equals(confirmpwd)){
	response.sendRedirect("editPassword.jsp?msg=notMatch");
}
else{
	PreparedStatement pst2  = con.prepareStatement("update users set password=? where email = ?");
	pst2.setString(1,npwd);
	pst2.setString(2,email);
	pst2.executeUpdate();
response.sendRedirect("editPassword.jsp?msg=done");
}
}
catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("editPassword.jsp?msg=invalid");
}

%>