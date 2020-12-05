import $ from 'jquery';

const initBar1 = () => {
  $('.barra-nivel1').each(function() {
    var valorLargura = $(this).data('nivel');
    var valorNivel = $(this).html("<span class='valor-nivel'></span>");
    $(this).animate({
        width: valorLargura * 6
    });
    $(this).addClass("class-blue1")
  });
};

export { initBar1};
