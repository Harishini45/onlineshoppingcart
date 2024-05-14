<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
 <html lang="en">
  <head> 
  <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<title>Reset Password</title> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
 <link rel="stylesheet" href="style.css"> 
 </head> 
 <body> 
  <% 
        String msg = request.getParameter("msg");
        if (msg != null) {
          if ("valid".equals(msg)) {
      %>
            <h1 style="color: green;">Successfully Registered</h1>
      <% 
          } else if ("invalid".equals(msg)) {
      %>
            <h1 style="color: red;">Something went wrong! Try again!</h1>
      <% 
          }
        }
      %>
            <div class="container">
 <div class="reset-password-form"> 
 <h1>SignUp</h1>
  <form action="signupaction.jsp" method = "post">
  <div class="mb-3"> 
   <label for="name" class="form-label">Username</label>
    <input type="text" name="name" class="form-control" id="name" placeholder="Enter your username" required>
     </div>
   <div class="mb-3"> 
   <label for="email" class="form-label">Email</label>
    <input type="email" name="email" class="form-control" id="email" placeholder="Enter your email" required>
     </div>
      <div class="mb-3"> 
      <label for="phone" class="form-label">Phone number</label> 
      <input type="number" name="mobilenumber" class="form-control" id="phone" placeholder="Enter your phone number" required> 
      </div>
       <div class="mb-3">
        <label for="securityQuestion" class="form-label">Security Question</label> 
        <select name="securityquestion" class="form-select" id="securityQuestion" required>
         <option value="">Select security question</option> <option value="what was your first car?">What was your first car?</option>
          <option value="what is the name of your first pet?">What is the name of your first pet?</option>
          
           <option value="what elementary school did you attend?">What elementary school did you attend?</option> 
           <option value="what is the name of the town where you were born?">What is the name of the town where you were born?</option>
            </select> </div> <div class="mb-3"> 
            <label for="answer" class="form-label">Answer</label>
             <input type="text" name="answer" class="form-control" id="answer" placeholder="Enter your answer" required>
              </div> <div class="mb-3"> <label for="newpassword" class="form-label">Password</label>
               <input type="password" name="password" class="form-control" id="newpassword" placeholder="Enter your new password" required> 
               </div>
                <button type="submit" class="btn btn-primary" style="background-color:purple">Signup</button>
               <a href="login.jsp"
                      style="color: #393f81;margin-left:10px;">Login</a>

  </form>
    