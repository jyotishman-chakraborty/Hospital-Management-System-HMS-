<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            background-color: #88c4e7;
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
           
            box-shadow: 0 4px 8px rgba(68, 122, 143, 0.56);
        }
        
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align:center;
        }
        tr:hover{
            background-color: #cdef75;
        }

        th {
            background-color: #f2f2f2;
        }

      
        

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        input[type="submit"]:hover {
            background-color: #61a8f4;
        }

        button {
      background-color: #1163e8;
      color: white;
      padding: 12px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-weight: bold;
    }

    button :hover {
      background-color: #1bbbf5;
      color:whitesmoke;
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
        %>
        <table>
        <tr>
        <th>Doctors ID</th>
        <th>Name</th>
        <th>Email ID</th>
        <th>Dept</th>
        <th>Fees</th>
        <th>Date</th>
        <th>Time</th>
        <th>To</th>
        <th>BOOK Appointment</th>
        </tr>
        <%
        while (rs.next()) {
            int f=0;
            int doctorsid=rs.getInt(1);
            PreparedStatement pst1=con.prepareStatement("select * from jyotishman.booking where doctors_id=? and mob=?  ");
           
            pst1.setInt(1,doctorsid);
            pst1.setString(2,(String)session.getAttribute("mob"));
            ResultSet rs1=pst1.executeQuery();
            if(rs1.next())
               f=1;
        %>
            <tr>
         <td><%=rs.getInt(1)%></td>
        <td> <%=rs.getString(2)%></td>
            <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(4) %></td>
            <td><%=rs.getString(5) %></td>
            <td><%=rs.getString(6) %></td>
            <td><%=rs.getString(7) %></td>
            <td><%=rs.getString(8) %></td>
               <td>

             
        <%
        if(f==0)
        {
            %>
            <form action="booking.jsp" method=post><input type=hidden name=doctorsid value=<%=doctorsid%>><input type=submit value=Book></form>
         <%
        }
        else{
            %>
           <b style="color: rgb(171, 6, 6);"> Your Slot Booked Successfully</b>
        <%
        }
        %>
    </td>
    </tr>
        <%
        }
        
        con.close();
        %>
        </table>
       
    
              <button><a href="user_login1.html" >Log out</a></button>
            
        
    </center>

</body>

</html>

