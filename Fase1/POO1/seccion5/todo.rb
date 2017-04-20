require_relative 'model.rb'
require_relative 'view.rb'

class MainControler

  def initialize(argv)
    @action, *@argument = argv
    @task = @argument.join(" ") 
    @list = List.new
    @view = View.new
  end

  def index
    tasks = @list.index
    @view.print_index(tasks)
  end

  def add_task(argument)
    @list.add(Task.new(argument))
    @view.task_added(argument)
  end

  def delete_task(id)
    task_name = @list.delete(id.to_i)
    @view.task_deleted(task_name)
  end

  def complete_task(id)
    task_name = @list.complete(id.to_i)
    @view.task_completed(task_name)
  end

  def choose_action
    case @action
    when "index"
     index 
    when "add"
      add_task(@task)
    when "delete"
      delete_task(@task)
    when "complete"
      complete_task(@task)
    else
      @view.error
    end
  end

end

MainControler.new(ARGV).choose_action