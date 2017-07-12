//función que inicia el juego
function start_game(subOne, subTwo) {
  
  //variable que tiene un arreglo asignado con la posición de los dos submarinos a destruir
  var winner = randomCell();

  if (winner == undefined) {
    console.log("*** FUE UNDEFINED ***");
    start_game();
  }
  console.log("Lo que tiene winner: " + winner);
  $('.cell').on("click", function(evento){
    // Cuando haga clic debe haber una petición de AJAX (un post)
    var playerClick = $(this).attr('id'); 
    var url = $('#play').attr('action');
    //¿qué debería ir aquí para conocer el número de submarinos destruidos o si el jugador es ganador?
    console.log("Lo que tiene playerClick: " + playerClick);
    var result = won(playerClick,winner);
    console.log("Game result " + result);
    //¿que debería ir aquí para mandar al controlador el conteo de submarinos destruidos y el
    //conteo de oportunidades por ronda?
    if (countForPlay == 2) {
      $.post( "/games", "score=" + result, function( data ) {
        console.log("data " + data);
      });
    }

    countForPlay += 1;

  });
  
  //función para conocer el número de submarinos destruidos o si el jugador es ganador
  function won(playerValue, subValue) {
    if (nowWinner >= 2){
      status = true;
      alert("Game Over");
    }
    if (countForPlay <= 2) {
      console.log("Lo que recibe won(): " + playerValue + "--" + subValue);
      if (playerValue == subValue[0] || playerValue == subValue[1]) {
        $('#' + playerValue).css("background","red");
        //variable que lleva el conteo de submarinos destruidos
        nowWinner += 1;
      }else{
        $('#' + playerValue).html("X");
      }
    }else{
      if (status == "false"){
        alert("Game Over");
      }
      if (countForPlay >= 2) {
        subValue.forEach(function(cel){
          $('#' + cel).css("background","red");
        });
      }
    }
    //¿que debería ir aquí para conocer el número de submarinos destruidos y conocer ganador?
    console.log("Lo que arroja score() " + score(nowWinner));
    console.log("Lo que arroja nowWinner: " + nowWinner);
    return nowWinner
  }
}

//función que muestra el score del jugador
function score(value) {
  console.log("Destroyed Submarines: " + value);
  if (value <= 2){
    $('h3').text('Destroyed Submarines: ' + value );
  }
  if (value == 2){
    $('#win').text('WINNER!');
  }
}

//función que genera el tablero de juego
var resetInit = function() {
  $("#container").empty();
  $("#container").innerHTML = '';
  $("#container div").fadeOut();
  $('#container').css('background','#FE7E25');
  $('.cell').css('color', 'white');
  $('#container').css('background','#FFFFFF');
  //¿qué debería ir aquí para generar las celdas cada vez que se inicia juego?
  for (var count = 0; count < 9; count += 1) {
    $( "#container" ).append( "<div id='c" + count + "' class='cell'></div>" );
  }
}

//función que genera la posición de los dos submarinos
var randomCell = function() {
  //variables para asignar el valor de la posición de los submarinos
  var subOne = 0;
  var subTwo = 0;
  //¿qué debería ir aquí para generar las dos posiciones de los submarinos?
  subOne = Math.floor((Math.random() * 8) + 1);
  subTwo = Math.floor((Math.random() * 8) + 1);
  console.log("**********************************");
  console.log("*** SubOne y subTwo---> "+ subOne+ "**" + subTwo);
  if (subOne == subTwo) {
    // subTwo = Math.floor((Math.random() * 8) + 1);
    randomCell();
  } else {
    var valueSubOne = "c" + subOne;
    var valueSubTwo = "c" + subTwo;
    console.log("Lo que retorna randomCell: " + [valueSubOne, valueSubTwo]);
    var cellArray = [valueSubOne, valueSubTwo];
    console.log("Cell array: " + cellArray)
    return cellArray
  }
}


$(document).ready(function(){
  	$('#play').on("submit", function(evento){
  	  evento.preventDefault();
      var url = $('#play').attr('action');
      $('#win').text(" ");
      //variable que lleva el conteo de oportunidades por ronda
      countForPlay = 0;
      //variable que lleva el conteo de submarinos destruidos
      nowWinner = 0;
      //variable que termina el juego 'alert game over'
      status = false;
      //¿que debería ir aquí para comenzar el juego?
      resetInit();
      start_game();
    });
});