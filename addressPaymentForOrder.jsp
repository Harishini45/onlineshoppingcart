<%@ include file="footer.jsp" %>
<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page errorPage="error.jsp" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script>
    if(WINDOW.history.forward(1) != null)
    	window.history.forward(1);
    
    </script>
    <style>
    hr {
        background-color: white;
    }
    .col-md-6 input {
        border: 2px solid grey;
        border-radius: 1px;
    }
    body {
        padding-bottom: 100px; /* Adjust padding to accommodate footer */
        background-color: blue;
    }
    .content-area {
        min-height: calc(100vh - 100px); /* Adjust height to accommodate footer */
        overflow-y: auto;
        padding: 20px; /* Add some padding for content spacing */
    }
    .footer {
        position: fixed;
        left: 0;
        bottom: 0;
        width: 100%;
        background-color: white;
        color: white;
        text-align: center;
        padding: 10px 0;
    }
    .footer p{
    color:black;
    font-weight:bold;}
    .table .thead-dark tr th {
        background-color: white;
        color: black;
    }
    h3 {
        text-align: center;
        font-size: 16px;
        color: red;
    }
    h4 {
        font-size: 15px;
    }
    .table tbody th,
    .table tbody td {
        background-color: white;
        color: black;
    }
    .btn-primary {
        padding-left: 140px;
        padding-right: 140px;
        padding-top:5px;
        padding-bottom:5px;
       
        
        margin-left: 0px;
        margin-top: 30px;
        border-radius:20px;
        background-color:#1E90FF;
        
    }
    #right {
        margin-left: 30px;
    }
    #left {
        margin-left: 30px;
    }
    </style>
</head>
<body>

<%
try {
    String email = session.getAttribute("email").toString();
    Connection con = ConnectionProvider.getConn();
    int total = 0;
    int sno = 0;
    PreparedStatement stmt = con.prepareStatement("SELECT sum(total) FROM cart where email = ?");
    stmt.setString(1, email);
    ResultSet rs = stmt.executeQuery();
    while (rs.next()) {
        total = rs.getInt(1);
    }

    PreparedStatement rs2 = con.prepareStatement("SELECT product.*, cart.quantity, cart.total FROM product INNER JOIN cart ON product.id = cart.product_id AND cart.email = ?");
    rs2.setString(1, email);
    ResultSet rs3 = rs2.executeQuery();
%>

<div class="content-area">
    <div class="container">
        <div class="row mt-4">
            <table class="table">
                <thead class="thead-dark">
                <tr>
                    <th style="color: violet;"><a href="myCart.jsp"><i class="bi bi-arrow-90deg-left"></i> BACK</a></th>
                    <th style="background-color: yellow;">TOTAL : <i class="bi bi-currency-rupee"></i> <%= total %></th>
                </tr>
                <tr>
                    <th>S.NO</th>
                    <th>PRODUCT NAME</th>
                    <th>CATEGORY</th>
                    <th>PRICE</th>
                    <th>QUANTITY</th>
                    <th>SUB TOTAL</th>
                </tr>
                </thead>
                <tbody>
                <% 
                while (rs3.next()) {
                    sno++;
                    total += rs3.getInt("total"); // Accumulate total
                %>
                <tr>
                    <td><%= sno %></td>
                    <td><%= rs3.getString("name") %></td>
                    <td><%= rs3.getString("category") %></td>
                    <td><i class="bi bi-currency-rupee"></i> <%= rs3.getString("price") %></td>
                    <td><%= rs3.getInt("quantity") %></td>
                    <td><i class="bi bi-currency-rupee"></i><%= rs3.getInt("total") %></td>
                </tr>
                <% } %>
                </tbody>
            </table>
            <%
            Statement st = con.createStatement();
            ResultSet rs4 = st.executeQuery("select *from users where email = '"+email+"'");
          
           while(rs4.next()){
    %>
            
               <form action="addressPaymentForOrderAction.jsp" method="post">
               <hr>
                <div class="row mt-4" style="color:white;font-weight:bold;">
                    <div class="col-md-6">
               <label for="address" id="left">Enter Address:</label>
            <input type="text" class="form-control" id="left" value="<%=rs4.getString(7) %>"  name="address" placeholder = "Enter Address" required>
                    </div>
                    <div class="col-md-6">
                        <label for="city" id="right">Enter City:</label>
                        <input type="text" class="form-control" id="right"  value="<%=rs4.getString(8) %>"name="city" placeholder = "Enter City"  required>
                    </div>
                    <div class="col-md-6">
                        <label for="state" id="left">Enter State:</label>
                        <input type="text" class="form-control" id="left" name="state" value="<%=rs4.getString(9) %>" placeholder = "Enter State" required>
                         <div class="text-center">
        <h3>*if there is no address it means that you did not set your address!</h3>
    </div>
                    </div>
                 
               
                    <div class="col-md-6">
                        <label for="country" id="right">Enter Country:</label>
                        <input type="text" class="form-control" id="right"  name="country" value="<%=rs4.getString(10) %>"  placeholder = "Enter Country" required>
                        
                            <div class="text-center">
        <h3>*This address will also be updated to your profile</h3>
    </div>
                    </div>
                    
             
                       
                    <%} %>
                    <div class="col-md-6">
                    
                 
                        <hr>
                <label for="payment-method" id="left">Select way of Payment:</label>
                <select class="form-control" id="left" name="payment-method" required>
                    <option value="cash">Cash on Delivery</option>
                    <option value="online">Online Payment</option>
                </select>
            </div>
             <hr>
            
            <div class="col-md-6">
                <hr>
                <label for="pay-online" id="right">Pay Online on this haritech@pay.com:</label>
                <input type="text" class="form-control" id="right" name="transactionID" placeholder="haritech@pay.com">
                <h3>If you select online Payment then enter your tansaction ID here  </h3>
                <h3> otherwise leave the blank</h3>
                 
            </div>
           
            <div class="col-md-6" style="margin-top:20px;">
          <hr>
                        <label for="country" id="right">Mobile Number:</label>
                        <input type="text" class="form-control" id="left"  name="m_number"   placeholder = "Enter Mobile Number" required>
                        <h3>*This mobile number wil also updated to your profile</h3>
                        </div>
                         
                        <div class="col-md-6"  style="margin-top:20px;">
                        <hr>
                           <button id = "right"type="submit"  class="btn-primary" >Proceed to Generate Bill & Save<i class="bi bi-arrow-right-circle"></i></button>
                           <h3>*If you enter wrong transaction id then your order will gets Cancel!</h3>
                           <h3>*To avoid cancellation fill form correctly</h3>
                        </div>
            
                        </div>
                     
                        </form>
                       
        </div>
         
                    
    </div>
</div>

<%
rs4.close();
    rs3.close(); // Close ResultSet
    rs2.close(); // Close PreparedStatement
}
catch (Exception e) {
    e.printStackTrace();
}
%>
<div class="footer bg-light">
    <p>All rights Reserved&copy; haritech</p>
</div>


</body>
</html>
