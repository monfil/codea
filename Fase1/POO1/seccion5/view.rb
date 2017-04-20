class View
  def print_index(tasks)
    puts "\n* * * Ésta es tu lista * * *\n\n"
    tasks.each_with_index do |task, index|
      if task.done == "true"
        mark = "X"
      else
        mark = " "
      end 
      puts "#{index + 1}. [#{mark}] #{task.task}"
    end
  end

  def task_added(task_name)
    puts "Has agregado la tarea: #{task_name}, exitosamente."
  end

  def task_deleted(name_task)
    if name_task != false
      puts "Has eliminado la tarea: <<#{name_task}>>, exitosamente."
    else
      puts "La tarea no existe."
    end
  end

  def task_completed(name_task)
    if name_task != false
      puts "¡Felicidades! Has completado la tarea: <<#{name_task}>>."
    else
      puts "La tarea no existe."
    end
  end

  def error
    puts "\n¡¡La opción que elegiste es incorrecta!!\n\n"
  end

end
