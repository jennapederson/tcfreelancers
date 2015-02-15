$(document).ready(function(){
  function hideJumbotron(){
    $(".jumbotron").hide();  
  }

  $(".close-jumbotron").click(function(e){
    hideJumbotron();
    if (localStorage){
        localStorage['hideJumbotron'] = true;
    }
  });

  if (localStorage['hideJumbotron']) {
    hideJumbotron();  
  }  
});