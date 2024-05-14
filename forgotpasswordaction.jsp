<%@ page import = "java.sql.*" %>
<%@ page import ="project.ConnectionProvider" %>
<%
String email = request.getParameter("email");
String mobilenumber = request.getParameter("mobilenumber");
String securityquestion = request.getParameter("securityquestion");
String answer = request.getParameter("answer");
String newpassword = request.getParameter("newpassword");
try{
	Connection con = ConnectionProvider.getConn();
	String q1 = "select *from users where email = '"+email +"'and mobilenumber = '"+mobilenumber+"' and securityquestion = '"+securityquestion+"' and answer = '"+answer+"';";
	System.out.println(q1);
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(q1);
	if(rs.next()){
		String q2 = "update users set password = '"+newpassword+"' where email = '"+email+"'";
		st.executeUpdate(q2);
		response.sendRedirect("forgotpassword.jsp?msg=done");
	}
	else{
		response.sendRedirect("forgotpassword.jsp?msg=invalid");
	}
	
}
catch(Exception e){
	e.printStackTrace();
	
}

%>
