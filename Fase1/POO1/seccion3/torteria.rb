class Kitchener

  def initialize(order)
    @order = order
  end

  def make_tortas
    puts "Haciendo tortas..."
    puts @order
  end

  def put_in_oven
  end

  def check_tortas
  end

  def take_out_the_oven
  end
end

class Torta

  def initialize(quantity, ingredient)
    @quantity = quantity
    @ingredient = ingredient
  end

  type = {
    :jamon => {:crudo => 1, :casi_listo => 5, :listo => 7, :quemado => 8},
    :pollo => {:crudo => 3, :casi_listo => 8, :listo => 10, :quemado => 12},
    :milanesa => {:crudo => 3, :casi_listo => 10, :listo => 13, :quemado => 14},
    :pastor => {:crudo => 5, :casi_listo => 10, :listo => 15, :quemado => 16}
  }
  
  def state_of_baking
  end
end

class Oven
  def turn_on
  end

  def turn_off
  end

  def open
  end

  def close
  end

  def timer
  end
end

orden = []
t1= [Torta.new(6, 'pastor')]
p t1
orden << Torta.new(2, 'jamon')
orden << Torta.new(1, 'milanesa')
orden << Torta.new(3, 'pastor')

lolo = Kitchener.new(orden)
lolo.make_tortas

