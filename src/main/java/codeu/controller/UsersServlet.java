// Copyright 2017 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package codeu.controller;

import codeu.model.data.Message;
import codeu.model.data.User;
import codeu.model.store.basic.MessageStore;
import codeu.model.store.basic.UserStore;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;

/** Servlet class responsible for the users profile page. */
public class UsersServlet extends HttpServlet { //class added by Lina (Project 2) 


  /** Store class that gives access to Messages. */
  private MessageStore messageStore;

  /** Store class that gives access to Users. */
  private UserStore userStore;

  /** Set up state for handling chat requests. */
  @Override
  public void init() throws ServletException {
    super.init();
    setMessageStore(MessageStore.getInstance());
    setUserStore(UserStore.getInstance());
  }

  /**
   * Sets the MessageStore used by this servlet. This function provides a common setup method for
   * use by the test framework or the servlet's init() function.
   */
  void setMessageStore(MessageStore messageStore) {
    this.messageStore = messageStore;
  }

  /**
   * Sets the UserStore used by this servlet. This function provides a common setup method for use
   * by the test framework or the servlet's init() function.
   */
  void setUserStore(UserStore userStore) {
    this.userStore = userStore;
  }

  /**
   * This function fires when a user navigates to the user page. It gets the user-name from
   * the URL, finds the corresponding user, and fetches the messages written by the user.
   * It then forwards to users.jsp for rendering.
   */
  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {
    String requestUrl = request.getRequestURI();
    String username = requestUrl.substring("/users/".length());
    
    User user = userStore.getUser(username);
    if (user == null) {
      // couldn't find conversation, redirect to conversation list
      System.out.println("User was null: " + username);
      response.sendRedirect("/conversations");
      return;
    }

    UUID userId = user.getId();

    List<Message> messages = messageStore.getMessagesFromAuthor(userId);

    request.setAttribute("messages", messages);
    request.setAttribute("user", user);
    request.getRequestDispatcher("/WEB-INF/view/users.jsp").forward(request, response);
  }

  /**
   * This function fires when a user submits the form to edit their profile information on the users page. It gets the logged-in
   * username from the session, the conversation title from the URL, and the chat message from the
   * submitted form data. It creates a new Message from that data, adds it to the model, and then
   * redirects back to the chat page.
   */
  @Override
  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {

    String username = (String) request.getSession().getAttribute("user");
    User user = userStore.getUser(username);
    String profileContent = request.getParameter("profile");

    // this removes any HTML from the message content
    String cleanedProfileContent = Jsoup.clean(profileContent, Whitelist.none());

    user.setAboutMe(cleanedProfileContent);
    userStore.updateUser(user); 

    // redirect to a GET request
    response.sendRedirect("/users/" + username);
  }
}
