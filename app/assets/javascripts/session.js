document.addEventListener('DOMContentLoaded', function(){

if(document.querySelector(".log_in")){
  var sign_up_form = document.querySelector(".signup")
  var login = document.querySelector(".log_in");
  var log_in_form = document.querySelector(".signin");
  var close = document.querySelector(".close_log_in")

  login.addEventListener('click', function(event){
    event.preventDefault();
    log_in_form.style.display = "block";
    sign_up_form.style.display = "none";
  });

  close.addEventListener('click', function(){
    event.preventDefault();
    log_in_form.style.display = "none";

  });
  }

})
