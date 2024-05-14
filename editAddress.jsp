<%@ include file = "editDetailsHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
background-color:blue;}
label{
font-weight:bold;}
</style>
</head>
<body>
<%String msg = request.getParameter("msg"); %>
 <div class="center-content">
    <div class="form-container">
      <form action = "editAddressAction.jsp" method="post">
        <div class="form-group">
        <%if("done".equals(msg)){ %>
        <h3  style="color:green;font-size:20px;text-align:center;">Address Successfully Updated!</h3><%} %>
        <%if("invalid".equals(msg)){ %>
        <h3  style="color:red;font-size:20px;text-align:center;">Some thing went wrong!<br> Try again!</h3><%} %>
          <label >Enter Address</label>
          <input type="text" class="form-control" name = "address" placeholder="enter address" required>
        </div>
        <div class="form-group">
          <label >Enter City</label>
        <input type="text" class="form-control" name = "city" placeholder="enter city" required>
        </div>
        <div class="form-group">
          <label>Enter State</label>
          <input type="text" class="form-control" name = "state"  placeholder="enter state" required>
        </div>
        <div class="form-group">
          <label >Enter Country</label>
          <input type="text" class="form-control" name = "country"  placeholder="enter country" required>
        </div>
        <button type="submit" class="btn btn-primary btn-block" style="background-color:blue;border-radius:20px;">Save</button>
      </form>
    </div>
  </div>
</body>
</html>