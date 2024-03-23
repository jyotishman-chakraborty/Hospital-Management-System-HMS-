
    <html>
      <head>
        <style>
       a {
            color: #b41919; 
            text-decoration: none;
            font-weight: bold;
            font-size: medium;
        }

        a:hover {
            color: #1565C0; 
        }

        h1{
          color:#b41919;
          font-size:larger;
        }
        </style>
      </head>
  <body bgcolor="lightgreen">
    <center>
    <%@page import="java.sql.*" %>
    <%
    
    String nm=request.getParameter("nm");
    String mob=request.getParameter("mob");
    String email=request.getParameter("email");
    String pass=request.getParameter("pass");
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
    PreparedStatement pst=con.prepareStatement("insert into jyotishman.USER_REG values(?,?,?,?)");
    

    pst.setString(1,nm);
    pst.setString(2,mob);
    pst.setString(3,email);
    pst.setString(4,pass);
    

    int t=pst.executeUpdate();
    if(t>0)
        out.print("<h1>Registration Successful</h1>");
    con.close();
    %>
    <br><br>
        
            <tr>
                <a href="user_login1.html">Go Back</a>
            </tr>
        
    </center>
  </body>  
</html>
</html>