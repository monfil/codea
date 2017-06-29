get '/' do
  @rolls = []

  3.times { @rolls << Roll.create }

  @win = "WINNER!!" if @rolls.map! { |roll| roll.value }.uniq.count == 1

  erb :index
end

# QUE HACER?: Convierte esta ruta para que utilice Ajax y si la petición no es
# de Ajax de igual forma sirva.
post '/rolls' do
  if request.xhr?
    rola_a_los_changuitos
    erb :_die_roll, layout: false  # TIP: Qué esté haciendo esto y qué debe hacer diferente.
  else
    rola_a_los_changuitos
    erb :index 
  end
end

def rola_a_los_changuitos
  @rolls = []
  if params[:value]
    3.times { @rolls << Roll.create({ value: value }) }
  else
    3.times { @rolls << Roll.create }
  end
  @win = "WINNER!!" if @rolls.map! { |roll| roll.value }.uniq.count == 1
end
