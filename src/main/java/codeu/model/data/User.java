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

package codeu.model.data;

import java.time.Instant;
import java.util.UUID;

/** Class representing a registered user. */
public class User {
  private final UUID id;
  private final String name;
  private final String hashedPassword; 	// Jean added this for part 2; Luis renamed this variable for part 9
  private final Instant creation; 
  private String aboutMe; // this String holds the information to be used in the "About Me" section (Lina)

  /**
   * Constructs a new User.
   *
   * @param id the ID of this User
   * @param name the username of this User
   * @param password
   * @param creation the creation time of this User
   */
  public User(UUID id, String name, String password, Instant creation) {
    this.id = id;
    this.name = name;
    this.hashedPassword = password; 		//Jean added password to constructor; Luis renamed this variable for part 9
    this.creation = creation;
    this.aboutMe = "No profile information yet!"; // added by Lina (Project 2)
  }

  /** Returns the ID of this User. */
  public UUID getId() {
    return id;
  }

  /** Returns the username of this User. */
  public String getName() {
    return name;
  }

  /** Returns the password of this User. */
  public String getPassword() {
   return hashedPassword;
 }

  /** Returns the creation time of this User. */
  public Instant getCreationTime() {
    return creation;
  }
  
  /** Sets the aboutMe String of the User. */
  public void setAboutMe(String aboutMe) { // added by Lina (Project 2)
	  this.aboutMe = aboutMe; 
  }
  
  /** Returns the About Me information of this User */
  public String getAboutMe() { // added by Lina (Project 2)
	  return aboutMe; 
  }
}
