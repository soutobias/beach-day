// import { createMap } from './plugins/init_mapbox'; // <-- add this line

const findWeather = () => {
  const weather_div = document.getElementById('weathers')
  if (weather_div) {
    const lat = document.getElementById('lat').textContent;
    console.log(lat)
    const lon = document.getElementById('lon').textContent;
    const url = `https://api.openweathermap.org/data/2.5/onecall?lat=${lat}&lon=${lon}&exclude=minutely&appid=39352aa3ee983b59623430b39d23fe25`;
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        const today = new Date();
        const today_1 = new Date(today)
        today_1.setDate(today_1.getDate() + 1)
        const today_2 = new Date(today)
        today_2.setDate(today_1.getDate() + 2)
        const today_3 = new Date(today)
        today_3.setDate(today_1.getDate() + 3)
        const today_4 = new Date(today)
        today_4.setDate(today_1.getDate() + 4)
        const today_5 = new Date(today)
        today_5.setDate(today_1.getDate() + 5)

        const days = [today, today_1, today_2, today_3, today_4, today_5]

        d = new Date(0)
        d.setUTCSeconds(utcSeconds);
        days.forEach((day) => {
          const description = data.current.weather[0].description;
          const img = `http://openweathermap.org/img/wn/${data.current.weather[0].icon}.png`;
          const temp = parseInt(data.current.temp, 10) - 273;
          const card = document.querySelector('.card-body');
          const weatherForecast = `<h5 class="card-title">Condições Meteorológicas</h5>
            <h6 class="card-subtitle mb-2 text-muted">${today.getDay()}, ${today.getMonth()}/${today.getDate()}, ${today.getHours()} hours</h6>
            <p class="card-text">${description}</p><div class="d-flex">
            <img src='${img}' alt=''>
            <p class="card-text">${temp}ºC</p>
            </div>`;

        }

  items.forEach((item) => {
    result += "\n";
    result += `  ${listItem(item)}`;
  });
  result += "\n</ul>";
  return result;

        const description = data.current.weather[0].description;
        const img = `http://openweathermap.org/img/wn/${data.current.weather[0].icon}.png`;
        const temp = parseInt(data.current.temp, 10) - 273;
        const card = document.querySelector('.card-body');
        const weatherForecast = `<h5 class="card-title">Condições Meteorológicas</h5>
          <h6 class="card-subtitle mb-2 text-muted">${today.getDay()}, ${today.getMonth()}/${today.getDate()}, ${today.getHours()} hours</h6>
          <p class="card-text">${description}</p><div class="d-flex">
          <img src='${img}' alt=''>
          <p class="card-text">${temp}ºC</p>
          </div>`;
        const weathers_div = document.getElementById('weather')
        weathers_div.insertAdjacentHTML("afterend", weatherForecast);
      });
    }
};

export { findWeather }; // <-- Add this line
