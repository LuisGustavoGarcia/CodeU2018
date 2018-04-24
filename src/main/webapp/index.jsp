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
  <title>Indie Ozone's Chat App</title>
  <link rel="stylesheet" href="/css/main.css">
  <link rel="stylesheet" href="/css/index.css">
</head>
<body style="vertical-align: middle">
  <div id="login_area">
    <h1 id="welcome_title">Welcome</h1>
    <button style="float: left" class="buttons" onclick="loginMode()">Existing User</button>
    <button style="float: left" class="buttons" onclick="registerMode()">New User</button>

    <form id="login_form" action="/login" method="POST">
      <label for="username">Username: </label>
      <input type="text" name="username" id="username">
      <br/>
      <label for="password">Password: </label>
      <input type="password" name="password" id="password">
      <br/><br/>
      <button style="border-radius: 5px" class="buttons" type="submit">Login</button>
    </form>

    <form id="register_form" action="/register" method="POST">
      <label for="username">Username: </label>
      <input type="text" name="username" id="username">
      <br/>
      <label for="password">Password: </label>
      <input type="password" name="password" id="password">
      <br/><br/>
      <button style="border-radius: 5px" class="buttons" type="submit">Register</button>
    </form>

    <% if(request.getAttribute("error") != null){ %>
        <h2 id="login_error_msg"><%= request.getAttribute("error") %></h2>
    <% } %>
  </div>

  <script src="../../../js/index.js"></script>
</body>
</html>
