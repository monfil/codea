class Kitchener

  def initialize(order)
    @order = order
  end

  def make_tortas
    puts "Haciendo tortas..."
    oven1 = Oven.new(9, @order)
  end
end

class Torta
  attr_reader :ingredient, :time

  def initialize(ingredient, time)
    @ingredient = ingredient
    @time = time
  end  
end

class Oven
  
  def initialize (time, tray)
    @time = time
    @tray = tray
    baking(time, tray)
  end

  def baking(timer, tray)

    for current_time in 0..timer
      tray.each do |torta|
        puts status(torta, current_time, torta.time)
      end
    end
  end

  def status(torta, current_time, torta_time)
    if current_time >= 0 && current_time <= (torta_time - 3)
      "La torta de #{torta.ingredient} está cruda."
    elsif current_time >= 0 && current_time <= (torta_time - 1)
      "La torta de #{torta.ingredient} está casi lista."
    elsif current_time > torta_time
      "¡La torta de #{torta.ingredient} se quemó!"
    elsif current_time = torta_time
      "La torta de #{torta.ingredient} está lista."
    end
  end
end

# Driver code
salmon = Torta.new("Salmón", 5)
pastor = Torta.new("Pastor", 8)
pollo = Torta.new("Pollo", 6)

orden = [salmon, pastor, pollo]
lolo = Kitchener.new(orden)
lolo.make_tortas