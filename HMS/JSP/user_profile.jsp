<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
     body {
            background-image: url("hospital1.jpg");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0; 
            height: 100vh;
        }

    .welcome{
        font-size:100px;
        color:rgb(230, 11, 11);
        
    }
    .welcome:hover{
        color:rgb(8, 0, 0)
    }
    .oval-button {
      width: 300px;
      height: 90px;
      border-radius: 30px; 
      background-color: #2669d3;
      color: white;
      font-size: 27px;
      font-style:normal;
      border: none;
      cursor: pointer;
    }
    .oval-button:hover{
        background-color:rgb(192, 193, 188);

    }
    .oval-button a{
      color:hsl(0, 100%, 99%);
    }
    .oval-button a:hover{
      color: black;
    }
    .oval-button1 {
      width: 150px;
      height: 50px;
      border-radius: 30px; 
      background-color: #2669d3;
      color: white;
      font-size: 15px;
      font-style:normal;
      border: none;
      cursor: pointer;
    }
    .oval-button1:hover{
        background-color:rgb(192, 193, 188);

    }
    .oval-button1 a{
      color:hsl(0, 100%, 99%);
    }
    .oval-button1 a:hover{
      color: black;
    }
  </style>
</head>
<body>
    <center>
    <h1  class="welcome"> Welcome <%=session.getAttribute("name")%></h1>

    <button class="oval-button"> <a href="doctor_search.html" ><b>Search Doctor</b></a></button><br><br>
    <button class="oval-button"> <a href="dept_search.html" ><b>Depertment search</b></a></button><br> <br>
    <!-- <button class="oval-button"><a href="book_doctor.jsp" ><b>Book Appoientment</b></a></button><br><br> -->
    <button class="oval-button"><a href="history.jsp" ><b>Histroy</b></a></button><br><br>
    <button class="oval-button1"> <a href="user_login1.html" ><b>Log Out</b></a></button><br> <br>
</center>


</body>
</html>