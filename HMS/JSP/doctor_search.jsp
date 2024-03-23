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
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }
        tr:hover{
            background-color: #cdef75;
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
        <h1>DOCTORS DETAILS</h1>
        <br>

        <%@page import="java.sql.*" %>
        <%
        String nm=request.getParameter("nm");
        Class.forName("oracle.jdbc.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
        PreparedStatement pst=con.prepareStatement("select * from jyotishman.DOCTORS_DETAILS where NAME=?");
        pst.setString(1,nm);
        ResultSet rs=pst.executeQuery();

        out.println("<table border='1'>");
        out.println("<tr>");
        out.println("<th>Doctors ID</th>");
        out.println("<th>Name</th>");
        out.println("<th>Email ID</th>");
        out.println("<th>Dept</th>");
        out.println("<th>Fees</th>");
        out.println("<th>Date</th>");
        out.println("<th>Time</th>");
        out.println("<th>To</th>");
        out.println("<th>BOOK Appoinment</th>");
        out.println("</tr>");
        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getInt(1) + "</td>");
            out.println("<td>" + rs.getString(2) + "</td>");
            out.println("<td>" + rs.getString(3) + "</td>");
            out.println("<td>" + rs.getString(4) + "</td>");
            out.println("<td>" + rs.getString(5) + "</td>");
            out.println("<td>" + rs.getString(6) + "</td>");
            out.println("<td>" + rs.getString(7) + "</td>");
            out.println("<td>" + rs.getString(8) + "</td>");
            out.println("<td><a href=booking.jsp><button type=submit><b>Book</b></button></a></td>");

            out.println("</tr>");
        }
        out.println("</table>");

        con.close();
        %>

        <br><br>
        
            <tr>
                <a href="user_profile.html">Go Back</a>
            </tr>
        
    </center>
</body>
</html>
