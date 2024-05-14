<%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Message Us</title>
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Bootstrap Icons CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
    body{
    background-color:blue;
    }
    
    </style>
</head>
<body >
<% String msg = request.getParameter("msg"); %>
<%if ("valid".equals(msg)){ %>
<h3 style="text-align:center;color:yellow;font-weight:bold;font-size:20px;">Message successfully sent.Our team will contact you soon!</h3><%} %>
<%if ("invalid".equals(msg)){ %>
<h3 style="text-align:center;color:white;font-weight:bold;font-size:20px;">Some thing Went Wrong! Try Again!</h3><%} %>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h3 class="mb-0">Message Us <i class="bi bi-chat-square-fill"></i></h3>
                    </div>
                    <div class="card-body">
                        <form action="messageUsAction.jsp" method="post">
                            <div class="form-group">
                                <label for="subject">Subject:</label>
                                <input type="text" class="form-control" id="subject" name="subject" required>
                            </div>
                            <div class="form-group">
                                <label for="message">Message:</label>
                                <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Send</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<%@ include file="footer.jsp" %>



