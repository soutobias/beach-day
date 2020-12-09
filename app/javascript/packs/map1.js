import GMaps from 'gmaps/gmaps.js';

import a01d from '../images/weather_icons/01d.png'
import a01n from '../images/weather_icons/01n.png'
import a02d from '../images/weather_icons/02d.png'
import a02n from '../images/weather_icons/02n.png'
import a03d from '../images/weather_icons/03d.png'
import a03n from '../images/weather_icons/03n.png'
import a04d from '../images/weather_icons/04d.png'
import a09d from '../images/weather_icons/09d.png'
import a10d from '../images/weather_icons/10d.png'
import a10n from '../images/weather_icons/10n.png'
import a11d from '../images/weather_icons/10n.png'

let x;

const mapElement = document.getElementById('map1');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const mapElement = document.getElementById("map1")

  const map = new GMaps({ el: '#map1', lat: 0, lng: 0, disableDefaultUI: true });
  const markers = JSON.parse(mapElement.dataset.markers);

  const iconRed = {
    url: "https://img.icons8.com/emoji/48/000000/red-circle-emoji.png", // url
    scaledSize: new google.maps.Size(50, 50), // size
  };

  const iconBlue = {
    url: "https://img.icons8.com/emoji/48/000000/blue-circle-emoji.png", // url
    scaledSize: new google.maps.Size(50, 50), // size
  };

  const iconOrange = {
    url: "https://img.icons8.com/emoji/48/000000/orange-circle-emoji.png", // url
    scaledSize: new google.maps.Size(50, 50), // size
  };

  let icon
  let rating
  markers.forEach((marker) => {
    if (marker.icon === "01d"){
      x = a01d;
    } else if (marker.icon === "01n"){
      x = a01n;
    }else if (marker.icon === "02d"){
      x = a02d;
    }else if (marker.icon === "02n"){
      x = a02n;
    }else if (marker.icon === "03d"){
      x = a03d;
    }else if (marker.icon === "03n"){
      x = a03n;
    }else if (marker.icon === "04d"){
      x = a04d;
    }else if (marker.icon === "09d"){
      x = a09d;
    }else if (marker.icon === "10d"){
      x = a10d;
    }else if (marker.icon === "10n"){
      x = a10n;
    }else if (marker.icon === "11d"){
      x = a11d;
    }

    rating = Math.round(parseFloat(marker.rating) * 10) / 10

    if (rating < 3.3){
      icon = iconRed
    } else if (rating < 3.5){
      icon = iconOrange
    } else {
      icon = iconBlue
    }
    map.addMarker({
      lat: parseFloat(marker.lat),
      lng: parseFloat(marker.lng),
      title: marker.name,
      label: {
        text: rating.toString(),
        fontFamily: "'Roboto Condensed', sans-serif"
      },
      icon: icon,
      color: "black",
      infoWindow: {
          content: `<div class="d-flex align-items-center"><p class="map-p pt-2">${marker.name}</p><img class="map-img" src=${x}/></div>`
      },
      mouseover: function(){
          (this.infoWindow).open(this.map, this);
      },
      mouseout : function(){
          this.infoWindow.close();
      },
      click: function(event){
        window.open(`/beaches/${marker.id}`,'_self');
      }
    });
  });

  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(12);
  } else {
    map.setCenter(-22.97, -43.265387);
    map.setZoom(12);
  }

  const iconMap = {
    url: "http://maps.google.com/mapfiles/kml/shapes/man.png", // url
    scaledSize: new google.maps.Size(40, 40), // size
  };

  navigator.geolocation.getCurrentPosition((data) => {
    map.addMarker({
      lat: data["coords"].latitude,
      lng: data["coords"].longitude,
      title: "Minha localização",
      icon: iconMap
    });
  });
}
