//Find the element in our HTML that we allow the user to edit
const editor = document.querySelector('.editor');
//Make this elemtent editable.
editor.contentEditable = true;
editor.focus();

//This function is responsible for editing the text using a command passed to it
//and the Browser execCommand functionality.
function command(name){
  console.log("Message: " + message);
  try{
    console.log("This ran:" + name);
    var success = document.execCommand(name, false, null);
  }catch(error){
    alert(error);
  }
}

function ShowResult()
{
    my_window = window.open("about:blank", "mywindow1");
    //By the above line code we have opened a new window
    my_window.document.write(x);
    //Here we have added the value of the textarea to the new window
}
