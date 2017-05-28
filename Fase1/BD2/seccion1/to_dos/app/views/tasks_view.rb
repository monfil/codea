class TasksView
	# Recuerda que la única responsabilidad de la vista es desplegar data al usuario

	def index(tasks)
    puts "\n* * * Ésta es tu lista * * *\n\n"
    tasks.each do |task|
      if task.done == true
        mark = "X"
      else
        mark = " "
      end 
      puts "#{task.id}. [#{mark}] #{task.task}"
    end
	end

  def create(task)
    puts "Has agregado la tarea: #{task.task}, exitosamente."
  end

  def delete(task)
    puts "Has eliminado la tarea: <<#{task.task}>>, exitosamente."
  end

  def update(task)
    puts "¡Felicidades! Has completado la tarea: <<#{task.task}>>."
  end

	def error
    puts "\n¡¡La opción que elegiste es incorrecta!!\n\n"
	end

  def wrong_task
    puts "La tarea no existe."
  end
end
