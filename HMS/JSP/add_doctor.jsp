<%@page import="java.sql.*" %>
<html>
<head>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin-top: 50px;
        }

        h2 {
            color: #4CAF50; 
        }

        p {
            color: #333;
        }

        a {
            color: #2196F3; 
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
        int daid = Integer.parseInt(request.getParameter("daid"));
        String nm = request.getParameter("nm");
        String email = request.getParameter("email");
        String dept = request.getParameter("dept");
        String fees = request.getParameter("fees");
        String drdate = request.getParameter("dt");
        String tm1 = request.getParameter("tm1");
        String tm2 = request.getParameter("tm2");

        Class.forName("oracle.jdbc.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "manager");
        PreparedStatement pst = con.prepareStatement("insert into jyotishman.DOCTORS_DETAILS values(?,?,?,?,?,?,?,?)");

        pst.setInt(1, daid);
        pst.setString(2, nm);
        pst.setString(3, email);
        pst.setString(4, dept);
        pst.setString(5, fees);
        pst.setString(6, drdate);
        pst.setString(7, tm1);
        pst.setString(8, tm2);

        int t = pst.executeUpdate();
        if (t > 0) {
    %>
            <h2>Insert Successfully</h2>
            <p><a href="managedoctor.html">Go Back</a></p>
    <%
        }
        con.close();
    %>
</body>
</html>

