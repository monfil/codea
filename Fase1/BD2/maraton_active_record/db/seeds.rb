# Este archivo sirve para crear registros de prueba
user1 = User.create(username: "fab", password: "123")
user2 = User.create(username: "mew", password: "234")

deck1 = Deck.create(deck_name: "Cultura general")
deck2 = Deck.create(deck_name: "Geografia")

game1 = Game.create(deck_id: deck1.id, user_id: user1.id)
game2 = Game.create(deck_id: deck2.id, user_id: user2.id)
game3 = Game.create(deck_id: deck2.id, user_id: user1.id)

card1 = Card.create(deck_id: deck1.id, question: "¿En qué ciudad se encuentra el Museo del Louvre?")
card2 = Card.create(deck_id: deck1.id, question: "¿Dónde se encuentra el Museo Van Gogh?")
card3 = Card.create(deck_id: deck1.id, question: "La estatua Cristo Redentor, ¿dónde se encuentra?")
card4 = Card.create(deck_id: deck1.id, question: "¿Cómo se denomina la persona que diseca animales?")
card5 = Card.create(deck_id: deck1.id, question: "¿En qué movimiento cultural se encuentra Joan Miró?")
card6 = Card.create(deck_id: deck1.id, question: "¿Cómo murió Juana de Arco?")
card7 = Card.create(deck_id: deck1.id, question: "¿Quién descubrió la penicilina?")
card8 = Card.create(deck_id: deck1.id, question: "¿Cómo es la carga del protón?")
card9 = Card.create(deck_id: deck1.id, question: "La ciencia o rama de la biología que estudia los vegetales se denomina:")
card10 = Card.create(deck_id: deck1.id, question: "¿Quién pintó La última cena?")
card11 = Card.create(deck_id: deck1.id, question: "¿Cuál es el elemento químico cuyo símbolo es Fe?")
card12 = Card.create(deck_id: deck1.id, question: "¿Cuál de las siguientes palabras es un sustantivo?")
card13 = Card.create(deck_id: deck1.id, question: "¿Cuál de las siguientes palabras tiene el mismo significado que <<suspicacia>>?")
card14 = Card.create(deck_id: deck1.id, question: "¿En qué movimiento cultural se encuentra Salvador Dalí?")

card15 = Card.create(deck_id: deck2.id, question: "Belgrado es la capital de:")
card16 = Card.create(deck_id: deck2.id, question: "El río más largo de África es:")
card17 = Card.create(deck_id: deck2.id, question: "La capital de Holanda es:")
card18 = Card.create(deck_id: deck2.id, question: "La capital de Dinamarca es:")
card19 = Card.create(deck_id: deck2.id, question: "¿Dónde se encuentra el Cabo de San Mateo?")
card20 = Card.create(deck_id: deck2.id, question: "Machu Pichu se encuentra en:")
card21 = Card.create(deck_id: deck2.id, question: "El océano de mayor área de la superficie en kilómetros cuadrados es:")
card22 = Card.create(deck_id: deck2.id, question: "La capital de Letonia es:")
card23 = Card.create(deck_id: deck2.id, question: "Ottawa es la capital de:")
card24 = Card.create(deck_id: deck2.id, question: "¿Cuál de los siguientes países no tiene frontera con España?")
card25 = Card.create(deck_id: deck2.id, question: "¿Cuál es la montaña más alta del mundo?")
card26 = Card.create(deck_id: deck2.id, question: "¿Cuál es el país más pobado del mundo?")
card27 = Card.create(deck_id: deck2.id, question: "¿En qué continente se encuentra Israel?")
card28 = Card.create(deck_id: deck2.id, question: "¿Cuántos países hay en el mundo?")

option1 = Option.create(card_id: card1.id, option: "Amsterdam", correct: false)
option2 = Option.create(card_id: card1.id, option: "Londres", correct: false)
option3 = Option.create(card_id: card1.id, option: "Paris", correct: true)

option4 = Option.create(card_id: card2.id, option: "Amsterdam", correct: true)
option5 = Option.create(card_id: card2.id, option: "Londres", correct: false)
option6 = Option.create(card_id: card2.id, option: "Paris", correct: false)

