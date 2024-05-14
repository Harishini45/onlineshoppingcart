<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page errorPage = "error.jsp" %>
<%
String email = session.getAttribute("email").toString();
String address = request.getParameter("address");
String state = request.getParameter("state");
String city=request.getParameter("city");
String country = request.getParameter("country");
String mobilenumber = request.getParameter("m_number");
String paymentMethod = request.getParameter("payment-method");
String trans_id = "";
trans_id = request.getParameter("transactionID");
String status ="bill";
try{
	Connection con = ConnectionProvider.getConn();
	PreparedStatement pst = con.prepareStatement("update users set address = ?,city= ?,state= ?,country=?,mobilenumber=? where email = ?");
	pst.setString(1,address);
	pst.setString(2,city);
	pst.setString(3,state);
	pst.setString(4,country);
	pst.setString(5,mobilenumber);
	pst.setString(6,email);
	pst.executeUpdate();
	PreparedStatement ps1 = con.prepareStatement("update cart set address = ?,city=?,state=?,country=?,mobileNumber=?,orderDate=now(),deliveryDate = DATE_ADD(orderDate,INTERVAL 7 DAY),paymentMethod=?,transactionId=?,status=? where email = ?");
	ps1.setString(1,address);
	ps1.setString(2,city);
	ps1.setString(3,state);
	ps1.setString(4,country);
	ps1.setString(5,mobilenumber);
	ps1.setString(6, paymentMethod);
	ps1.setString(7,trans_id);
	ps1.setString(8,status);
	ps1.setString(9,email);
	ps1.executeUpdate();
	response.sendRedirect("bill.jsp");
}
catch(Exception e){
	e.printStackTrace();
	
}

%>