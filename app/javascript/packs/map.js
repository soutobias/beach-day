import GMaps from 'gmaps/gmaps.js';
import bikeIcon from '../images/bike.png';
import carIcon from '../images/car.png';
import personIcon from '../images/person.png';
import busIcon from '../images/bus.png';


const mapElement = document.getElementById('map');
if (mapElement) {
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  const marker = JSON.parse(mapElement.dataset.markers);
  const key = mapElement.dataset.ok;

  map.addMarker({
    lat: parseFloat(marker.lat),
    lng: parseFloat(marker.lng),
    title: marker.name,
    infoWindow: {
        content: `<p class="map-p pt-2">${marker.name}</p>`
    },
    mouseover: function(){
        (this.infoWindow).open(this.map, this);
    },
    mouseout : function(){
        this.infoWindow.close();
    }
  });

  map.setCenter(marker.lat, marker.lng);
  map.setZoom(15);
  const icon = {
        url: "http://maps.google.com/mapfiles/kml/shapes/man.png", // url
        scaledSize: new google.maps.Size(40, 40), // size
    };

  navigator.geolocation.getCurrentPosition((data) => {
    map.addMarker({
      lat: data["coords"].latitude,
      lng: data["coords"].longitude,
      title: "Minha localização",
      icon: icon
    });
    map.drawRoute({
      origin: [data["coords"].latitude, data["coords"].longitude],
      destination: [marker.lat, marker.lng],
      travelMode: 'driving',
      strokeColor: '#131540',
      strokeOpacity: 0.6,
      strokeWeight: 6
    });
    map.addLayer('traffic');
    map.addLayer('transit');

    const proxyurl = "";

    let url = `https://maps.googleapis.com/maps/api/directions/json?origin=${data["coords"].latitude},${data["coords"].longitude}&destination=${marker.lat},${marker.lng}&key=${key}`
    fetch(proxyurl + url)
      .then(response => response.json())
      .then((data) => {
        const trafficDistance = data.routes[0].legs[0].distance.text
        const trafficTime = data.routes[0].legs[0].duration.text
        const card = document.querySelector('#car');
        const traffic = `
          <div class="d-flex p-1 align-items-center">
            <img class="image-smallss pr-2" src=${carIcon}/>
            <div class="text-primary font-weight-bold text-right align-items-center pt-2">
              <p class="pr-1 pb-0">Distância:</p>
              <p class="pr-1 pb-0">Duração:</p>
            </div>
            <div class="text-left pt-2">
              <p class="pl-1 pb-0">${trafficDistance}</p>
              <p class="pl-1 pb-0">${trafficTime}</p>
            </div>
          </div>`;

        card.innerHTML = traffic;
      });

    url = `https://maps.googleapis.com/maps/api/directions/json?origin=${data["coords"].latitude},${data["coords"].longitude}&destination=${marker.lat},${marker.lng}&mode=transit&language=pt-BR&key=${key}`
    fetch(proxyurl + url)
      .then(response => response.json())
      .then((data) => {
        const trafficDistance = data.routes[0].legs[0].distance.text
        const trafficTime = data.routes[0].legs[0].duration.text
        const steps = data.routes[0].legs[0].steps
        let routes = ""
        let vehicle
        let line
        let lineName
        let trecho = 1
        steps.forEach((step) => {
          if (step.transit_details) {
            line = step.transit_details.line.short_name
            lineName = step.transit_details.line.name
            vehicle = step.transit_details.line.vehicle.name
            if (vehicle === "Ônibus"){
              routes = routes + `<p>Trecho ${trecho} - ${vehicle}: ${line} (${lineName})</p>`
            } else{
              routes = routes + `<p>Trecho ${trecho} - ${vehicle}: ${lineName}</p>`
            }
            trecho = trecho + 1
          }
        });
        const card = document.querySelector('#public-transportation');
        const traffic = `
        <div class="d-flex p-1  align-items-center">
          <img class="image-smalls pr-2" src=${busIcon}/>
          <div class="text-primary font-weight-bold text-right">
            <p class="pr-1 pb-0">Distância:</p>
            <p class="pr-1 pb-0">Duração:</p>
          </div>
          <div class="text-left">
            <p class="pl-1 pb-0">${trafficDistance}</p>
            <p class="pl-1 pb-0">${trafficTime}</p>
          </div>
          <div class="pl-3">
            ${routes}
          </div>
        </div>`;
        card.innerHTML = traffic;
      });
  });
}
