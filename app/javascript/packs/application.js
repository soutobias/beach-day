// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("chartkick")
require("chart.js")

// require("select2")
// require("_tree")

import { initUpdateH1OnScroll } from '../components/init_h1';
import { rangeBegin, rangeWeather0, rangeWeather1, rangeWeather2, changeWeatherDay1, changeWeatherDay0, changeWeatherDay2, changeWeatherDay3, changeWeatherDay4 } from '../components/init_range'; // <-- add this line


import { toogleTab } from '../components/tabs_index';
import { initBar } from '../components/init_bar';
import { initBar1 } from '../components/init_bar1';
import { autocompleteSearch } from '../components/autocomplete';
import { showMap } from '../components/show_map';
import { initMap } from '../components/map';



document.addEventListener('turbolinks:load', () => {
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
  toogleTab();
  initBar();
  initBar1();
  autocompleteSearch();
  initMap();
  showMap();
});

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
