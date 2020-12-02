import GMaps from 'gmaps/gmaps.js';

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
  map.setZoom(12);

  navigator.geolocation.getCurrentPosition((data) => {
    map.addMarker({
      lat: data["coords"].latitude,
      lng: data["coords"].longitude,
      title: "Minha localização"
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
    const proxyurl = "https://cors-anywhere.herokuapp.com/";
    const url = `https://maps.googleapis.com/maps/api/directions/json?origin=${data["coords"].latitude},${data["coords"].longitude}&destination=${marker.lat},${marker.lng}&departure_time=now&key=${key}`
    fetch(proxyurl + url)
      .then(response => response.json())
      .then((data) => {
        const trafficDistance = data.routes[0].legs[0].distance.text
        const trafficTime = data.routes[0].legs[0].duration.text
        const card = document.querySelector('#transit');
        const traffic = `<h5>DESLOCAMENTO</h5><h6>CARRO</h6>
        <p>Distância: ${trafficDistance}</p><p>Tempo com trânsito: ${trafficTime}</p>`;
        card.innerHTML = traffic;
      });
  });
}

// https://maps.googleapis.com/maps/api/directions/json?origin=Toronto&destination=Montreal&key=AIzaSyBWL3wBZhgOAbhOCv5caDZyFJM7_3B--CY
