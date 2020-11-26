
const toogleTab = () => {

  const clickButton1 = document.getElementById("tab1");
  const clickButton2 = document.getElementById("tab2");
  const clickButton3 = document.getElementById("tab3");
  const clickButton4 = document.getElementById("tab4");


  const tab1 = document.getElementById("review");
  const tab2 = document.getElementById("realtime");
  const tab3 = document.getElementById("weatherforecast");
  const tab4 = document.getElementById("traffic");

  if (clickButton1) {
    clickButton1.addEventListener('click', (event) => {
      event.currentTarget.classList.add('active');
      clickButton2.classList.remove('active');
      clickButton3.classList.remove('active');
      clickButton4.classList.remove('active');

      tab1.classList.remove('inactive-tab')
      tab2.classList.add('inactive-tab')
      tab3.classList.add('inactive-tab')
      tab4.classList.add('inactive-tab')
    });

    clickButton2.addEventListener('click', (event) => {
      event.currentTarget.classList.add('active');
      clickButton1.classList.remove('active');
      clickButton3.classList.remove('active');
      clickButton4.classList.remove('active');

      tab2.classList.remove('inactive-tab')
      tab1.classList.add('inactive-tab')
      tab3.classList.add('inactive-tab')
      tab4.classList.add('inactive-tab')
    });

    clickButton3.addEventListener('click', (event) => {
      event.currentTarget.classList.add('active');
      clickButton2.classList.remove('active');
      clickButton1.classList.remove('active');
      clickButton4.classList.remove('active');

      tab3.classList.remove('inactive-tab')
      tab2.classList.add('inactive-tab')
      tab1.classList.add('inactive-tab')
      tab4.classList.add('inactive-tab')
    });

    clickButton4.addEventListener('click', (event) => {
      event.currentTarget.classList.add('active');
      clickButton2.classList.remove('active');
      clickButton3.classList.remove('active');
      clickButton1.classList.remove('active');

      tab4.classList.remove('inactive-tab')
      tab2.classList.add('inactive-tab')
      tab3.classList.add('inactive-tab')
      tab1.classList.add('inactive-tab')
    });
  }
};

export { toogleTab };
