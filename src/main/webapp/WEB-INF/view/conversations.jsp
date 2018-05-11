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

<!DOCTYPE html>
<html>
<head>
  <title>Conversations</title>
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

    <% if(request.getAttribute("error") != null){ %>
        <h2 style="color:red"><%= request.getAttribute("error") %></h2>
    <% } %>

    <% if(request.getSession().getAttribute("user") != null){ %>
      <h1>Create A New Conversation</h1>
      <form action="/conversations" method="POST">
          <div class="form-group">
            <label class="form-control-label"><strong>Title:</strong></label>
            <input type="text" name="conversationTitle">
            <button type="submit">Create</button>
          </div>
      </form>

      <hr/>
    <% } %>


    <h1>Search Conversations</h1>

    <form action="/conversations" method="POST">
      <div class="form-group">
        <label class="form-control-label"><strong>Search:</strong></label>
        <input type="text" name="searchTitle">
        <button type="submit">Search</button>
      </div>
    </form>



    <%
    List<Conversation> conversations =
      (List<Conversation>) request.getAttribute("conversations");
    %>

    <% if(request.getAttribute("searchTag") != null) {
        if(request.getAttribute("searchTag").equals("No such convo.")) {%>
          <p> No such convo. </p>
    <% } else { %>
        <ul class="mdl-list">

          <li><a href="/chat/<%= request.getAttribute("searchTag") %>">
           <%= request.getAttribute("searchTag") %></a></li>

          <%-- <li><a href="/chat/<%= request.getAttribute("searchTag") %>">
            <%= request.getAttribute("searchTag") %></a></li>

            <%
            List<String> searched = request.getAttribute("searchTag");
              for(String conversation : searched) { %>

              <li><a href="/chat/<%= conversation %>">
                <%= conversation %></a></li>

            <%
              }
            %> --%>



          <%-- <%
          if(conversations != null && !conversations.isEmpty()){
            for(Conversation conversation : conversations){
              System.out.print(request.getAttribute("searchTag").toString());
              if(conversation.getTitle().startsWith(request.getAttribute("searchTag").toString())) {
          %>
            <li><a href="/chat/<%= conversation.getTitle() %>">
              <%= conversation.getTitle() %></a></li>
          <%
        } } }
          %> --%>
        </ul>
    <% } } %>

    <hr/>

    <h1>All Conversations</h1>
    <%

    if(conversations == null || conversations.isEmpty()){
    %>
      <p>Create a conversation to get started.</p>
    <%
    }
    else{
    %>
      <ul class="mdl-list">
    <%
      for(Conversation conversation : conversations){
    %>
      <li><a href="/chat/<%= conversation.getTitle() %>">
        <%= conversation.getTitle() %></a></li>
    <%
      }
    %>
      </ul>
    <%
    }
    %>
    <hr/>
  </div>
  <script src="../../../js/main.js"></script>
</body>
</html>
