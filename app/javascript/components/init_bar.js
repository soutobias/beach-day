import $ from 'jquery';

const initBar = () => {
  $('.barra-nivel').each(function() {
    var valorLargura = $(this).data('nivel');
    var valorNivel = $(this).html("<span class='valor-nivel'>"+valorLargura+"</span>");
      $(this).animate({
          width: valorLargura
      });
  });
};

export { initBar };
