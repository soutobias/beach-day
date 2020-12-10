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

let x
function initMap1() {
  const mapElement = document.getElementById('map1');
  if (mapElement) {
    const markers = JSON.parse(mapElement.dataset.markers)

    const iconRed = {
      url: "https://img.icons8.com/emoji/48/000000/red-circle-emoji.png", // url
      scaledSize: new google.maps.Size(55, 55), // size
    };

    const iconBlue = {
      url: "https://img.icons8.com/emoji/48/000000/blue-circle-emoji.png", // url
      scaledSize: new google.maps.Size(55, 55), // size
    };

    const iconOrange = {
      url: "https://img.icons8.com/emoji/48/000000/orange-circle-emoji.png", // url
      scaledSize: new google.maps.Size(55, 55), // size
    };

    let map = new google.maps.Map(mapElement, {
      center: { lat: -22.97, lng: -43.265387},
      zoom: 12, mapTypeId: 'satellite'
    });
    const icon2 = {
      url: "http://maps.google.com/mapfiles/kml/shapes/man.png", // url
      scaledSize: new google.maps.Size(50, 50), // size
    };

    const icon3 = {
      url: "https://www.flaticon.com/svg/static/icons/svg/169/169367.svg", // url
      scaledSize: new google.maps.Size(40, 40), // size
    };

    let icon
    let rating
    let mark
    let infowindow
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
      mark = new google.maps.Marker({
        position: {lat: parseFloat(marker.lat), lng: parseFloat(marker.lng)},
        map,
        title: marker.name,
        label: {
          text: rating.toString(),
          fontFamily: "'Lato', sans-serif"
        },
        icon: icon
      });
      infowindow = new google.maps.InfoWindow({
        content: `<div class="d-flex align-items-center"><p class="map-p pt-2">${marker.name}</p><img class="map-img" src=${x}/></div>`,
      });
      mark.addListener('mouseover', function() {
          infowindow.open(map, this);
      });

      // assuming you also want to hide the infowindow when user mouses-out
      mark.addListener('mouseout', function() {
          infowindow.close();
      });
      mark.addListener('click', function() {
          window.open(`/beaches/${marker.id}`,'_self');
      });
    });
    navigator.geolocation.getCurrentPosition((data) => {
      new google.maps.Marker({
        position: {lat: data["coords"].latitude, lng: data["coords"].longitude},
        map,
        title: "Minha Localização",
        icon: icon2
      });
    });
  }
}

export { initMap1 };
