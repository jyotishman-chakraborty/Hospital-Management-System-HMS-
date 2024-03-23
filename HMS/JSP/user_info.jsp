<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            background-color: #a0cfea;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        center {
            margin-top: 20px;
        }

        h1 {
            color: #333;
        }

        table {
            border-collapse: collapse;
            width: 80%;
            margin-top: 20px;
            margin-bottom: 20px;
            background-color: #fff;
    
            box-shadow: 0 8px 16px rgba(12, 72, 222, 0.362);
        }

        tr:hover{
            background-color: #cdef75;
        }

        th, td {
            border: 3px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }
        a {
            color: #b41919; 
            text-decoration: none;
            font-weight: bold;
            font-size: medium;
        }

        a:hover {
            color: #1565C0; 
        }

        
    </style>
</head>

<body>
    <center>
        <h1>USER INFORMATION</h1>
        <br>

        <%@page import="java.sql.*" %>
        <%
        Class.forName("oracle.jdbc.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
        PreparedStatement pst=con.prepareStatement("select NAME,MOB,EMAIL from jyotishman.USER_REG");
        
        ResultSet rs=pst.executeQuery();
        out.println("<table>");
        out.println("<tr>");
        out.println("<th>Name</th>");
        out.println("<th>MOB</th>");
        out.println("<th>Email ID</th>");
        out.println("</tr>");
        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getString(1) + "</td>");
            out.println("<td>" + rs.getString(2) + "</td>");
            out.println("<td>" + rs.getString(3) + "</td>");
            out.println("</tr>");
        }
        out.println("</table>");
        con.close();
        %>

        <br><br>
        
            <tr>
                <a href="admin.html">Go Back</a>
            </tr>
        
    </center>
</body>

</html>
