<!DOCTYPE html>
<html>

<head>
    <style>
        body {
            background-color: skyblue;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        center {
            margin-top: 50px;
        }

        h1 {
            color: #333;
        }

        table {
            border-collapse: collapse;
            width: 80%;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            background-color: #5c82ff;
            color: #fff;
            border: none;
            border-radius: 5px;
        }

        button:hover {
            background-color: #4561b5;
        }

        a {
            text-decoration: none;
        }
    </style>
</head>

<body>
    <center>
        <h1>DOCTORS DETAILS</h1>
        <br>

        <%@page import="java.sql.*" %>
        <%

        Class.forName("oracle.jdbc.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
        PreparedStatement pst=con.prepareStatement("select * from jyotishman.booking");

        ResultSet rs=pst.executeQuery();

        out.println("<table border='1'>");
        out.println("<tr>");
        out.println("<th>Doctors ID</th>");
        
        out.println("<th>Patient Mobile no</th>");
       
        out.println("</tr>");
        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getInt(1) + "</td>");
            out.println("<td>" + rs.getString(2) + "</td>");
            out.println("</tr>");
        }
        out.println("</table>");

        con.close();
        %>

        <br><br>
        
            <tr>
                <td><a href="admin.html"><button type="submit"><b>BACK TO DASHBOARD</b></button></a></td>
                <td><a href="home.html"><button type="submit"><b>BACK TO HOME</b></button></a></td>
            </tr>
        
    </center>
</body>

</html>
