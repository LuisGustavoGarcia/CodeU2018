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
<%@ page import="java.util.Map" %>
<%@ page import="codeu.model.data.Message" %>
<%@ page import="codeu.model.data.Conversation" %>
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

  <div id="mySidenav" class="sidenav">
   <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
   <a href="/index.jsp"><img src="../../../assets/home.png"></img></a>
   <a href="/conversations"><img src="../../../assets/conversations.png"></img></a>
   <a href="/about.jsp"><img src="../../../assets/about.png"></img></a>
 </div>

 <button id="navButton" onclick="openNav()"><img src="../../../assets/menu.png"</img></button>

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
        <% if (!user.getMentions().isEmpty()) {
           Map<Conversation, List<Message>> mentions = user.getMentions();
           %>
                <h3>You've been tagged in the following conversations:</h3>
                <% for (Conversation conv : mentions.keySet()) {
                   String conversationTitle = conv.getTitle();
                %>
                <div id="messages">
                    <ul>
                        <li><strong><a href="/chat/<%= conversationTitle %>"><%= conversationTitle %></a>:</strong>
                            <ul>
                                <%
                                  List<Message> mentionList = mentions.get(conv);
                                  for (int i = 0; i < Math.min(mentionList.size(), 20); i++) {
                                    Message mention = mentionList.get(i);
                                %>
                                    <li><strong><%= mention.getCreationTime() %>:</strong> <%= mention.getContent() %></li>
                                <%
                                  }
                                %>
                            </ul>
                        </li>
                     </ul>
                    </div>
                <%} %>
        <% } %>

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
