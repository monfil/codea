require 'csv'

class List

	def initialize
		@list = []
	end

	def add(task)
		@list << task
	end
end

class Task
	def initialize(task)
		@task = task
	end
end

class TaskWriter

	def initialize(file, list)
		@file = file
		@list = list
	end

	def create_csv
		CSV.open(@file, "wb") do |csv|
			@list.each {|item| csv << [list.task]}
		end
	end
end

class TaskParser
end

# Driver code
list = List.new
list.add(Task.new("Bordar cositas."))
list.add(Task.new("Hacer cositas chiquitas"))
p list
list_writer = TaskWriter.new("list.csv", list)
list_writer.create_csv