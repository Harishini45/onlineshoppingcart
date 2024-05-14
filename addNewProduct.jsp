<%@page import = "project.ConnectionProvider" %>
<%@page import ="java.sql.*" %>
    <%@include file="adminHeader.jsp" %>
    <%@include file="/footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
background-color:white;

}
.navbar-light .navbar-nav .nav-link {
      color: black;
      font-weight:bold;
      font-size:15px;
      
    }
   .centered-text {
    position: absolute;
   margin-top:45px;
   left:50%;
   padding:0px;
    transform: translate(-50%, -50%);
    text-align: center;
}
.msg{

 position: absolute;
 margin-top:30px;
 font-size:15px;
 left:80%;
 color:green;
 
}
.alert{
color:red;

font-size:20px;
 position: absolute;
   margin-top:10px;
   left:50%;
   padding:5px;
    transform: translate(-50%, -50%);
    text-align: center;

}
   
</style>
</head>
<body>
   <%String msg = request.getParameter("msg"); %>
   <%if(msg != null && msg.equals("success") ){%>
 <h3 class ="msg">Product Added Successfully</h3>
<%}%>
<%if(msg != null && msg.equals("invalid") ){%>
<h3 class ="alert">Some thing went wrong! Try again</h3> 
<%}%>
 <%
   int id = 1;
   try{
	   Connection con = ConnectionProvider.getConn();
	   Statement st = con.createStatement();
	   ResultSet rs = st.executeQuery("select max(id) from product");
	   while(rs.next()){
		   id = rs.getInt(1);
		   id=id+1;
	   }
   }
   catch(Exception e){
	   e.printStackTrace();
   }
   
   
   %>
<div class="centered-text">
   <h3 >Product ID:<% out.print(" "+id);%> </h3>
   </div>
  
  <div class="container mt-5">
    
        <form action = "addNewProductAction.jsp?id=<%= id %>" method="post" >
            <div class="form-group">
                <label for="productName">Product Name</label>
                <input type="text" name = "product_name" class="form-control" id="productName" placeholder="Enter product name">
            </div>
            <div class="form-group">
                <label for="productCategory">Product Category</label>
                <input type="text" name="category" class="form-control" id="productCategory" placeholder="Enter product category">
            </div>
            
            <div class="form-group">
                <label for="productPrice">Product Price</label>
                <input type="number" name="price" class="form-control" id="productPrice" placeholder="Enter product price">
            </div>
            <div class="form-group form-check">
                <input type="checkbox" name="active" class="form-check-input" id="active">
                <label class="form-check-label" for="active">Active</label>
            </div>
            <button type="submit" class="btn btn-primary">Add Product</button>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoJtKh7z7lGz7fuP4F8nfdFvAOA6Gg/z6Y5J6XqqyGXYM2ntX5" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>



</body>
</html>