option7 = Option.create(card_id: card3.id, option: "Venezuela", correct: false)
option8 = Option.create(card_id: card3.id, option: "Ecuador", correct: false)
option9 = Option.create(card_id: card3.id, option: "Brasil", correct: true)

option10 = Option.create(card_id: card4.id, option: "Taxidermista", correct: true)
option11 = Option.create(card_id: card4.id, option: "Taxidermo", correct: false)
option12 = Option.create(card_id: card4.id, option: "Taxidermiante", correct: false)

option13 = Option.create(card_id: card5.id, option: "Impresionismo", correct: false)
option14 = Option.create(card_id: card5.id, option: "Surrealismo", correct: true)
option15 = Option.create(card_id: card5.id, option: "Cubismo", correct: false)

option16 = Option.create(card_id: card6.id, option: "Quemada en la hoguera", correct: true)
option17 = Option.create(card_id: card6.id, option: "Decapitada", correct: false)
option18 = Option.create(card_id: card6.id, option: "Envenenada", correct: false)

option19 = Option.create(card_id: card7.id, option: "Marie Curie", correct: false)
option20 = Option.create(card_id: card7.id, option: "Pasteur", correct: false)
option21 = Option.create(card_id: card7.id, option: "Flemming", correct: true)

option22 = Option.create(card_id: card8.id, option: "Negativa", correct: false)
option23 = Option.create(card_id: card8.id, option: "Positiva", correct: true)
option24 = Option.create(card_id: card8.id, option: "No tiene carga", correct: false)

option25 = Option.create(card_id: card9.id, option: "Botanica", correct: true)
option26 = Option.create(card_id: card9.id, option: "Ecologia", correct: false)
option27 = Option.create(card_id: card9.id, option: "Microbiologia", correct: false)

option28 = Option.create(card_id: card10.id, option: "Tiziano", correct: false)
option29 = Option.create(card_id: card10.id, option: "Miguel Angel", correct: false)
option30 = Option.create(card_id: card10.id, option: "Da Vinci", correct: true)

option31 = Option.create(card_id: card11.id, option: "Hierro", correct: true)
option32 = Option.create(card_id: card11.id, option: "Ferilio", correct: false)
option33 = Option.create(card_id: card11.id, option: "ESTRONCIO", correct: false)

option34 = Option.create(card_id: card12.id, option: "Comer", correct: false)
option35 = Option.create(card_id: card12.id, option: "Completar", correct: false)
option36 = Option.create(card_id: card12.id, option: "Manjar", correct: true)

option37 = Option.create(card_id: card13.id, option: "Recelo", correct: true)
option38 = Option.create(card_id: card13.id, option: "Vínculo", correct: false)
option39 = Option.create(card_id: card13.id, option: "Sobriedad", correct: false)

option40 = Option.create(card_id: card14.id, option: "Romanticismo", correct: false)
option41 = Option.create(card_id: card14.id, option: "Surrealismo", correct: true)
option42 = Option.create(card_id: card14.id, option: "Fauvismo", correct: false)

option76 = Option.create(card_id: card15.id, option: "Serbia", correct: true)
option77 = Option.create(card_id: card15.id, option: "Suiza", correct: false)
option78 = Option.create(card_id: card15.id, option: "Estonia", correct: false)

option43 = Option.create(card_id: card16.id, option: "Nilo", correct: true)
option44 = Option.create(card_id: card16.id, option: "Rahad", correct: false)
option45 = Option.create(card_id: card16.id, option: "Akobo", correct: false)

option46 = Option.create(card_id: card17.id, option: "Amsterdam", correct: true)
option47 = Option.create(card_id: card17.id, option: "Helsinki", correct: false)
option48 = Option.create(card_id: card17.id, option: "Berlin", correct: false)

option49 = Option.create(card_id: card18.id, option: "Zagreb", correct: false)
option50 = Option.create(card_id: card18.id, option: "Bratislava", correct: false)
option51 = Option.create(card_id: card18.id, option: "Copenhague", correct: true)

