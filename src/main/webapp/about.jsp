<%--
  Copyright 2017 Google Inc.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
--%>
<!DOCTYPE html>
<html>
<head>
  <title>CodeU Chat App</title>
  <link rel="stylesheet" href="/css/main.css">
</head>
<body>

  <nav>
    <a id="navTitle" href="/">CodeU Chat App</a>
    <a href="/conversations">Conversations</a>
    <% if(request.getSession().getAttribute("user") != null){ %>
      <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
    <% } else{ %>
      <a href="/login">Login</a>
    <% } %>
    <a href="/about.jsp">About</a>
  </nav>

  <div id="container">
    <div
      style="width:75%; margin-left:auto; margin-right:auto; margin-top: 50px;">

      <h2>Team 15 Members</h2>
      <ul>
      	<li><strong>Tony Carnevale - PA</strong><!-- add your bio here! --></li>
      	<li><strong>Luis Garcia</strong>Hey! I'm a sophomore studying Computer Engineering
        at the University of Florida. I'm interested in full-stack Web Development, graphic design,
        and entrepreneurship. I lived in Cuba until I was 7 years old, and later grew up in Miami, FL.
        </li>
      	<li><strong>Erica Kok</strong><!-- add your bio here! --></li>
      	<li><strong>Jean Leong</strong><!-- add your bio here! --></li>
      	<li><strong>Lina Sim</strong>: Hello! I'm currently a sophomore studying
      	CS at Brown, with an interest in front-end development
      	and education in CS. Fun facts: I grew up on a tiny island in Malaysia,
      	I like making cool things, eating yummy food and taking long train rides.
      	&#128646;</li>
      </ul>
    </div>
  </div>
</body>
</html>
