document.addEventListener("DOMContentLoaded", function(event) {

if(document.getElementById('mapid_all')){
  var mymapAll = L.map('mapid_all').setView([43.6532, -79.3832], 13);
  var taskaddresses = document.querySelectorAll(".taskaddress")

  var searchAddresses = []

  for (var i = 0; i < taskaddresses.length; i++) {
    searchAddresses.push(taskaddresses[i].innerText)
  }

  for (var i = 0; i < searchAddresses.length; i++) {
    axios({
      url: "https://nominatim.openstreetmap.org/search?format=json&limit=3&q=" + searchAddresses[i],
      method: 'get',
      data: '',
      dataType: 'json',
    }).then(function(response){
      var lat = response.data[0].lat;
      var long = response.data[0].lon;
      mymapAll.setView([lat, long], 13)
      var circle = L.circle([lat,long], {
        color: 'red',
        fillColor: '#f03',
        fillOpacity: 0.5,
        radius: 150
      }).addTo(mymapAll);
    });
  }

  L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
      attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
      maxZoom: 18,
      id: 'mapbox.streets',
      accessToken: 'pk.eyJ1IjoibmRlbGZvcm5vIiwiYSI6ImNqbzY2MzlyZTBoczUzcW5sc2k3dGFsZ2YifQ.JL97VOzlsaPc4uDrUwlAnw'
    }).addTo(mymapAll);
  }

  if (document.getElementById("progressbar")){
      var totaltasks = document.querySelectorAll('.task')
      var taskscompleted = document.querySelectorAll('.completed_task')
      var completed_task = document.querySelectorAll('completed_task')
      var elem = document.getElementById("mybar");
      if (taskscompleted.length < 1) {
        elem.style.width = 10 + '%'
        elem.style.backgroundColor = "white"
        elem.innerText = `${taskscompleted.length} / ${totaltasks.length}`;
      }else{
        elem.style.width = (taskscompleted.length / totaltasks.length)* 100 + '%';
        elem.innerText = `${taskscompleted.length} / ${totaltasks.length}`;
      }
  }


});
