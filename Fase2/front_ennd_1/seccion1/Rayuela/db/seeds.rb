p1 = Player.create(name: "Mew")
p2 = Player.create(name: "Trobin")
p3 = Player.create(name: "Luis Miauro")

g1 = Game.create()
g2 = Game.create()
g3 = Game.create()

r1 = Round.create(player_id: p1.id, game_id: g1.id, score: 1)
r2 = Round.create(player_id: p2.id, game_id: g1.id, score: 0)
r3 = Round.create(player_id: p2.id, game_id: g2.id, score: 1)
r4 = Round.create(player_id: p3.id, game_id: g2.id, score: 0)
r5 = Round.create(player_id: p1.id, game_id: g3.id, score: 1)
r6 = Round.create(player_id: p3.id, game_id: g3.id, score: 0)