window.onload = function() {
  console.log("hello");
}

function ShowResult()
{
    my_window = window.open("about:blank", "mywindow1");
    //By the above line code we have opened a new window
    my_window.document.write(x);
    //Here we have added the value of the textarea to the new window
}
