import $ from 'jquery';

const initBar1 = () => {
  $('.barra-nivel1').each(function() {
    var valorLargura = $(this).data('nivel');
    var valorNivel = $(this).html("<span class='valor-nivel'>"+valorLargura / 10 +" / 10</span>");
      $(this).animate({
          width: valorLargura * 3
      });
    if(valorLargura < 50 ) {
      $(this).addClass("class-red")
    }
    if (valorLargura >= 50 ) {
      $(this).addClass("class-yellow")
    }
    if (valorLargura >= 60 ) {
      $(this).addClass("class-blue")
    }
  });
};

export { initBar1};
