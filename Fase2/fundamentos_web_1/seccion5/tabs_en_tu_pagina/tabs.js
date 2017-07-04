$(document).ready(function () {
  // Escribe tu código aquí
  // var list = $("li").siblings();
  $('#tab1').show();
  $('.tabs li').click(function(){
  	// Quita la clase activa al tab anterior
  	var ant = $(this).siblings("li").removeClass('active');
  	$('.tab').hide();
  	// Agrega la clase activa al tab actual
  	var act = $(this).addClass('active');
  	console.log(this);
  	// Obtiene el atributo href
  	var act_li = $(this).children('a').attr("href");
  	console.log(act_li);
  	// $(act_li);
  	$(act_li).fadeIn(1000);
  });
});