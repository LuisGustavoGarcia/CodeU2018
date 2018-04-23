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
<%@ page import="java.util.List" %>
<%@ page import="codeu.model.data.Message" %>
<%@ page import="codeu.model.data.User" %>
<%@ page import="codeu.model.store.basic.UserStore" %>
<%
List<Message> messages = (List<Message>) request.getAttribute("messages");
User user = (User) request.getAttribute("user");
String sessionUser = (String) request.getSession().getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
  <title>Conversations</title>
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
     <a href="/register">Register</a>
   <% } %>
   <a href="/about.jsp">About</a>
 </nav>
           
           
  <div id="container">

    <h1><%= user.getName()%>'s Profile <a href="" style="float: right">&#8635;</a> </h1>
        
    <h2>About <%= user.getName()%></h2>
    <p><%= user.getAboutMe()%></p>
        
    <% if (sessionUser != null && sessionUser.equals(user.getName())) { %>
    <h3>Edit your profile!</h3>
    <form action="/users/<%= user.getName() %>" method="POST">
        <input id="profile" type="text" name="profile" value= "<%= user.getAboutMe() %>">
        <br/><br/>
        <button type="submit">Update profile!</button>
    </form>
    <% } %>
        
    <h2><%= user.getName()%>'s Messages</h2>
    <hr/>
    <div id="messages">
    <ul>
    <%
      for (int i = 0; i < Math.min(messages.size(), 30); i++) {
        Message message = messages.get(i);
    %>
        <li><strong><%= message.getCreationTime() %>:</strong> <%= message.getContent() %></li>
    <%
      }
    %>
      </ul>
    </div>
    </hr>

  </div>
</body>
</html>
