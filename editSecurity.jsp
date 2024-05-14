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
 <div class="center-content">
    <div class="form-container">
    <%String msg = request.getParameter("msg"); %>
      <form action = "editSecurityAction.jsp" method = "post">
        <div class="form-group">
         <%if("done".equals(msg)){ %>
        <h3  style="color:green;font-size:20px;text-align:center;">Your Security Question  Successfully Changed!</h3><%} %>
          <label >Select Your New Security Question</label>
          
             <select class="form-control"  name="question" required>
             <option value="what was your first car?">What was your first car?</option>
          <option value="what is the name of your first pet?">What is the name of your first pet?</option>
          
           <option value="what elementary school did you attend?">What elementary school did you attend?</option> 
           <option value="what is the name of the town where you were born?">What is the name of the town where you were born?</option>
                </select>
        </div>
        <div class="form-group">
          <label for="answer">Enter Your New Answer</label>
          <input type="text" class="form-control"name = "answer"  placeholder="enter answer" required>
        </div>
        <div class="form-group">
          <label for="confirmPassword">Enter Password (For Security)</label>
          <input type="password" class="form-control" name = "password"  required>
           <%if("invalid".equals(msg)){ %>
           <h3  style="color:red;font-size:15px;text-align:center;">Your Password is wrong!</h3><%} %>
          
        </div>
      
        <button type="submit" class="btn btn-primary btn-block" style="background-color:blue;border-radius:20px;">Save</button>
      </form>
    </div>
  </div>
</body>
</html>