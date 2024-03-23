<%@include file="Connect.jsp" %>

<%
PreparedStatement pst=con.prepareStatement("select * from jyotishman.USER_REG where mob=? and password=?");
 pst.setString(1,request.getParameter("mob"));
 pst.setString(2,request.getParameter("pass"));

ResultSet rs=pst.executeQuery();
if(rs.next())
  {
    session.setAttribute("name",rs.getString(1));
    session.setAttribute("mob",rs.getString(2));
    response.sendRedirect("user_profile.jsp");
  }
  else{
 %>
<center> <font color=red> <h3>Invalid userid or password</h3></font>
<%@include file="user_login1.html" %>

<%
}
con.close();
%>