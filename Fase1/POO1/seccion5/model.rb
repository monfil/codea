require 'csv'

class Task
	attr_accessor :task, :done

	def initialize(task, done = false)
		@task = task
		@done = done
	end
end

class List
	attr_accessor :list, :arr_list

	def initialize
		@arr_list = []
	end

	def add(task)
		@arr_list << [task.task, task.done]
		# p @arr_list
	end

	def create_csv
		CSV.open("list.csv", "wb") do |csv|
			@arr_list.each {|line| csv << line}
		end
	end

	def index
		count = 0
		CSV.foreach("list.csv") do |row|
			count += 1
			if row[1] == true
				mark = "X"
			else
				mark = " "
			end 
			p "#{count}. [#{mark}] #{row[0]}"
		end
	end

	def new_task(task)
		add(task)
		CSV.open("list.csv", "a+") do |csv|
			csv << @arr_list.last
		end

		def complete(index)
			count = 0
			CSV.foreach("list.csv", "r+") do |row|
				p row[1] = true if count == index
				count += 1
			end
		end

		def delete
		end

	end
end

# Driver code
# La lista se creará al momento de seleccionar la opción para crear una tarea.
list = List.new
# Llamar método add para crear cada tarea
list.add(Task.new("Bordar cositas"))
list.add(Task.new("Hacer cositas chiquitas"))
# El método create_csv, se llamará cuando se decida guardar la nueva lista
list.create_csv
# El método new_task se llamará para agregar una tarea a una lista existente
list.new_task(Task.new("Pasear a Chester"))
list.new_task(Task.new("Momir mucho"))
# El método complete se usará para cambiar el estatus de una tarea a completada
# list.complete(1)
list.index
list.new_task(Task.new("Alimentar a Mew"))
puts
list.index