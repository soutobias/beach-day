let map;

function initMap() {
  const mapElement = document.getElementById("map")
  const marker = JSON.parse(mapElement.dataset.markers)
  console.log(marker)
  map = new google.maps.Map(mapElement,
  {
    center: {lat: parseFloat(marker.lat), lng: parseFloat(marker.lng)},
    zoom: 8
  });

  new google.maps.Marker({
    position: {lat: parseFloat(marker.lat), lng: parseFloat(marker.lng)},
    map,
    title: "Hello World!",
  });

  const trafficLayer = new google.maps.TrafficLayer();
  trafficLayer.setMap(map);
}

export { initMap };
