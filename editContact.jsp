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
      <form action = "editContactAction.jsp" method="post">
        <div class="form-group">
         <%if("done".equals(msg)){ %>
        <h3  style="color:green;font-size:20px;text-align:center;">Your Mobile Number Successfully Changed!</h3><%} %>
          <label >Enter Your New Mobile Number</label>
          <input type="text" class="form-control" name = "number" placeholder="Enter Your New Mobile Number" required>
        </div>
        
        <div class="form-group">
          <label >Enter Password</label>
          <input type="password" class="form-control" name = "password" placeholder="Enter Password" required>
           <%if("invalid".equals(msg)){ %>
           <h3  style="color:red;font-size:15px;text-align:center;">Your Password is wrong!</h3><%} %>
        </div>
        <button type="submit" class="btn btn-primary btn-block" style="background-color:blue;border-radius:20px;">Save</button>
      </form>
    </div>
  </div>
</body>
</html>