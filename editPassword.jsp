<%@ include file = "editDetailsHeader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Website</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/008bc5f708.js" crossorigin="anonymous"></script>
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
      <form action = "editPasswordAction.jsp" method = "post">
        <div class="form-group">
        <%if("done".equals(msg)){ %>
        <h3  style="color:green;font-size:20px;text-align:center;">Password changed Successfully!</h3><%} %>
        <%if("invalid".equals(msg)){ %>
        <h3 class="alert" style="color:red;font-size:20px;text-align:center;">Some thing went wrong!<br> Try again!</h3><%} %>
          <label for="oldPassword">Old Password</label>
          <input type="password" class="form-control" name = "oldpwd" placeholder="Enter old password" required>
          <%if("wrong".equals(msg)){ %>
           <h3 class="alert" style="color:red;font-size:13px;">Your old Password is wrong!</h3>
         <%} %>
        </div>
        <div class="form-group">
          <label for="newPassword">New Password</label>
          <input type="password" class="form-control" name="newpwd" placeholder="Enter new password" required>
        </div>
        <div class="form-group">
          <label for="confirmPassword">Confirm Password</label>
          <input type="password" class="form-control" name="confirmpwd" placeholder="Confirm new password" required>
          <%
          if("notMatch".equals(msg)){
          %>
          <h3 class="alert" style="color:red;font-size:13px;">New Password and Confirm Password does not match!</h3><%} %>
        </div>
        <button type="submit" class="btn btn-primary btn-block" style="background-color:blue;border-radius:20px;">Save</button>
      </form>
    </div>
  </div>

  
</body>
</html>