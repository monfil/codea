class Kitchener

  def initialize(order)
    @order = order
  end

  def make_tortas
    oven1 = Oven.new(1, @order)

    puts "Haciendo tortas..."
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

    for t in 0..timer
      tray.each do |torta|
        p status(torta, torta.time)
      end
    end
  end

  def status(torta, time)

    case time
    when 0..5 then "La torta de #{torta.ingredient} está cruda."
    #when 5..
    end
  end
end

# orden = []
# orden << Torta.new('jamon')
# orden << Torta.new('milanesa')
# orden << Torta.new('pastor')

# lolo = Kitchener.new(orden)
# lolo.make_tortas


salmon = Torta.new("Salmón", 5)
pastor = Torta.new("Pastor", 8)
pollo = Torta.new("Pollo", 6)

tray = [salmon, pastor, pollo]

bake = Oven.new(8, tray)
 
