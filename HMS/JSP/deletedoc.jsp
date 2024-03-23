<%@page import="java.sql.*" %>
<html>
<head>
    <style>
        body {
            background-color: #f5f5f5;
            font-family: 'Arial', sans-serif;
            text-align: center;
            margin-top: 50px;
        }

        h2 {
            color: #d32f2f; 
        }

        p {
            color: #333;
        }

        a {
            color: #1976D2; 
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            color: #1565C0; 
        }
    </style>
</head>
<body>
    <%
        int doctorsid = Integer.parseInt(request.getParameter("doctorsid"));
        Class.forName("oracle.jdbc.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "system", "manager");
        PreparedStatement pst = con.prepareStatement("delete from jyotishman.DOCTORS_DETAILS where DOCTORS_ID=?");
        pst.setInt(1, doctorsid);
        int t = pst.executeUpdate();
        if (t > 0) {
    %>
            <center>
                <h2>Deleted Successfully</h2>
                <p><a href="admin.html">Go Back</a></p>
            </center>
    <%
        } else {
    %>
            <center>
                <h2>Invalid User I'd Or Password</h2>
                <p><a href="deletedoc.html">Go Back</a></p>
            </center>
    <%
        }
        con.close();
    %>
</body>
</html>
