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

  <div id="mySidenav" class="sidenav">
   <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
   <a href="/index.jsp"><img class="menuImage" src="../../../assets/home.png"></img></a>
   <p class="menuText">Home</p>
   <a href="/conversations"><img class="menuImage" src="../../../assets/conversations.png"></img></a>
   <p class="menuText">Conversations</p>
   <a href="/about.jsp"><img class="menuImage" src="../../../assets/about.png"></img></a>
   <p class="menuText">The Team</p>
 </div>

 <button id="navButton" onclick="openNav()"><img src="../../../assets/menu.png"</img></button>


  <div id="container">
    <div
      style="width:75%; margin-left:auto; margin-right:auto; margin-top: 50px;">

      <h2>Team Indie Ozone's Members</h2>
      	<p><strong>Tony Carnevale - PA</strong><!-- add your bio here! --></p>
        </br>
      	<p><strong>Luis Garcia</strong>Hey! I'm a sophomore studying Computer Engineering
        at the University of Florida. I'm interested in full-stack Web Development, graphic design,
        and entrepreneurship. I lived in Cuba until the age of seven, and later grew up in Miami, FL.</p>
        </br>
        <p><strong>Erica Kok</strong>: Hi! I'm currently a junior majoring in Computer Science and
        minoring in Math at Stetson University in Florida. I'm currently doing research in Artificial
        Intelligence as well, which is where my interest within the tech industry lies. A few facts about
        me: I grew up in the Philippines before moving to the US just four years ago, I love traveling,
        and I experiment with cooking from time to time. I try not to burn the kitchen down. :)</p>
        </br>
      	<p><strong>Jean Leong</strong>Hihi! I'm a sophomore Computer Science & Engineering major at Bucknell
        University (located in central PA), aspiring to also minor in Math and Spanish. I am from Westchester,
        New York (about 1 hour north of NYC), but grew up in Malaysia until I was in fifth grade before moving
        to New York.</p>
        </br>
      	<p><strong>Lina Sim</strong>: Hello! I'm currently a sophomore studying
      	CS at Brown, with an interest in front-end development
      	and education in CS. Fun facts: I grew up on a tiny island in Malaysia,
      	I like making cool things, eating yummy food and taking long train rides.
      	&#128646;</p>
    </div>
  </div>
  <script src="../../../js/main.js"></script>
</body>
</html>
