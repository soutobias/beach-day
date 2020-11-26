let map;

function initMap() {
  const mapElement = document.getElementById("map")
  if (mapElement) {
    const marker = JSON.parse(mapElement.dataset.markers)
    map = new google.maps.Map(mapElement,
    {
      center: {lat: parseFloat(marker.lat), lng: parseFloat(marker.lng)},
      zoom: 13
    });

    new google.maps.Marker({
      position: {lat: parseFloat(marker.lat), lng: parseFloat(marker.lng)},
      map,
      title: "Hello World!",
    });

    const trafficLayer = new google.maps.TrafficLayer();
    trafficLayer.setMap(map);

    const transitLayer = new google.maps.TransitLayer();
    transitLayer.setMap(map);

    const bikeLayer = new google.maps.BicyclingLayer();
    bikeLayer.setMap(map);
  }
}


export { initMap };
