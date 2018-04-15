//Find the element in our HTML that we allow the user to edit
const editor = document.querySelector('.editor');
//Make this elemtent editable.
editor.contentEditable = true;
editor.focus();

//This function is responsible for editing the text using a command passed to it
//and the Browser execCommand functionality.
function command(name){
  try{
    var success = document.execCommand(name, false, null);
  }catch(error){
    alert(error);
  }
}

function getMessage(){
  var elem = document.getElementById('pInput');
  var message1 = elem.innerHTML;
  //TODO: Need to send this variable to the JavaServlet's "messageContent" somehow.
}

// function ShowResult()
// {
//     my_window = window.open("about:blank", "mywindow1");
//     //By the above line code we have opened a new window
//     my_window.document.write(x);
//     //Here we have added the value of the textarea to the new window
// }
