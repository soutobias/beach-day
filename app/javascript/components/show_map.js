const showMap = () => {

  const clickButton1 = document.getElementById("show-map");
  const map = document.getElementById("map1");
  const imgMap = document.getElementById("img-map");

  if (clickButton1) {
    clickButton1.addEventListener('click', (event) => {
      if (imgMap.classList.contains('pressed')){
        imgMap.classList.remove('pressed');
        map.classList.add('inactive-tab');
        event.currentTarget.title = "Mostrar Mapa";
      } else {
        imgMap.classList.add('pressed');
        map.classList.remove('inactive-tab');
        event.currentTarget.title = "Esconder Mapa";
      }
    });
  }
};

export { showMap };
