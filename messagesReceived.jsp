<%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider" %>
<%@ include file="adminHeader.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Cart</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: blue;
            color: white;
        }

        .table .thead-dark tr th {
            background-color: white;
            color: black;
        }

        .table tbody th,
        .table tbody td {
            background-color: white;
            color: black;
        }

        .msg, .alert {
            position: absolute;
            margin-top: 25px;
            font-size: 20px;
            left: 50%;
            padding: 5px;
            transform: translateX(-50%);
            text-align: center;
        }

        h1 {
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container">
    <h1 class="mt-5">Messages Received <i class="bi bi-chat-square-fill"></i></h1>
    <div class="row mt-4">
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>EMAIL</th>
                    <th>SUBJECT</th>
                    <th>BODY</th>
                </tr>
            </thead>
            <tbody>
                <%  
                    try {
                        Connection con = ConnectionProvider.getConn();
                        PreparedStatement stmt = con.prepareStatement("SELECT * FROM message");
                        ResultSet rs = stmt.executeQuery();
                        while (rs.next()) {
                %>
                            <tr>
                                <td><%= rs.getInt("id") %></td>
                                <td><%= rs.getString("email") %></td>
                                <td><%= rs.getString("subject") %></td>
                                <td><%= rs.getString("body") %></td>
                            </tr>
                <% 
                        }
                        rs.close();
                        stmt.close();
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

<%@ include file="/footer.jsp" %>

</body>
</html>
