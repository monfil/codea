class TasksController
  def initialize(args)
    @action, *@argument = args
    @task = @argument.join(" ") 
    @view = TasksView.new
    choose_action
  end

  def index
    # TIP: Aquí debes de llamar al método del mismo nombre de @view
    p tasks = Task.all
    @view.index(tasks)
  end

  def add
    new_task = Task.create(task: @task)
    @view.create(new_task)
  end

  def delete
    deleted_task = Task.find_by(id: @task)
    if deleted_task != nil
      deleted_task.destroy
      @view.delete(deleted_task)
    else
      @view.wrong_task
    end
    
  end

  def complete
    updated_task = Task.find_by(id: @task.to_i)
    if updated_task != nil
      updated_task.done = true
      updated_task.save
      @view.update(updated_task)
    else
      @view.wrong_task
    end
  end

  def choose_action
    case @action
    when "index"
     index 
    when "add"
      add
    when "delete"
      delete
    when "complete"
      complete
    else
      @view.error
    end
  end
end
