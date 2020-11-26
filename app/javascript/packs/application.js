// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import { initUpdateH1OnScroll } from '../components/init_h1';
import { rangeBegin, rangeWeather0, rangeWeather1, rangeWeather2, changeWeatherDay1, changeWeatherDay0, changeWeatherDay2, changeWeatherDay3, changeWeatherDay4 } from '../components/init_range'; // <-- add this line
<<<<<<< HEAD
=======
import { toogleTab } from '../components/tabs_index';
>>>>>>> 35f5b334c6fb1cbc167459f0fffb9f4e7f0b2c10


import { initMap } from 'packs/map';

document.addEventListener('turbolinks:load', () => {
  initMap();
  initUpdateH1OnScroll();
  rangeBegin();
  rangeWeather0();
  rangeWeather1();
  rangeWeather2();
  changeWeatherDay1();
  changeWeatherDay0();
  changeWeatherDay2();
  changeWeatherDay3();
  changeWeatherDay4();
<<<<<<< HEAD
=======
  toogleTab();
>>>>>>> 35f5b334c6fb1cbc167459f0fffb9f4e7f0b2c10
});

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
