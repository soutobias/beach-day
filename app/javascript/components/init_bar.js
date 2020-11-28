import $ from 'jquery';

const initBar = () => {
  $('.barra-nivel').each(function() {
    var valorLargura = $(this).data('nivel');
    var valorNivel = $(this).html("");
      $(this).animate({
          width: valorLargura * 3
      });
    if(valorLargura < 50 ) {
      $(this).addClass("class-blue1")
    }
    if (valorLargura >= 50 ) {
      $(this).addClass("class-blue2")
    }
    if (valorLargura >= 60 ) {
      $(this).addClass("class-blue3")
    }
  });
};


export { initBar };
