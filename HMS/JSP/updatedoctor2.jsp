<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Doctor Details</title>
    <style>
        body {
            background-color: rgb(29, 244, 226);
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            max-width: 600px;
            margin: 20px;
            background-color:rgb(11, 249, 249);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        .output-message {
            background-color: rgb(11, 249, 249);
            color: rgb(12, 12, 12);
            padding: 100px;
            border-radius: 2000px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
            text-underline-position: auto;
            font-size: 38px;
        }

        form {
            padding: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
        }

        button {
            background-color: rgb(12, 129, 239);
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="output-message">
            <%
            int doctorsid = Integer.parseInt(request.getParameter("doctorsid"));
            String nm = request.getParameter("nm");
            String email = request.getParameter("email");
            String dept = request.getParameter("dept");
            String fees = request.getParameter("fees");
            String dt = request.getParameter("dt");
            String tm1 = request.getParameter("tm1");
            String tm2 = request.getParameter("tm2");

            Class.forName("oracle.jdbc.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "manager");
            PreparedStatement pst = con.prepareStatement("update jyotishman.DOCTORS_DETAILS set name=?,email=?,dept=?,fees=?,drdate=?,time_from=?,time_to=? where doctors_id=?");
            pst.setString(1, nm);
            pst.setString(2, email);
            pst.setString(3, dept);
            pst.setString(4, fees);
            pst.setString(5, dt);
            pst.setString(6, tm1);
            pst.setString(7, tm2);
            pst.setInt(8, doctorsid);
            pst.executeUpdate();
            out.print("<h1 class='output-message'>Updated Successfully</h1>");
            out.println("<a href='admin.html'><button><b>Back to Dashboard</b></button></a>");
            con.close();
            %>
        </div>
    </div>
</body>

</html>
