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
  <title>Load Test Data</title>
  <link rel="stylesheet" href="/css/main.css">
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
    <h1>Load Test Data</h1>
    <p>This will load a number of users, conversations, and messages for testing
        purposes.</p>
    <form action="/testdata" method="POST">
      <button type="submit" value="confirm" name="confirm">Confirm</button>
      <button type="submit" value="cancel" name="cancel">Do Nothing</button>
    </form>
  </div>
  <script src="../../../js/main.js"></script>
</body>
</html>
