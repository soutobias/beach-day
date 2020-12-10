import bikeIcon from '../images/bike.png';
import carIcon from '../images/car.png';
import busIcon from '../images/bus.png';


function initMap() {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const marker = JSON.parse(mapElement.dataset.markers)
    const directionsService = new google.maps.DirectionsService();
    const directionsRenderer = new google.maps.DirectionsRenderer({
      suppressMarkers: true,
      preserveViewport: true
    });

    let map = new google.maps.Map(mapElement, {
      center: {lat: parseFloat(marker.lat), lng: parseFloat(marker.lng)},
      zoom: 15
    });

    const icon = {
      url: "http://maps.google.com/mapfiles/kml/shapes/man.png", // url
      scaledSize: new google.maps.Size(40, 40), // size
    };

    const icon2 = {
      url: "http://maps.google.com/mapfiles/kml/shapes/sunny.png", // url
      scaledSize: new google.maps.Size(40, 40), // size
    };


    new google.maps.Marker({
      position: {lat: parseFloat(marker.lat), lng: parseFloat(marker.lng)},
      map,
      title: marker.name,
      infoWindow: {
        content: `<p class="map-p pt-2">${marker.name}</p>`
      },
      mouseover: function(){
        (this.infoWindow).open(this.map, this);
      },
      mouseout : function(){
        this.infoWindow.close();
      },
      icon: icon2
    });

    const trafficLayer = new google.maps.TrafficLayer();
    trafficLayer.setMap(map);

    const transitLayer = new google.maps.TransitLayer();
    transitLayer.setMap(map);

    const bikeLayer = new google.maps.BicyclingLayer();
    bikeLayer.setMap(map);


    navigator.geolocation.getCurrentPosition((data) => {
      new google.maps.Marker({
        position: {lat: data["coords"].latitude, lng: data["coords"].longitude},
        map,
        title: "Minha Localização",
        icon: icon
      });
      directionsRenderer.setMap(map);
      calculateAndDisplayRoute(directionsService, directionsRenderer, data, marker);
      const bikeButton = document.getElementById("bicycling")
      const carButton = document.getElementById("driving")
      const busButton = document.getElementById("transit")

      bikeButton.addEventListener("click", () => {
        if (!event.currentTarget.classList.contains("pressed-direction")) {
          event.currentTarget.classList.add("pressed-direction")
          carButton.classList.remove("pressed-direction")
          busButton.classList.remove("pressed-direction")
          calculateAndDisplayRoute(directionsService, directionsRenderer, data, marker);
        }
      });

      carButton.addEventListener("click", () => {
        if (!event.currentTarget.classList.contains("pressed-direction")) {
          event.currentTarget.classList.add("pressed-direction")
          bikeButton.classList.remove("pressed-direction")
          busButton.classList.remove("pressed-direction")
          calculateAndDisplayRoute(directionsService, directionsRenderer, data, marker);
        }
      });
      busButton.addEventListener("click", () => {
        if (!event.currentTarget.classList.contains("pressed-direction")) {
          event.currentTarget.classList.add("pressed-direction")
          carButton.classList.remove("pressed-direction")
          bikeButton.classList.remove("pressed-direction")
          calculateAndDisplayRoute(directionsService, directionsRenderer, data, marker);
        }
      });
    });
  }
}


function calculateAndDisplayRoute(directionsService, directionsRenderer, data1, marker) {
  const selectedMode = document.querySelector(".pressed-direction").title;
  directionsService.route(
    {
      origin: { lat: data1["coords"].latitude, lng: data1["coords"].longitude },
      destination: {lat: parseFloat(marker.lat), lng: parseFloat(marker.lng)},
      travelMode: google.maps.TravelMode[selectedMode],
    },
    (response, status) => {
      if (status == "OK") {
        const data = response;
        directionsRenderer.setDirections(response);
        if (selectedMode === "DRIVING"){
          const trafficDistance = data.routes[0].legs[0].distance.text
          const trafficTime = data.routes[0].legs[0].duration.text
          const card = document.querySelector('#car');
          const card1 = document.querySelector('#public-transportation');
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
          card1.innerHTML = "";
        } else if (selectedMode === "TRANSIT"){
          const trafficDistance = data.routes[0].legs[0].distance.text
          const trafficTime = data.routes[0].legs[0].duration.text
          const steps = data.routes[0].legs[0].steps
          let routes = ""
          let vehicle
          let line
          let lineName
          let trecho = 1
          steps.forEach((step) => {
            if (step.transit) {
              line = step.transit.line.short_name
              lineName = step.transit.line.name
              vehicle = step.transit.line.vehicle.name
              if (vehicle === "Ônibus"){
                routes = routes + `<p>Trecho ${trecho} - ${vehicle}: ${line} (${lineName})</p>`
              } else{
                routes = routes + `<p>Trecho ${trecho} - ${vehicle}: ${lineName}</p>`
              }
              trecho = trecho + 1
            }
          });
          const card = document.querySelector('#public-transportation');
          const card1 = document.querySelector('#car');
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
          card1.innerHTML = "";
        } else {
          const trafficDistance = data.routes[0].legs[0].distance.text
          const trafficTime = data.routes[0].legs[0].duration.text
          const card = document.querySelector('#car');
          const card1 = document.querySelector('#public-transportation');
          const traffic = `
            <div class="d-flex p-1 align-items-center">
              <img class="image-smallss pr-2" src=${bikeIcon}/>
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
          card1.innerHTML = "";
        }
      } else {
        window.alert("Directions request failed due to " + status);
      }
    }
  );
}

export { initMap };
