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
		@arr_list = CSV.read("list.csv")
	end

	def add(task)
		CSV.open("list.csv", "a+") do |csv|
			csv << [task.task, task.done]
		end
	end

	def write_csv(new_list)
		CSV.open("list.csv", "wb") do |csv|
			new_list.each {|line| csv << line}
		end
	end

	def index
		task_array = []
		CSV.foreach("list.csv") do |row|
      task_array << Task.new(row[0], row[1])
    end
    task_array
	end

	def delete(id)
		name = false
		list_array = CSV.read("list.csv")
		list_array.each_with_index do |task, index|
			if index == (id - 1)
				list_array.delete_at(index)
				name = task[0]
			end
		end
		write_csv(list_array)
		name
	end

	def complete(id)
		name = false
		task_array = CSV.read("list.csv")
    task_array.each_with_index do |task, index|
    	if index == (id - 1)
    		task[1] = true
    		name = task[0]
    	end
    end
    write_csv(task_array)
    name
	end

end