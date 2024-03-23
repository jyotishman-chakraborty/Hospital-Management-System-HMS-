<%@ include file="Connect.jsp" %>

<%!
    int daid=0;
%>
<%
    PreparedStatement pst=con.prepareStatement("select max(DOCTORS_ID) from jyotishman.DOCTORS_DETAILS");
    ResultSet rs=pst.executeQuery();
    if(rs.next())
    daid=rs.getInt(1);
   daid=daid+1;
   con.close();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Management System</title>
    <style>
        body {
            
      font-family: Arial, sans-serif;
      background-image:url('hospital5.jpg');
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0 auto;
      padding: 0;
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
        }

        center {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        marquee {
            width: 70%;
            color: rgb(2, 5, 102);
        }

        h2{
            color: rgba(76, 0, 255, 0.748);
            margin: 0;
        }

    

        form {
            margin-top: 20px;
        }

        table {
            border: 2px solid black;
            border-collapse: collapse;
            width: 70%;
            margin-top: 10px;
        }

        td {
            padding: 10px;
            text-align: left;
        }

        input {
            padding: 5px;
            width: 100%;
            box-sizing: border-box;
        }
    .t1{
        border: 0px;
    }
    input[type="reset"], input[type="submit"] {
    background-color: #3c56e7;
    color: #fff;
    padding: 14px 24px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s ease;
    margin-top: 10px; 
}

input[type="reset"]:hover, input[type="submit"]:hover {
    background-color: #9aa805;
}
    </style>
</head>
<body>
    <center>
        <marquee direction="left"><h2>HOSPITAL MANAGEMENT SYSTEM</h2></marquee>
        <h2>Enter Doctor's Details........</h2>
        <form action="add_doctor.jsp" method="post">
            <table>
            </b>
                <tr>
                   <td>DOCTOR'S ID:</td>
                    <td><input type=text name=daid  readvalue=<%=daid%> ></td>
                </tr>
                <tr>
                    <td>DOCTOR'S NAME:</td>
                    <td><input type="text" required name="nm"></td>
                </tr>
                <tr>
                    <td>EMAIL ID:</td>
                    <td><input type="email" required name="email"></td>
                </tr>
                <tr>
                    <td>DEPARTMENT:</td>
                    <td><input type="text" required name="dept"></td>
                </tr>
                <tr>
                    <td>FEES:</td>
                    <td><input type="text" required name="fees"></td>
                </tr>
                <tr>
                    <td>DATE:</td>
                    <td><input type="date" required name="dt"></td>
                </tr>
                <tr>
                    <td>TIME:</td>
                    <td><input type="time" required name="tm1"> TO <input type="time" required name="tm2"></td>
                </tr>
            </table>
            <br>
            <br>
            <table class="t1">
           <tr> <td><input type="reset" value="RESET"></td>
            <td><input type="submit" value="SUBMIT"></td>
            </tr>
            </table>
        </form>
    </center>
</body>
</html>
