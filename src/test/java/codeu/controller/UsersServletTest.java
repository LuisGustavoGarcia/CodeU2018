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
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.Mockito;

public class UsersServletTest { // tests added by Lina (Project 2) 
	
  private UsersServlet usersServlet;
  private HttpServletRequest mockRequest;
  private HttpSession mockSession;
  private HttpServletResponse mockResponse;
  private RequestDispatcher mockRequestDispatcher;
  private MessageStore mockMessageStore;
  private UserStore mockUserStore;

  @Before
  public void setup() {
	  usersServlet = new UsersServlet();

    mockRequest = Mockito.mock(HttpServletRequest.class);
    mockSession = Mockito.mock(HttpSession.class);
    Mockito.when(mockRequest.getSession()).thenReturn(mockSession);

    mockResponse = Mockito.mock(HttpServletResponse.class);
    mockRequestDispatcher = Mockito.mock(RequestDispatcher.class);
    Mockito.when(mockRequest.getRequestDispatcher("/WEB-INF/view/users.jsp"))
        .thenReturn(mockRequestDispatcher);

    mockMessageStore = Mockito.mock(MessageStore.class);
    usersServlet.setMessageStore(mockMessageStore);

    mockUserStore = Mockito.mock(UserStore.class);
    usersServlet.setUserStore(mockUserStore);
  }

  @Test
  public void testDoGet() throws IOException, ServletException {
    Mockito.when(mockRequest.getRequestURI()).thenReturn("/users/test_user");

    UUID fakeUserId = UUID.randomUUID();
    User fakeUser =
        new User(fakeUserId, "test_user", "password", Instant.now());
    Mockito.when(mockUserStore.getUser("test_user"))
        .thenReturn(fakeUser);

    List<Message> fakeMessageList = new ArrayList<>();
    fakeMessageList.add(
        new Message(
            UUID.randomUUID(),
            UUID.randomUUID(),
            fakeUserId,
            "test message",
            Instant.now()));
    Mockito.when(mockMessageStore.getMessagesFromAuthor(fakeUserId))
        .thenReturn(fakeMessageList);

    usersServlet.doGet(mockRequest, mockResponse);

    Mockito.verify(mockRequest).setAttribute("messages", fakeMessageList);
    Mockito.verify(mockRequest).setAttribute("user", fakeUser);
    Mockito.verify(mockRequestDispatcher).forward(mockRequest, mockResponse);
  }

  @Test
  public void testDoGet_badUser() throws IOException, ServletException {
    Mockito.when(mockRequest.getRequestURI()).thenReturn("/users/bad_user");
    Mockito.when(mockUserStore.getUser("bad_user"))
        .thenReturn(null);

    usersServlet.doGet(mockRequest, mockResponse);

    Mockito.verify(mockResponse).sendRedirect("/conversations");
  }

  @Test
  public void testDoPost_StoresUser() throws IOException, ServletException {
    Mockito.when(mockRequest.getRequestURI()).thenReturn("/users/test_user");
    Mockito.when(mockSession.getAttribute("user")).thenReturn("test_user");

    User fakeUser = new User(UUID.randomUUID(), "test_user", "test_pw", Instant.now());
    
    Mockito.when(mockUserStore.getUser("test_user")).thenReturn(fakeUser);

    Mockito.when(mockRequest.getParameter("profile")).thenReturn("Test profile.");

    usersServlet.doPost(mockRequest, mockResponse);

    ArgumentCaptor<User> messageArgumentCaptor = ArgumentCaptor.forClass(User.class);
    Mockito.verify(mockUserStore).updateUser(messageArgumentCaptor.capture());
    Assert.assertEquals("Test profile.", messageArgumentCaptor.getValue().getAboutMe());

    Mockito.verify(mockResponse).sendRedirect("/users/test_user");
  }

  @Test
  public void testDoPost_CleansHtmlContent() throws IOException, ServletException {
	    Mockito.when(mockRequest.getRequestURI()).thenReturn("/users/test_username");
	    Mockito.when(mockSession.getAttribute("user")).thenReturn("test_username");

    User fakeUser = new User(UUID.randomUUID(), "test_username", "test_pw", Instant.now());

    Mockito.when(mockUserStore.getUser("test_username")).thenReturn(fakeUser);

    Mockito.when(mockRequest.getParameter("profile"))
        .thenReturn("Contains <b>html</b> and <script>JavaScript</script> content.");

    usersServlet.doPost(mockRequest, mockResponse);

    ArgumentCaptor<User> messageArgumentCaptor = ArgumentCaptor.forClass(User.class);
    Mockito.verify(mockUserStore).updateUser(messageArgumentCaptor.capture());
    Assert.assertEquals(
        "Contains html and  content.", messageArgumentCaptor.getValue().getAboutMe());

    Mockito.verify(mockResponse).sendRedirect("/users/test_username");
  }
}
