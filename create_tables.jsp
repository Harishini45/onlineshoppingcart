<%@ page import="java.sql.*"%>
<%@ page import="project.ConnectionProvider"%>
<%
try{
	Connection con = ConnectionProvider.getConn();
	Statement st = con.createStatement();
	String q1 = "create table users(name varchar(100),email varchar(150) primary key,mobilenumber bigint,securityquestion varchar(250),answer varchar(100),password varchar(100),address varchar(500),city varchar(100),state varchar(100),country varchar(100))";
	String q2 = "create table product(id int,name varchar(500),category varchar(200),price int,active varchar(10))";
	String q3 = "create table cart(email varchar(150),product_id int,quantity int,price int,total int,address varchar(500),city varchar(100),state varchar(100),country varchar(100),mobileNumber varchar(20),orderDate varchar(100),deliveryDate varchar(100),paymentMethod varchar(100),transactionId varchar(100),status varchar(10))";
	String q4 = "create table message(id int auto_increment primary key,email varchar(150),subject varchar(300),body varchar(1000))";
	String q5 = "create table products_ordered(email varchar(150),product_id int,quantity int,price int,total int,address varchar(500),city varchar(100),state varchar(100),country varchar(100),mobileNumber varchar(20),orderDate varchar(100),deliveryDate varchar(100),paymentMethod varchar(100),transactionId varchar(100),status varchar(10))";
	System.out.println(q1);
	System.out.println(q2);
	System.out.println(q3);
	System.out.println(q4);
	//st.execute(q1);
//	st.execute(q2);
	//st.execute(q3);
	st.execute(q5);
	System.out.println("table created successfully");
	con.close();
	
	
	
}
catch(Exception e){
	e.printStackTrace();
}
%>
