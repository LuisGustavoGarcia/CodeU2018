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
<%@ page import="codeu.model.data.Conversation" %>
<%@ page import="codeu.model.data.Message" %>
<%@ page import="codeu.model.store.basic.UserStore" %>
<%
Conversation conversation = (Conversation) request.getAttribute("conversation");
List<Message> messages = (List<Message>) request.getAttribute("messages");
%>

<!DOCTYPE html>
<html>
<head>
  <title><%= conversation.getTitle() %></title>
  <link rel="stylesheet" href="/css/main.css" type="text/css">
  <link rel="stylesheet" href="/css/chat.css" type="text/css">

  <style>
    #chat {
      background-color: white;
      height: 500px;
      overflow-y: scroll
    }
  </style>

  <script>
    // scroll the chat div to the bottom
    function scrollChat() {
      var chatDiv = document.getElementById('chat');
      chatDiv.scrollTop = chatDiv.scrollHeight;
    };
  </script>
</head>
<body onload="scrollChat()">

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

    <h1><%= conversation.getTitle() %>
      <a href="" style="float: right">&#8635;</a></h1>

    <hr/>

    <div id="chat">
      <ul>
    <%
      for (int i = 0; i < messages.size(); i++){ 
        Message message = messages.get(i); 
        String author = UserStore.getInstance()
          .getUser(message.getAuthorId()).getName();
    %>
      <li><strong><a href="/users/<%= author %>"><%= author %></a>:</strong> <%= message.getContent() %></li>
        <% 
        if (i == (messages.size()-1) || messages.get(i+1).getGroupID() != messages.get(i).getGroupID()) { 
        %> 
        <li>"Reply"</li> 
    <% 
        } 
      }
    %>
      </ul>
    </div>

    <hr/>

    <% if (request.getSession().getAttribute("user") != null) { %>
    <button class="editButtons" onmousedown="event.preventDefault();" onclick="command('bold')"><img class="icon" src="../../../assets/bold.png"/></button>
    <button class="editButtons" onmousedown="event.preventDefault();" onclick="command('italic')"><img class="icon" src="../../../assets/italic.png"/></button>
    <button class="editButtons" onmousedown="event.preventDefault();" onclick="command('underline')"><img class="icon" src="../../../assets/underline.png"/></button>
    <button class="editButtons" onmousedown="event.preventDefault();" onclick="command('strikethrough')"><img class="icon" src="../../../assets/strikethrough.png"/></button>
    <button class="editButtons" onmousedown="event.preventDefault();" onclick="command('superscript')"><img class="icon" src="../../../assets/superscript.png"/></button>
    <button class="editButtons" onmousedown="event.preventDefault();" onclick="command('subscript')"><img class="icon" src="../../../assets/subscript.png"/></button>

    <form action="/chat/<%= conversation.getTitle() %>" method="POST">
      <div>
        <p id="pInput" class="editor" title="Enter your message."></p>
        <button id="submitButton" type="submit" onclick="getMessage()">Send</button>
      </div>
      <br/>
      <input type="hidden" value="message" name="message" id="hiddenInput" />
    </form>
    <% } else { %>
      <p><a href="/login">Login</a> to send a message.</p>
    <% } %>

    <hr/>

  </div>
  <script src="../../../js/main.js"></script>
</body>
</html>
