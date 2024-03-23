<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Doctor Details</title>
    <style>
        body {
            
            background-color: #37c3a2;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
        }

        form {
            margin: 20px auto;
            width: 50%;
            background-color: #37c3a2;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table,
        th,
        td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        input[type="text"],
        input[type="email"],
        input[type="date"],
        input[type="time"] {
            width: calc(100% - 16px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 10px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        h1 {
            color: #ff0000;
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
    <%
    int doctorsid = Integer.parseInt(request.getParameter("doctorsid"));
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "manager");
    PreparedStatement pst = con.prepareStatement("select * from jyotishman.DOCTORS_DETAILS where DOCTORS_ID=?");
    pst.setInt(1, doctorsid);
    ResultSet rs = pst.executeQuery();
    if (rs.next()) {
    %>
        <form action="updatedoctor2.jsp" method="post">
            <table>
                <tr>
                    <td>Doctor's ID:</td>
                    <td><input type="text" name="doctorsid" value="<%=rs.getInt(1) %>" readonly></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="nm" value="<%=rs.getString(2) %>"></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="email" name="email" value="<%=rs.getString(3) %>"></td>
                </tr>
                <tr>
                    <td>Department:</td>
                    <td><input type="text" name="dept" value="<%=rs.getString(4) %>"></td>
                </tr>
                <tr>
                    <td>Fees:</td>
                    <td><input type="text" name="fees" value="<%=rs.getString(5)%>"></td>
                </tr>
                <tr>
                    <td>Date:</td>
                    <td><input type="date" name="dt" value="<%=rs.getString(6) %>"></td>
                </tr>
                <tr>
                    <td>Time:</td>
                    <td><input type="time" name="tm1" value="<%=rs.getString(7) %>"> To
                        <input type="time" name="tm2" value="<%=rs.getString(8) %>"></td>
                </tr>
            </table>
            <div style="text-align: center;">
                <input type="submit" value="Update">
            </div>
        </form>
    <%
    } else {
        out.print("<center><h1>Invalid Doctors ID</h1>");
        
    }
    con.close();
    %>
    <br><br> 
    <tr>
        <a href="updatedoctor.html">Go Back</a>
    </tr>
</body>
</html>
