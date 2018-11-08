document.addEventListener('DOMContentLoaded', function(){

if(document.querySelector(".log_in")){
var signin = document.querySelector(".log_in");
var log_in_form = document.querySelector(".log_in_form");
var close = document.querySelector(".close")

signin.addEventListener('click', function(event){
  event.preventDefault();
  log_in_form.style.display = "block";
});

close.addEventListener('click', function(){
  event.preventDefault();
  log_in_form.style.display = "none";

});
}

})
