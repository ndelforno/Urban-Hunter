document.addEventListener("DOMContentLoaded", function(event) {

  var mymap = L.map('mapid').setView([43.6532, -79.3832], 13);
  // var address = document.getElementById("address");
  // var addressText = address.innerText;

  if(document.getElementById('mapid')){

    // axios({
    //   url: "https://nominatim.openstreetmap.org/search?format=json&limit=3&q=" + addressText,
    //   method: 'get',
    //   data: '',
    //   dataType: 'json',
    // }).then(function(response){
    //   var lat = response.data[0].lat;
    //   var long = response.data[0].lon;
    //   mymap.setView([lat, long], 13)
    //   var circle = L.circle([lat,long], {
    //     color: 'red',
    //     fillColor: '#f03',
    //     fillOpacity: 0.5,
    //     radius: 150
    //     }).addTo(mymap);
    // });


    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
      attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
      maxZoom: 18,
      id: 'mapbox.streets',
      accessToken: 'pk.eyJ1IjoibmRlbGZvcm5vIiwiYSI6ImNqbzY2MzlyZTBoczUzcW5sc2k3dGFsZ2YifQ.JL97VOzlsaPc4uDrUwlAnw'
    }).addTo(mymap);


  }


});
