$(document).ready(function() {
	// Tu código va aquí
	// Cómo enlazar a través de un método bind la tecla con un método en particular (hacer un bind entre el documento y el método)
	count = 3;
	keyM = false;
	keyZ = false;
	playersResults = [];
	jugador1 = "";
	jugador2 = "";
	

	$("#new_game").on("submit", function(event){
		event.preventDefault();
		console.log("***JQuery");

		jugador1 = $('input[name=player1]').val();
		jugador2 = $('input[name=player2]').val();


		console.log(jugador1 + "**" + jugador2);
		console.log(playersResults)

		var data = $(this).serialize();
		console.log("***" + data);
		$.post("/game", data, function(info){
			// console.log(info);
			$("#game").html(info);
			$('#start_btn').on("click", function(event) {
				// event.preventDefault();
				console.log("Jugar");
				countdown();
			});
		});
	});
});

// ******************************************************
// Función para arrancar el juego (5, 4, 3...) con set interval
function countdown() {
	var interval = setInterval(function(){
		if ( count != 0) {
			$('#countdown').text(count);
			count--;
		}else {
			// Llamar al médodo para lanzar moneda
			$('#countdown').text('¡Empieza!');
			$('#start_btn').text('Reiniciar');
			console.log('Iniciando juego!');
			clearInterval(interval);
			throwCoin("Player1");
			stopCoin();
			throwCoin("Player2");
			stopCoin();
		}
	}, 1000);
}

// Función para mover la moneda eliminando y añadiendo la clase active
// Investigar el método settimeout para realizar el loop de forma recursiva
function throwCoin(player) {
	// Detectar quién es el actual activo y encontrar el siguiente y
	// colocarle la clase activa y removerla del anterior
	var currentActiveTd = $("#" + player + "> .active");
	var nextActiveTd = currentActiveTd.next();
	var index = $(nextActiveTd).attr("id");
	console.log(index);
	$(currentActiveTd).removeClass('active');
	$(nextActiveTd).addClass('active');
	console.log("Tecla z"+ keyZ);
	console.log("Tecla m"+ keyM);
	if ( index == 99 || (keyZ == true && player == "Player1")){

		if (player == "Player1") {
			console.log("Terminado Player1");
			playersResults.push(jugador1,index);
		}else {
			console.log("Terminado Player2");
			playersResults.push(jugador2,index);
		}

		console.log("***" + playersResults);
	}else if ( index == 99 || (keyM == true && player == "Player2")){

			if (player == "Player1") {
			console.log("Terminado Player1");
			playersResults.push(jugador1,index);
		}else {
			console.log("Terminado Player2");
			playersResults.push(jugador2,index);
		}

		// console.log("Terminado Player2");
		// playersResults.push(jugador2,index);
		console.log("***" + playersResults);
	}else{
		setTimeout(function(){ 
			throwCoin(player); 
		}, 10);
	}
	// getScore hasta que los dos jugadores hayan terminado
	console.log("***" + playersResults);
	count = playersResults.length;
	console.log(count);
	if (count == 4) {
		getScore();	
	}
}

// Función para detectar las teclas que presionan los usuarios
// Cachar con JQuery los valores de las teclas que presiona el usuario
// Cómo funciona el keyup y keydown
function stopCoin(){
	$(document).bind("keyup", function(e) {
		var key_pressed = e.keyCode
		console.log(key_pressed);
		if (key_pressed == 90){
			keyZ = true;
		}else if (key_pressed == 77) {
			keyM = true
		}
		console.log("final score " + playersResults);
	});
}

// Función para calcular el score y mandar la información al controlador
function getScore(){
	console.log("Entrando a score**");
	p1 = playersResults[2];
	p2 = playersResults[0];
	index1 = playersResults[3];
	index2 = playersResults[1];
	console.log("**" + index1 + "**" + index2);

	if (index1 > 88 && index2 > 88){
		console.log("¡Ambos jugadores perdieron!")
		var message = "¡Ambos jugadores perdieron!";
	}else if (index1 <= 88 && index2 <= 88){
		if (index1 > index2){
			var message = "¡Ganó " + p1 + " !";
		}else if (index1 < index2){
			var message = "¡Ganó " + p2 + " !";
		}else if (index1 == index2){
			var message = "¡Esto fue un empate!";
		}
	}else if (index1 > 88 || index2 > 88) {
		if (index1 > index2){
			var message = "¡Ganó " + p2 + " !";
		}else {
			var message = "¡Ganó " + p1 + " !";
		}
	}
	console.log(message);
	$('#countdown').text(message);

	var results = {resultados: playersResults};
	console.log(results);
	$.post('/results', results, function(e){
		console.log("Envié results a controlador");
		console.log(results);
		$("#stats").html(e);
	});
	// var dat = $(this).serialize();
	// 	console.log("***" + dat);
	// 	$("#stats").html(dat); // **
}

// Cuando jugador 2 llega a 99