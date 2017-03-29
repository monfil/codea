$global_var = "This is a global variable"
CONSTANT = 3.1416

class DummyClass
	@@class_variable = "This is a class variable"

	def initialize
		local_var = "this is my local var"
	end

	def return_my_local_var
		# local_var = "This is not the original value of my local var"
		@instance_var = "This is an instance var"
	end

	# Este es un getter
  def instance_var
    @instance_var
  end

# Este es un setter
  def instance_var=(value)
    @instance_var = value
  end

  def class_variable
    @@class_variable
  end

  def class_variable=(value)
    @@class_variable = value
  end

  def constant
  	CONSTANT
  end

  def global_var
  	$global_var
  end

  def global_var=(value)
  	$global_var = value
  end
end

#puts return_my_local_var

dummy = DummyClass.new
puts dummy.return_my_local_var

dummy_class = DummyClass.new
p dummy_class.instance_var=("Bar")
p dummy_class.instance_var   =    "Baz"

dummy_1 = DummyClass.new
dummy_2 = DummyClass.new

p dummy_1.class_variable
p dummy_2.class_variable

dummy_1.class_variable = "New value for the class variable"
p dummy_1.class_variable
p dummy_2.class_variable

p dummy_2.global_var
dummy_2.global_var = "This is not the original value of global_var"
p dummy_2.constant
p dummy_2.global_var
