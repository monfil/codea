$(document).ready(function () {
  // Escribe tu código aquí
  // var list = $("li").siblings();
  $('#tab1').show();
  $('.tabs li').click(function(){
  	// Quita la clase activa al tab anterior
  	var ant = $(this).siblings("li").removeClass('active');
  	// Oculta la información del tab anterior
  	$('.tab').hide();
  	// Agrega la clase activa al tab actual
  	var act = $(this).addClass('active');
  	// Obtiene el atributo href
  	var act_li = $(this).children('a').attr("href");
  	// Muestra la información del tab actual con un efecto
  	$(act_li).fadeIn(1000);
  });
});