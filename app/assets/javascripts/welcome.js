

/* Set the width of the side navigation to 250px and the left margin of the page content to 250px */
function openNav() {
    document.getElementById("mySidenav").style.width = "350px";
    // document.getElementById("main_to_slide").style.marginLeft = "350px";
    document.getElementById("open_button").style.display = "none";
}

/* Set the width of the side navigation to 0 and the left margin of the page content to 0 */
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    // document.getElementById("main_to_slide").style.marginLeft = "0";
    document.getElementById("open_button").style.display = "block";
}

/*translate categories labels on link click*/

// document.addEventListener("DOMContentLoaded", function(){
//
//   var enLinkLang = document.getElementById("en");
//   var itLinkLang = document.getElementById("it");
//   var frLinkLang = document.getElementById("fr");
//   var jpLinkLang = document.getElementById("jp");
//   var deLinkLang = document.getElementById("de");
//   // console.log(itLinkLang.id);
//
//   enLinkLang.addEventListener('click', function(){
//         translateCategories(this.id);
//   });
//   itLinkLang.addEventListener('click', function(){
//         translateCategories(this.id);
//   });
// });
//
// /* Set the width of the side navigation to 0 and the left margin of the page content to 0 */
// function translateCategories(lang) {
//     var arEnLang = ["TOURISM", "SOCIAL", "PUB CRAWL", "FAMILY", "SPORT"];
//     var arItLang = ["TURISMO", "SOCIALE", "PUB CRAWL", "FAMIGLIA", "SPORT"];
//     var arFrLang = ["TOURISME", "SOCIALE", "PUB CRAWL", "FAMILLE", "SPORT"];
//     var arJpLang = ["TOURISM", "SOCIAL", "PUB CRAWL", "FAMILY", "SPORT"];
//     var arDeLang = ["TOURISMUS", "SOZIAL", "KNEIPENTOUR", "FAMILIE", "SPORT"];
//     // console.log(lang);
//     switch(lang) {
//       case "en":
//         var arNewCat = arEnLang;
//         break;
//       case "it":
//         var arNewCat = arItLang;
//         break;
//       case "fr":
//         var arNewCat = arFrLang;
//         break;
//       case "jp":
//         var arNewCat = arJpLang;
//         break;
//       case "de":
//         var arNewCat = arDeLang;
//         break;
//       default:
//         var arNewCat = arEnLang;
//     };
//     // return arNewCat;
//     // console.log(arNewCat);
//     var arCategories = document.querySelectorAll('.category_names');
//     // console.log(arCategories[0].innerHTML);
//     var iCatLength = arNewCat.length;
//     for (var i = 0; i < iCatLength; i++){
//       arCategories[i].innerText = arNewCat[i];
//     };
// };

function getTimeRemaining(endtime) {
  var t = Date.parse(endtime) - Date.parse(new Date());
  var seconds = Math.floor((t / 1000) % 60);
  var minutes = Math.floor((t / 1000 / 60) % 60);
  var hours = Math.floor((t / (1000 * 60 * 60)) % 24);
  var days = Math.floor(t / (1000 * 60 * 60 * 24));
  return {
    'total': t,
    'days': days,
    'hours': hours,
    'minutes': minutes,
    'seconds': seconds
  };
}

function initializeClock(id, endtime) {
  var clock = document.getElementById(id);
  var daysSpan = document.querySelector('.days');
  var hoursSpan = document.querySelector('.hours');
  var minutesSpan = document.querySelector('.minutes');
  var secondsSpan = document.querySelector('.seconds');

  function updateClock() {
    var t = getTimeRemaining(endtime);

    daysSpan.innerHTML = t.days;
    hoursSpan.innerHTML = ('0' + t.hours).slice(-2);
    minutesSpan.innerHTML = ('0' + t.minutes).slice(-2);
    secondsSpan.innerHTML = ('0' + t.seconds).slice(-2);

    if (t.total <= 0) {
      clearInterval(timeinterval);
    }
  }

  updateClock();
  var timeinterval = setInterval(updateClock, 1000);
}

// var deadline = new Date(Date.parse(new Date()) + 15 * 24 * 60 * 60 * 1000);
document.addEventListener("DOMContentLoaded", function(){
  var time = document.querySelector("#deadline")
  var deadline = new Date(Date.parse(time.value));
  initializeClock('clockdiv', deadline);
});
