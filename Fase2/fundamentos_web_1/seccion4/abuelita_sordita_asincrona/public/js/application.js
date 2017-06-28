$(document).ready(function(){
	// Este código corre después de que `document` fue cargado(loaded) 
	// completamente. 
	// Esto garantiza que si amarramos(bind) una función a un elemento 
	// de HTML este exista ya en la página.
	console.log("Está listo el documento");
	$("#abuelita").on("submit", function(event){
		event.preventDefault(); //JQuery toma el control
		console.log("JQuery tomó el control");
	});
});
