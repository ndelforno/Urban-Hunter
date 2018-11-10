document.addEventListener('DOMContentLoaded', function(){

if(document.querySelector(".sign_in")){
  var signin = document.querySelector(".sign_in");
  var sign_up_form = document.querySelector(".signup");
  var close = document.querySelector(".close_sign_up");
  var log_in_form = document.querySelector(".signin");

  signin.addEventListener('click', function(event){
    event.preventDefault();
    sign_up_form.style.display = "block";
    log_in_form.style.display = "none";
  });

  close.addEventListener('click', function(){
    event.preventDefault;
    sign_up_form.style.display = "none";


});








}
});
