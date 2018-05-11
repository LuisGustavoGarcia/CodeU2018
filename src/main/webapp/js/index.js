function registerMode(){
  //Find the login form and hide it.
  var editor = document.querySelector('#login_form');
  editor.style.display = "none";

  //Find the register form and show it.
  editor = document.querySelector('#register_form');
  editor.style.display = "block";
}

function loginMode(){
  //Find the register form and hide it.
  var editor = document.querySelector('#register_form');
  editor.style.display = "none";

  //Find the login form and show it.
  editor = document.querySelector('#login_form');
  editor.style.display = "block";
}
