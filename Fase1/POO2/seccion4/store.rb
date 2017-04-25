require_relative 'model.rb'
require_relative 'view.rb'

class MainControler
  def initialize
    @view = View.new
    @option = @view.main_menu
  end

  def login
  end

  def register
    @view.register_selected
  end

  def exit
    @view.exit_selected
  end

  def error
    @option = @view.error
    selected_option
  end

  def selected_option
    case @option
    when "1"
      login
    when "2"
      register
    when "3"
      exit
    else
      error
    end
  end
end

MainControler.new.selected_option