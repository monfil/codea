$(document).ready(function() {
  console.log("Está listo el documento");
  $("#changuitos").on("submit", function(event){
  	event.preventDefault();
  	console.log("JQuery tomó el control");
  	$.post("/rolls", function(data){
  		console.log(data);
  		$("#die").html(data);
  	});
  });
});
