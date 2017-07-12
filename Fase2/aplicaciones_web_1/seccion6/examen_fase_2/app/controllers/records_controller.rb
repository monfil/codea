get '/records' do
  #¿Qué va en esta parte para obtener la lista de ganadores (juegos ganados)? Ordenados en orden descendente
  @users = User.all
  @winners = {}
  @users.each do |user|
  	@winners["#{user.name}"] = user.rounds.where(result: "Winner!").count
  end
  @stats = @winners.sort_by{ |k,v| v}.reverse.to_h
  p "****W I N N E R S" * 4
  p @winners
  p @stats
	erb :record
end