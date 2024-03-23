<!DOCTYPE html>
<html>

<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
        }

        h1 {
            color: green;
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <center>
        <%@ include file="Connect.jsp" %>
        <%
        PreparedStatement pst=con.prepareStatement("insert into jyotishman.booking values(?,?)");
        pst.setInt(1,Integer.parseInt(request.getParameter("doctorsid")));
        pst.setString(2,(String)session.getAttribute("mob"));
        
        pst.executeUpdate();
        out.println("<h1>Your Appoientment Booked successfully</h1>");
        con.close();
        %>
        <a href="user_profile.jsp">Log out</a>
    </center>
</body>

</html>
