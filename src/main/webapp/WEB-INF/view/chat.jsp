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

  <script>
    // scroll the chat div to the bottom
    function scrollChat() {
      var chatDiv = document.getElementById('chat');
      chatDiv.scrollTop = chatDiv.scrollHeight;
    };
  </script>
</head>

<body onload="scrollChat()">

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

    <h1><%= conversation.getTitle() %>
      <a href="" style="float: right">&#8635;</a>
    </h1>

    <div id="chat">
      <ul>
    <%
      for (int i = 0; i < messages.size(); i++){
        Message message = messages.get(i);
        String author = UserStore.getInstance()
          .getUser(message.getAuthorId()).getName();
    %>
      <li style="list-style-type:none"><strong><a href="/users/<%= author %>"><%= author %></a>:</strong> <%= message.getContent() %></li>
        <%
        if (i == (messages.size()-1) || !(messages.get(i+1).getGroupID().equals(messages.get(i).getGroupID()))) {
        %>
        <button id="respondButton" type="submit" onclick="onReplyClick('<%= message.getGroupID()%>')">Reply to Message</button>
    <%
        }
      }
    %>
      </ul>
    </div>

    <% if (request.getSession().getAttribute("user") != null) { %>
    <div id="editorButtonArea">
      <button class="editButtons" onmousedown="event.preventDefault();" onclick="command('bold')"><img class="icon" src="../../../assets/bold.png"/></button>
      <button class="editButtons" onmousedown="event.preventDefault();" onclick="command('italic')"><img class="icon" src="../../../assets/italic.png"/></button>
      <button class="editButtons" onmousedown="event.preventDefault();" onclick="command('underline')"><img class="icon" src="../../../assets/underline.png"/></button>
      <button class="editButtons" onmousedown="event.preventDefault();" onclick="command('strikethrough')"><img class="icon" src="../../../assets/strikethrough.png"/></button>
      <button class="editButtons" onmousedown="event.preventDefault();" onclick="command('superscript')"><img class="icon" src="../../../assets/superscript.png"/></button>
      <button class="editButtons" onmousedown="event.preventDefault();" onclick="command('subscript')"><img class="icon" src="../../../assets/subscript.png"/></button>
    </div>
    <form action="/chat/<%= conversation.getTitle() %>" method="POST">
      <div>
        <p id="pInput" class="editor" title="Enter your message."></p>
        <button id="submitButton" type="submit" onclick="getMessage()">Send</button>
      </div>
      <br/>
      <input type="hidden" value="message" name="message" id="hiddenInput" />
      <input type="hidden" value="" name="replyID" id="hiddenReply" /> 
    </form>
    <% } else { %>
      <p><a href="/login">Login</a> to send a message.</p>
    <% } %>

  </div>
  <script src="../../../js/main.js"></script>
</body>
</html>
