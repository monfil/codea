puts "self es igual a: #{self}"

class DummyClass

  def class_method
    puts "Esto esta corriendo cuando se define la clase"
    puts "En este contexto self es igual a: #{self}"
  end
end

dummy_class = DummyClass.new()
puts dummy_class.class_method

# Self es una variable especial que apunta al objeto que posee el código en ejecución.