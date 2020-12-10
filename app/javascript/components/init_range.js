
const rangeBegin = () => {
  const range = document.querySelector('.range-today')
  if (range) {
    const d = new Date();
    const range1 = document.getElementById('weather-range-0')
    range1.value = parseInt(d.getHours()/3) * 3;
    range.classList.remove('inactive-tab');
    const card = document.getElementById(`weather-day0-hour${range1.value}`)
    card.classList.remove('inactive-tab');
  }
};

const rangeWeather0 = () => {
  const range = document.getElementById('weather-range-0')
  if (range) {
    range.addEventListener('change', (event) => {
      const cards = document.querySelectorAll('.all-cards')
      cards.forEach((card) => {
        card.classList.add('inactive-tab');
      });
      const actual = document.getElementById(`weather-day0-hour${event.currentTarget.value}`)
      actual.classList.remove('inactive-tab');
    });
  }
};

const rangeWeather1 = () => {
  const range1 = document.getElementById('weather-range-1')
  if (range1) {
    range1.addEventListener('change', (event) => {
      const cards = document.querySelectorAll('.all-cards')
      cards.forEach((card) => {
        card.classList.add('inactive-tab');
      });
      const actual = document.getElementById(`weather-day1-hour${event.currentTarget.value}`)
      actual.classList.remove('inactive-tab');
    });
  }
};

const rangeWeather2 = () => {
  const range2 = document.getElementById('weather-range-2')
  const range7 = document.getElementById('weather-range-null')
  if (range2) {
    if (range7 === null){
      range2.addEventListener('change', (event) => {
        const cards = document.querySelectorAll('.all-cards')
        cards.forEach((card) => {
          card.classList.add('inactive-tab');
        });
        const actual = document.getElementById(`weather-day2-hour${event.currentTarget.value}`)
        actual.classList.remove('inactive-tab');
      });
    }
  }
};

const changeWeatherDay1 = () => {
  const cardDay = document.querySelector('.day-1')
  if (cardDay) {
    cardDay.addEventListener('click', (event) => {
      const cards = document.querySelectorAll('.all-cards')
      cards.forEach((card) => {
        card.classList.add('inactive-tab');
      });

      const inputs = document.querySelectorAll('#ranges')
      inputs.forEach((input) => {
        input.classList.add('inactive-tab');
      });

      const range = document.querySelector('.range-today_1')
      const range1 = document.getElementById('weather-range-1')
      range1.value = 0;
      range.classList.remove('inactive-tab');


      const actual = document.getElementById(`weather-day1-hour${range1.value}`)
      actual.classList.remove('inactive-tab');
    });
  }
};

const changeWeatherDay0 = () => {
  const cardDay = document.querySelector('.day-0')
  if (cardDay) {
    cardDay.addEventListener('click', (event) => {
      const cards = document.querySelectorAll('.all-cards')
      cards.forEach((card) => {
        card.classList.add('inactive-tab');
      });

      const inputs = document.querySelectorAll('#ranges')
      inputs.forEach((input) => {
        input.classList.add('inactive-tab');
      });

      rangeBegin();
    });
  }
};

const changeWeatherDay2 = () => {
  const cardDay = document.querySelector('.day-2')
  const range7 = document.getElementById('weather-range-null')
  if (cardDay) {
    cardDay.addEventListener('click', (event) => {
      const cards = document.querySelectorAll('.all-cards')
      cards.forEach((card) => {
        card.classList.add('inactive-tab');
      });

      const inputs = document.querySelectorAll('#ranges')
      inputs.forEach((input) => {
        input.classList.add('inactive-tab');
      });

      const range = document.querySelector('.range-today_2')
      const range1 = document.getElementById('weather-range-2')
      range1.value = 0;
      range.classList.remove('inactive-tab');

      if (range7 === null){
        const actual = document.getElementById(`weather-day2-hour${range1.value}`)
        actual.classList.remove('inactive-tab');
      } else{
        const actual = document.getElementById(`weather-day2`)
        actual.classList.remove('inactive-tab');
      }
    });
  }
};

const changeWeatherDay3 = () => {
  const cardDay = document.querySelector('.day-3')
  if (cardDay) {
    cardDay.addEventListener('click', (event) => {
      const cards = document.querySelectorAll('.all-cards')
      cards.forEach((card) => {
        card.classList.add('inactive-tab');
      });

      const inputs = document.querySelectorAll('#ranges')
      inputs.forEach((input) => {
        input.classList.add('inactive-tab');
      });

      const actual = document.getElementById(`weather-day3`)
      actual.classList.remove('inactive-tab');
    });
  }
};

const changeWeatherDay4 = () => {
  const cardDay = document.querySelector('.day-4')
  if (cardDay) {
    cardDay.addEventListener('click', (event) => {
      const cards = document.querySelectorAll('.all-cards')
      cards.forEach((card) => {
        card.classList.add('inactive-tab');
      });

      const inputs = document.querySelectorAll('#ranges')
      inputs.forEach((input) => {
        input.classList.add('inactive-tab');
      });

      const actual = document.getElementById(`weather-day4`)
      actual.classList.remove('inactive-tab');
    });
  }
};

export { rangeBegin, rangeWeather0, rangeWeather1, rangeWeather2, changeWeatherDay1, changeWeatherDay0, changeWeatherDay2, changeWeatherDay3, changeWeatherDay4 }; // <-- Add this line
