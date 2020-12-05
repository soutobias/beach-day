import $ from 'jquery';

const initBar = () => {
  $('.barra-nivel').each(function() {
    var valorLargura = $(this).data('nivel');
    var valorNivel = $(this).html("");
    $(this).animate({
        width: valorLargura * 2 + '%'
    }, 600);
    $(this).addClass("class-blue1")
  });
};

export { initBar };
