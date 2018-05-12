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
  var message = elem.innerHTML; 
  elem = document.getElementById('hiddenInput');
  elem.setAttribute("value", message);
} 

function onReplyClick(groupID){ 
  alert("Type reply below.");        
  document.getElementById("pInput").focus();
  var elem2 = document.getElementById('hiddenReply'); 
  elem2.setAttribute("value", groupID); 
} 




