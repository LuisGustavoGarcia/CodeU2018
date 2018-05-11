<!DOCTYPE html>
<html>
<head>
 <title>Register</title>
 <link rel="stylesheet" href="/css/main.css">
 <style>
   label {
     display: inline-block;
     width: 100px;
   }
 </style>
</head>
<body>

  <div id="mySidenav" class="sidenav">
   <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
   <a href="/index.jsp"><img src="../../../assets/home.png"></img></a>
   <a href="/conversations"><img src="../../../assets/conversations.png"></img></a>
   <a href="/about.jsp"><img src="../../../assets/about.png"></img></a>
 </div>

 <button id="navButton" onclick="openNav()"><img src="../../../assets/menu.png"</img></button>


 <div id="container">
   <h1>Register</h1>

   <% if(request.getAttribute("error") != null){ %>
       <h2 style="color:red"><%= request.getAttribute("error") %></h2>
   <% } %>

   <form action="/register" method="POST">
     <label for="username">Username: </label>
     <input type="text" name="username" id="username" pattern="[^\s]+"  title="please do not use the white space" required>
     <br/>
     <label for="password">Password: </label>
     <input type="password" name="password" id="password">
     <br/><br/>
     <button type="submit">Submit</button>
   </form>
 </div>
 <script src="../../../js/main.js"></script>
</body>
</html>
