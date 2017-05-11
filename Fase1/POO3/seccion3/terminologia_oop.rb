# La herencia es la capacidad de crear clases derivadas a partir de una calse base.
# Esta propiedad, permite compartir automáticamente métodos y atributos entre clases, 
# subclases y objetos.
# Ejemplo: 

class Mamifero
	attr_reader :age, :gender

	def initialize(age, gender)
		@age = age
		@gender = gender
	end
  
  def respirar
    puts 'Inhalar... exhalar...'
  end

end

class Gato < Mamifero

  def maullar
    puts 'Miaaaaaaaaaaau...'
  end

end
 
cribas = Gato.new(1,"Macho")
cribas.respirar
cribas.maullar

# La composición es una relación dependiente, en la que un objeto se puede formar por 
# otros objetos. El objeto en el nivel superior de la jerarquía es el todo, y los que
# están en los niveles inferiores son sus partes o componentes. Ésta relación es tan 
# fuerte que si uno de los componentes es eliminado o desaparece, la clase mayor deja
# de existir.

class View
end

class MainControler
	def initialize
		@view = View.new
	end
end

# El encapsulamiento consiste en ocultar detalles de la implementación de un objeto, se 
# realiza definiendo componentes públicos, componentes privados.

class List

	def delete_task(id)
		# código para eliminar producto
		array = []
		file = ""

		write_csv(array, file)

	end

	private

	def write_csv(new_list, file)

	end
end

# Duck Typing se refiere a la tendencia de Ruby a centrarse menos en la clase de un objeto, 
# y dar prioridad a su comportamiento: qué métodos se pueden usar, y qué operaciones se 
# pueden hacer con él.

class Document
  def initialize
  end

  def print
    raise NotImplementedError, 'You must implement the print method'
  end
end

class XmlDocument < Document
  def print
    p 'Print from XmlDocument'
  end
end

class HtmlDocument < Document
  def print
    p 'Print from HtmlDocument'
  end
end

class Printer
  def initialize(document)
    @document = document
  end

  def print
    @document.print
  end
end

Printer.new(XmlDocument.new).print
Printer.new(HtmlDocument.new).print