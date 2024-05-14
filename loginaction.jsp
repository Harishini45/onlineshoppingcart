<%@ page import = "java.sql.*" %>
<%@ page import ="project.ConnectionProvider" %>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");
if("adminhari18@gmail.com".equals(email) && "admin123".equals(password)){
	session.setAttribute("email",email);
	response.sendRedirect("admin/adminHome.jsp");
}
else{
	

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    con = ConnectionProvider.getConn();
    String q1 = "SELECT * FROM users WHERE email = ? AND password = ?";
    ps = con.prepareStatement(q1);
    ps.setString(1, email);
    ps.setString(2, password);
    rs = ps.executeQuery();
    
    if (rs.next()) {
        session.setAttribute("email",email);
        response.sendRedirect("home.jsp");
    } else {
      response.sendRedirect("login.jsp?msg=notexist");
    }
}
catch (SQLException e) {
    e.printStackTrace();
    response.sendRedirect("login.jsp?msg=invalid");
} 
}
%>