option52 = Option.create(card_id: card19.id, option: "Grecia", correct: false)
option53 = Option.create(card_id: card19.id, option: "Francia", correct: true)
option54 = Option.create(card_id: card19.id, option: "España", correct: false)

option55 = Option.create(card_id: card20.id, option: "Bolivia", correct: false)
option56 = Option.create(card_id: card20.id, option: "Peru", correct: true)
option57 = Option.create(card_id: card20.id, option: "Colombia", correct: false)

option58 = Option.create(card_id: card21.id, option: "Océano Pacífico", correct: true)
option59 = Option.create(card_id: card21.id, option: "Océano Atlántico", correct: false)
option60 = Option.create(card_id: card21.id, option: "Océano Índico", correct: false)

option61 = Option.create(card_id: card22.id, option: "Bishkek", correct: false)
option62 = Option.create(card_id: card22.id, option: "Vilna", correct: false)
option63 = Option.create(card_id: card22.id, option: "Riga", correct: true)

option64 = Option.create(card_id: card23.id, option: "Canadá", correct: true)
option65 = Option.create(card_id: card23.id, option: "Cuba", correct: false)
option66 = Option.create(card_id: card23.id, option: "Estados Unidos", correct: false)

option67 = Option.create(card_id: card24.id, option: "Italia", correct: true)
option68 = Option.create(card_id: card24.id, option: "Francia", correct: false)
option69 = Option.create(card_id: card24.id, option: "Portugal", correct: false)

option70 = Option.create(card_id: card25.id, option: "Kilimanjaro", correct: false)
option71 = Option.create(card_id: card25.id, option: "Monte Kimberley", correct: false)
option72 = Option.create(card_id: card25.id, option: "Monte Everest", correct: true)

option73 = Option.create(card_id: card26.id, option: "India", correct: false)
option74 = Option.create(card_id: card26.id, option: "Bangladesh", correct: false)
option75 = Option.create(card_id: card26.id, option: "China", correct: true)

option79 = Option.create(card_id: card27.id, option: "Europa", correct: false)
option80 = Option.create(card_id: card27.id, option: "Asia", correct: true)
option81 = Option.create(card_id: card27.id, option: "Africa", correct: false)

option82 = Option.create(card_id: card28.id, option: "192", correct: false)
option83 = Option.create(card_id: card28.id, option: "196", correct: true)
option84 = Option.create(card_id: card28.id, option: "214", correct: false)


game_answer1 = GameAnswer.create(game_id: game1.id, card_id: card1.id, answer: option2.id, score: 0)
game_answer1 = GameAnswer.create(game_id: game1.id, card_id: card2.id, answer: option5.id, score: 0)
game_answer1 = GameAnswer.create(game_id: game1.id, card_id: card3.id, answer: option9.id, score: 1)
game_answer1 = GameAnswer.create(game_id: game1.id, card_id: card4.id, answer: option12.id, score: 1)
game_answer1 = GameAnswer.create(game_id: game1.id, card_id: card5.id, answer: option14.id, score: 1)
game_answer1 = GameAnswer.create(game_id: game1.id, card_id: card6.id, answer: option17.id, score: 0)
game_answer1 = GameAnswer.create(game_id: game1.id, card_id: card7.id, answer: option21.id, score: 1)
game_answer1 = GameAnswer.create(game_id: game1.id, card_id: card8.id, answer: option25.id, score: 1)
game_answer1 = GameAnswer.create(game_id: game1.id, card_id: card9.id, answer: option26.id, score: 1)
game_answer1 = GameAnswer.create(game_id: game1.id, card_id: card10.id, answer: option29.id, score: 0)
game_answer1 = GameAnswer.create(game_id: game1.id, card_id: card11.id, answer: option34.id, score: 0)
game_answer1 = GameAnswer.create(game_id: game1.id, card_id: card12.id, answer: option35.id, score: 0)
game_answer1 = GameAnswer.create(game_id: game1.id, card_id: card13.id, answer: option37.id, score: 1)
game_answer1 = GameAnswer.create(game_id: game1.id, card_id: card14.id, answer: option43.id, score: 1)