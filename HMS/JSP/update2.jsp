<%@page import="java.sql.*" %>

<%
    int eid=Integer.parseInt(request.getParameter("eid"));
    String nm= request.getParameter("nm");
    String degn=request.getParameter("degn");
    int sal=Integer.parseInt(request.getParameter("sal"));

    Class.forName("oracle.jdbc.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");

    PreparedStatement pst=con.prepareStatement("update jyotishman.emp_msc set name=?,degn=?,sal=? where eid=?");
    pst.setString(1,nm);
    pst.setString(2,degn);
    pst.setInt(3,sal);
    pst.setInt(4,eid);
    pst.executeUpdate();

    out.print("Update Successfully");
    con.close();
%>