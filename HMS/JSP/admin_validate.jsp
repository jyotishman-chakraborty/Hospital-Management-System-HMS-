<%@include file="Connect.jsp" %>

<%
PreparedStatement pst=con.prepareStatement("select * from jyotishman.admin where id=? and password=?");
 pst.setString(1,request.getParameter("uid"));
 pst.setString(2,request.getParameter("pass"));

ResultSet rs=pst.executeQuery();
if(rs.next())
  response.sendRedirect("admin.html");
  else{
 %>
<center> <font color=red> <h3>Invalid userid or password</h3></font>
<%@include file="admin_log.html" %>

<%
}
con.close();
%>