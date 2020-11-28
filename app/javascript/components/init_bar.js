import $ from 'jquery';

const initBar = () => {
  $('.barra-nivel').each(function() {
    var valorLargura = $(this).data('nivel');
    var valorNivel = $(this).html("<span class='valor-nivel'>"+valorLargura / 10 +" / 10</span>");
      $(this).animate({
          width: valorLargura * 3
      });
  });
};


export { initBar };
