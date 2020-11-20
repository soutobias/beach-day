function initMap() {
        // The location of Uluru
        const prainha = { lat: -23.0423, lng: -43.5072 };
        // The map, centered at Uluru
        const map = new google.maps.Map(document.getElementById("map"), {
          zoom: 4,
          center: prainha,
        });
        // The marker, positioned at Uluru
        const marker = new google.maps.Marker({
          position: prainha,
          map: map,
        });
      }
