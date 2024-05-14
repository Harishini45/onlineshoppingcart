<%@page errorPage="error.jsp" %>
<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Website</title>
  <!-- Bootstrap CSS -->
  <style>
  
  section{
  background-color:#FFD700;
  margin-left:180px;
  margin-right:180px;
  
  }
  
  </style>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  </head>
  <body>
<section class="py-3 py-md-5">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-12 col-lg-9 col-xl-8 col-xxl-7">
        <div class="row gy-3 mb-3">
          <div class="col-6">
            <h2 class="text-uppercase text-endx m-0">Invoice</h2>
          </div>
          <div class="col-6">
            <a class="d-block text-end" href="#!">
              
            </a>
          </div>
          <div class="col-12">
            <h4>From</h4>
            <address>
              <strong>admin</strong><br>
              87, main road,<br>
              pudumavilangai, 631203<br>
              India<br>
              Phone: 8838322303<br>
              Email: admin123@gmail.com
            </address>
          </div>
        </div>
        <%
          String email = session.getAttribute("email").toString();
        int total_amount = 0;
                try{
                Connection con = ConnectionProvider.getConn();
                Statement st = con.createStatement();
                ResultSet rst = st.executeQuery("select *from users where email = '"+email+"'");
                while(rst.next()){
                %>
        <div class="row mb-3">
          <div class="col-12 col-sm-6 col-md-8">
            <h4>Bill To</h4>
            <address>
              <strong><%= rst.getString("name") %></strong><br>
              <%= rst.getString("state") %><br>
              
              <%=rst.getString("country") %><br>
              Phone: <%= rst.getString("mobilenumber")%> <br>
              Email: <%= rst.getString("address") %>
            </address>
          </div>
          <div class="col-12 col-sm-6 col-md-4">
            <h4 class="row">
            <%}
            
            ResultSet rs5 = st.executeQuery("select *from cart where email = '"+email+"' and status = 'bill'");
            if(rs5.next()){
            
            
            %>
              <span class="col-6"> Transaction ID:</span>
              <span class="col-6 text-sm-end"></span>
            </h4>
            <div class="row">
              <span class="col-6">Account</span>
              <span class="col-6 text-sm-end"><%= rs5.getString("email")%></span>
              
              <span class="col-6">Invoice Date</span>
              <span class="col-6 text-sm-end"><%= rs5.getString("orderDate")%></span>
              <span class="col-6">Delivery Date</span>
              <span class="col-6 text-sm-end"><%= rs5.getString("deliveryDate") %></span>
              <%} %>
            </div>
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-12">
            <div class="table-responsive">
              <table class="table table-striped">
                <thead>
                  <tr>
                    <th scope="col" class="text-uppercase">S.No</th>
                    <th scope="col" class="text-uppercase">Product Name</th>
                    <th scope="col" class="text-uppercase text-end">Category</th>
                    <th scope="col" class="text-uppercase text-end">Price</th>
                    <th scope="col" class="text-uppercase text-end">Quantity</th>
                    <th scope="col" class="text-uppercase text-end">Sub Total</th>
                  </tr>
                </thead>
                <%
              
                int total = 0;
                int sno = 0;
                PreparedStatement stmt = con.prepareStatement("SELECT sum(total) FROM cart where email = ? and status='bill'");
                stmt.setString(1, email);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    total = rs.getInt(1);
                }
               
                PreparedStatement sst = con.prepareStatement("SELECT product.*, cart.quantity, cart.total FROM product INNER JOIN cart ON product.id = cart.product_id WHERE cart.email = ? AND cart.status='bill'");
                sst.setString(1, email); // Set the value of the parameter
                ResultSet rs2 = sst.executeQuery();
         
                
                while(rs2.next()){
                	sno +=1;
                	total_amount+=rs2.getInt("total");
                %>
                <tbody class="table-group-divider">
                  <tr>
                
                    <th scope="row"><%= sno%></th>
                    <td><%= rs2.getString("name")%></td>
                    <td class="text-end"><%= rs2.getString("category")%></td>
                    <td class="text-end"><i class="bi bi-currency-rupee"></i> <%= rs2.getInt("price") %></td>
                    <td class="text-end"><%= rs2.getInt("quantity") %></td>
                    <td class="text-end"><i class="bi bi-currency-rupee"></i> <%= rs2.getInt("total") %></td>
                  </tr>
                  <%} 
                rs2.close();
                rs.close();
                rs5.close();
                rst.close();
                  }
                  catch(Exception e){
                	  e.printStackTrace();
                  }
                  
                  %>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      <div class="col-12 text-end">
    <h2 style ="margin-left:200px;">Total: <i class="bi bi-currency-rupee"></i> <%= total_amount %></h2>
</div>
<div class="col-12 text-end">
  <a href="continueShopping.jsp">  <button  class="btn btn-danger mb-3 mt-15" style="padding-left:200px;padding-right:200px;border-radius:25px;text-align:center;margin-left:20px;background-color:rgba(0, 100, 0, 0.5);color:black;font-weight:bold;">Continue Shopping</button> </a>
  <a onclick ="window.print();">  <button type="submit" class="btn btn-success mb-3 mt-15" style="padding-left:230px;padding-right:275px;border-radius:25px;margin-left:20px;background-color:rgba(0, 100, 0, 0.5);color:black;font-weight:bold;text-align:center;">Print</button></a>
</div>
      </div>
    </div>
  </div>
</section>
</body>
</html>