class TasksController
  def initialize(args)
    @view = TasksView.new
  end

  def index
    # TIP: Aquí debes de llamar al método del mismo nombre de @view
    task = Task.all
  end

  def add
  end

  def delete
  end

  def complete
  end
end
